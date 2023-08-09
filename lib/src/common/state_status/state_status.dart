enum StateStatus { initial, loading, error, success }

extension XStateStatus on StateStatus {
  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isError => this == StateStatus.error;
  bool get isSuccess => this == StateStatus.success;
}
