class ApiResult<T> {
  Status status;
  T data;
  String message;

  ApiResult.completed(this.data) : status = Status.COMPLETED;

  ApiResult.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { COMPLETED, ERROR }
