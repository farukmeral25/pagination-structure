import 'package:flutter/material.dart';
import 'package:pagination_structure/core/init/providers.dart';
import 'package:pagination_structure/feature/home/view/page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: AppProviders.providers,
    child: const PaginationStructureApp(),
  ));
}

class PaginationStructureApp extends StatelessWidget {
  const PaginationStructureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
