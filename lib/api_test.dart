import 'dart:convert';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:assignment/view/home/profile/service/account_screen_network_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTestScreen extends StatelessWidget {
  const ApiTestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var body = {
      'Email': 'cengtest@gmail.com',
      'Password': '123456',
      'PasswordRetry': '123456',
    };
    final size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Signin'),
            ),
            TextButton(
              onPressed: () {
                // http.get(url)
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () async {},
              child: const Text('Get Blogs'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Get Blogs by Category'),
            ),
            TextButton(
              onPressed: () {
                var networkService = AccountScreenNetworkService();
                networkService.getAccountInfo(ApiConstants.TEST_TOKEN)?.then((account) {
                  print(account.toJson());
                });
              },
              child: const Text('Get Account Info'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Get Blogs by Category'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Get Blogs by Category'),
            ),
          ],
        ),
      ),
    );
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.only(top: 50),
    //     child: Column(
    //       children: [
    //         Container(
    //           decoration: _getDecoration(context, 100, Colors.white),
    //           height: size.height * 0.1,
    //           width: size.height * 0.1,
    //         ),
    //         SizedBox(
    //           height: size.height * 0.05,
    //         ),
    //         Container(
    //           height: size.height * 0.2,
    //           width: 350,
    //           decoration: _getDecoration(context, 25, Colors.white),
    //         ),
    //         SizedBox(
    //           height: size.height * 0.05,
    //         ),
    //         Container(
    //           height: size.height * 0.1,
    //           width: 350,
    //           decoration: _getDecoration(context, 15, Colors.white),
    //           child: TextButton(
    //             onPressed: (() {
    //               // TODO: api isteği at
    //             }),
    //             child: Text(
    //               'Save',
    //               style: TextStyle(
    //                 color: Colors.grey.shade900,
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Container(
    //           height: 65,
    //           width: 350,
    //           decoration: _getDecoration(context, 15, Colors.grey.shade900),
    //           child: TextButton(
    //             onPressed: (() {
    //               Navigator.of(context).pushNamed('/login');
    //               // TODO: çıkış yap
    //             }),
    //             child: const Text(
    //               'Log Out',
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
