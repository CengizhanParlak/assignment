import 'package:flutter/material.dart';

abstract class BaseState<T extends StatelessWidget> {
  BuildContext? context;

  void initContext(context) => this.context = context;

  double dynamicHeight(double value) => MediaQuery.of(context!).size.height * value;
  double dyanmicWidth(double value) => MediaQuery.of(context!).size.width * value;
}
