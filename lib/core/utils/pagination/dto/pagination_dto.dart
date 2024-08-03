class PaginationDto<T> {
  final int totalItemCount;
  final int totalPageCount;
  final List<T> list;

  PaginationDto({
    required this.totalItemCount,
    required this.totalPageCount,
    required this.list,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return PaginationDto<T>(
      totalItemCount: json['totalItemCount']?.toInt() ?? 0,
      totalPageCount: json['totalPageCount']?.toInt() ?? 0,
      list: (json["items"] as List<dynamic>).map((e) => fromJsonT(e)).toList(),
    );
  }
}
