import 'package:pagination_structure/core/utils/pagination/dto/pagination_dto.dart';
import 'package:pagination_structure/core/utils/ui_state.dart';
import 'package:pagination_structure/feature/home/domain/dto/task_dto.dart';
import 'package:pagination_structure/feature/home/domain/service/i_home_service.dart';

class HomeService implements IHomeService {
  @override
  Future<UIState<PaginationDto<TaskDto>>> fetchTasks() async {
    try {
      List<TaskDto> tasks = [];
      int toLenght = tasks.length + 20;
      //Request
      for (var i = tasks.length; i < toLenght; i++) {
        tasks.add(TaskDto(
          title: "Title ${i + 1}",
          subtitle: "Subtitle ${i + 1}",
        ));
      }

      return UIState.success(
        PaginationDto(
          totalItemCount: 200,
          totalPageCount: 10,
          list: tasks,
        ),
      );
    } catch (e) {
      return UIState.error("Data çekilirken hata oluştu. $e");
    }
  }
}
