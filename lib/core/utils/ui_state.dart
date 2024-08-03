class UIState<T> {
  late UIStateStatus status;
  late T data;
  late String error;

  UIState.idle() : status = UIStateStatus.idle;
  UIState.loading() : status = UIStateStatus.loading;
  UIState.success(this.data) : status = UIStateStatus.success;
  UIState.error(this.error) {
    status = UIStateStatus.error;

    //Sentry'e gönder.
    //Firebase Exception gönder.
    //Exception Logger'larına gönder. Bilgilendir.
  }

  bool get isIdle => status == UIStateStatus.idle;
  bool get isLoading => status == UIStateStatus.loading;
  bool get isSuccess => status == UIStateStatus.success;
  bool get isError => status == UIStateStatus.error;
}

enum UIStateStatus { idle, loading, success, error }
