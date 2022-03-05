import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/components/custom_alert_dialog.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:assignment/view/home/home_screen/service/blog_network_service.dart';
import 'package:assignment/view/home/profile/service/account_network_service.dart';
import 'package:assignment/view/home/profile/service/location_service.dart';
import 'package:assignment/view/home/profile/viewmodel/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Position? position;
  LoginViewModel? _loginViewModel;
  AccountViewModel? _accountViewModel;
  final ImagePicker _picker = ImagePicker();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginViewModel = Provider.of<LoginViewModel>(context);
    _accountViewModel = Provider.of<AccountViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    final geoLocationService = GeoLocationService();

    var body = {
      'Email': 'cengtest@gmail.com',
      'Password': '123456',
      'PasswordRetry': '123456',
    };
    final size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: _getDecoration(context, 100, Colors.white),
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Observer(builder: (_) {
                    if (!_accountViewModel!.isAccountImageEmpty) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              _accountViewModel!.getAccountImage,
                            ),
                          ),
                        ),
                        child: IconButton(
                          tooltip: 'Fotoğraf yükle',
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: size.height * 0.03,
                          ),
                          onPressed: () async {
                            await showCameraModal(context, size);
                          },
                        ),
                      );
                    }
                    return Container(
                      decoration: _getDecoration(context, 100, Colors.white),
                      child: IconButton(
                        tooltip: 'Fotoğraf yükle',
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: size.height * 0.03,
                        ),
                        onPressed: () async {
                          await showCameraModal(context, size);
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.2,
              width: 350,
              decoration: _getDecoration(context, 25, Colors.white),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.08,
              width: 350,
              decoration: _getDecoration(context, 15, Colors.white),
              child: TextButton(
                onPressed: (() async {
                  try {
                    position = await geoLocationService.getCurrentLocation();
                    _accountViewModel?.setLocation(
                      position?.longitude.toString() ?? "",
                      position?.latitude.toString() ?? "",
                    );
                    _accountViewModel?.updateAccountInfo(context);
                  } catch (err) {
                    bool isPermissionRelatedError = err.toString().contains('permission');
                    showCustomErrorDialog(
                      context,
                      err.toString(),
                      isPermissionRelatedError ? Geolocator.openAppSettings : Geolocator.openLocationSettings,
                    );
                  }
                }),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 0.08,
              width: 350,
              decoration: _getDecoration(context, 15, Colors.grey.shade900),
              child: TextButton(
                onPressed: (() {
                  _loginViewModel?.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                  // TODO: çıkış yap
                }),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showCameraModal(BuildContext context, Size size) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Observer(builder: (_) {
                if (!_accountViewModel!.isAccountImageEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                        height: size.width * 0.8,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_accountViewModel?.getAccountImage ?? ''),
                          ),
                        )),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: size.width * 0.8,
                      width: size.width * 0.8,
                      decoration: _getDecoration(context, 15, Colors.grey.shade300),
                    ),
                  );
                  ;
                }
              }),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: _getDecoration(context, 15, Colors.grey.shade900),
                      width: size.width * 0.35,
                      child: TextButton(
                        child: const Text(
                          'Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                size = MediaQuery.of(context).size;
                                return AlertDialog(
                                  title: const Center(
                                    child: Text('Select a Picture'),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: _getDecoration(context, 15, Colors.grey.shade900),
                                          width: size.width * 0.9,
                                          child: TextButton(
                                            child: const Text(
                                              'Camera',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                            onPressed: () async {
                                              final pickedFile =
                                                  await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
                                              if (pickedFile != null) {
                                                await _accountViewModel?.uploadAccountImage(context, pickedFile.path);
                                              }
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: size.height * 0.02),
                                          child: Container(
                                            decoration: _getDecoration(context, 15, Colors.white),
                                            width: size.width * 0.9,
                                            child: TextButton(
                                              child: Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              onPressed: () async {
                                                final pickedFile = await _picker.pickImage(
                                                    source: ImageSource.gallery, imageQuality: 50);
                                                if (pickedFile != null) {
                                                  await _accountViewModel?.uploadAccountImage(context, pickedFile.path);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                    Container(
                      decoration: _getDecoration(context, 15, Colors.white),
                      width: size.width * 0.35,
                      child: TextButton(
                        child: const Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                          if (pickedFile != null) {
                            // _accountViewModel?.setImage(pickedFile.path);
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  BoxDecoration _getDecoration(BuildContext context, double radius, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
      border: Border.all(
        color: Colors.grey.shade900,
        width: 1,
      ),
    );
  }
}
