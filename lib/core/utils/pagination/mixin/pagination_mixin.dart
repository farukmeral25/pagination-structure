import 'package:flutter/material.dart';
import 'package:pagination_structure/core/utils/base_viewmodel.dart';
import 'package:pagination_structure/core/utils/pagination/dto/pagination_dto.dart';
import 'package:pagination_structure/core/utils/ui_state.dart';

mixin PaginationMixin<T> on BaseViewModel {
  UIState<PaginationDto<T>> paginationDto = UIState.idle();

  ScrollController scrollController = ScrollController();

  int pageNumber = 1;

  int get totalPageCount => paginationDto.data.totalPageCount;

  bool isPaginationLoading = false;

  Future<void> loadMore();

  Future<void> _loadMore() async {
    if (totalPageCount < pageNumber) return;

    isPaginationLoading = true;
    _increasePageNumber();
    await loadMore();
    isPaginationLoading = false;
  }

  void _increasePageNumber() => pageNumber++;

  void resetPagination() => pageNumber = 1;

  @override
  void init() {
    scrollController.addListener(() {
      if (totalPageCount == pageNumber) return;

      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }
}
