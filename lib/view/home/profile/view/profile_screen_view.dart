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
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              decoration: _getDecoration(context, 100, Colors.white),
              height: size.height * 0.1,
              width: size.height * 0.1,
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
              height: size.height * 0.1,
              width: 350,
              decoration: _getDecoration(context, 15, Colors.white),
              child: TextButton(
                onPressed: (() async {
                  try {
                    position = await geoLocationService.getCurrentLocation();
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
              height: 65,
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
