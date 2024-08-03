import 'package:pagination_structure/core/utils/pagination/dto/pagination_dto.dart';
import 'package:pagination_structure/core/utils/ui_state.dart';
import 'package:pagination_structure/feature/home/domain/dto/task_dto.dart';

abstract class IHomeService {
  Future<UIState<PaginationDto<TaskDto>>> fetchTasks();
}
