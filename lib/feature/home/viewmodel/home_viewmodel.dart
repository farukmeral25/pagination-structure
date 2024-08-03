import 'package:pagination_structure/core/utils/base_viewmodel.dart';
import 'package:pagination_structure/core/utils/pagination/mixin/pagination_mixin.dart';
import 'package:pagination_structure/core/utils/ui_state.dart';
import 'package:pagination_structure/feature/home/data/service/home_service.dart';
import 'package:pagination_structure/feature/home/domain/dto/task_dto.dart';
import 'package:pagination_structure/feature/home/domain/service/i_home_service.dart';

class HomeViewModel extends BaseViewModel with PaginationMixin<TaskDto> {
  HomeViewModel() {
    fetchTasks();
  }

  IHomeService homeService = HomeService();

  @override
  Future<void> loadMore() async {
    final taskState = await homeService.fetchTasks();

    if (paginationDto.isSuccess) {
      paginationDto.data.list.addAll(taskState.data.list);
    } else {
      paginationDto = taskState;
    }

    notifyListeners();
  }

  Future<void> fetchTasks() async {
    paginationDto = UIState.loading();
    await Future.delayed(const Duration(seconds: 2));
    paginationDto = await homeService.fetchTasks();
    notifyListeners();
  }
}
