
class PaginationResult<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;
  final bool hasNextPage;

  PaginationResult({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.hasNextPage,
  });
}

class PaginationService<T> {
  final Future<List<T>> Function(
    int page,
    int limit,
  ) fetchData;

  final int limit;

  int currentPage = 1;
  bool hasNextPage = true;

  PaginationService({
    required this.fetchData,
    this.limit = 10,
  });

  Future<PaginationResult<T>> loadPage() async {
    final result = await fetchData(
      currentPage,
      limit,
    );

    hasNextPage = result.length == limit;

    return PaginationResult<T>(
      data: result,
      currentPage: currentPage,
      totalPages: 0,
      hasNextPage: hasNextPage,
    );
  }

  Future<PaginationResult<T>> nextPage() async {
    if (hasNextPage) {
      currentPage++;
    }

    return loadPage();
  }

  Future<PaginationResult<T>> prevPage() async {
    if (currentPage > 1) {
      currentPage--;
    }

    return loadPage();
  }

  void reset() {
    currentPage = 1;
    hasNextPage = true;
  }
}