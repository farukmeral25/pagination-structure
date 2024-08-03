import 'package:flutter/material.dart';
import 'package:pagination_structure/core/shared/consumer_app_widget_state_builder.dart';
import 'package:pagination_structure/core/utils/pagination/dto/pagination_dto.dart';
import 'package:pagination_structure/feature/home/domain/dto/task_dto.dart';
import 'package:pagination_structure/feature/home/viewmodel/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ConsumerAppWidgetStateBuilder<HomeViewModel, PaginationDto<TaskDto>>(
        builder: (paginationDto, provider) => ListView.builder(
          controller: provider.scrollController,
          itemBuilder: (context, index) => ListTile(
            title: Text(paginationDto.list[index].title),
            subtitle: Text(paginationDto.list[index].subtitle),
          ),
          itemCount: paginationDto.list.length,
        ),
        response: (homeViewModel) => homeViewModel.paginationDto,
      ),
    );
  }
}
