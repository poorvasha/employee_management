class AsyncWrapper<T> {
  bool isLoading = false;
  T? data;
  AsyncWrapper(this.isLoading, this.data);
}
