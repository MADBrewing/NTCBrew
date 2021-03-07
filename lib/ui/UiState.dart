class UiState<T> {
  UiStatus status;
  T? data;
  ErrorState? errorState;

  UiState.loading() : status = UiStatus.LOADING;
  UiState.complete(this.data) : status = UiStatus.SUCCESS;
  UiState.error(this.errorState) : status = UiStatus.ERROR;
}


enum UiStatus { SUCCESS, ERROR, LOADING }

class ErrorState {
  Exception? exception;
  ErrorState();
}