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
}

enum UIStateStatus { idle, loading, success, error }
