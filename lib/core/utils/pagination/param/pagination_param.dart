class PaginationParam {
  final int pageNumber;
  final int pageSize;

  PaginationParam({required this.pageNumber, required this.pageSize});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pageNumber': pageNumber});
    result.addAll({'pageSize': pageSize});

    return result;
  }
}
