import 'package:flutter/material.dart';
import 'package:pagination_structure/core/shared/app_widget_state_builder.dart';
import 'package:pagination_structure/core/utils/ui_state.dart';
import 'package:provider/provider.dart';

class ConsumerAppWidgetStateBuilder<T extends ChangeNotifier, K> extends StatelessWidget {
  const ConsumerAppWidgetStateBuilder({
    super.key,
    required this.builder,
    required this.response,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
  });

  final Widget Function(K, T) builder;
  final UIState<K> Function(T) response;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, T provider, child) {
        return AppWidgetBuilderByState<K>(
          errorWidget: errorWidget,
          idleWidget: idleWidget,
          loadingWidget: loadingWidget,
          response: response(provider),
          builder: (data) => builder(data, provider),
        );
      },
    );
  }
}
