import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class StatefulBaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const StatefulBaseView(
      {Key? key, required this.viewModel, required this.onPageBuilder, required this.onModelReady, this.onDispose})
      : super(key: key);

  @override
  _StatefulBaseViewState<T> createState() => _StatefulBaseViewState<T>();
}

class _StatefulBaseViewState<T extends Store> extends State<StatefulBaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
