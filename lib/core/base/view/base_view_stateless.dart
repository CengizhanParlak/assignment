import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class StatelessBaseView<T extends Store> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;
  final T? model;

  const StatelessBaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPageBuilder(context, model!);
  }
}
