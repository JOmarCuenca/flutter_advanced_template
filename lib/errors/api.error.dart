class ConnectionError implements Exception {
  final String? message;

  const ConnectionError(this.message);

  @override
  String toString() => "ConnectionError => $message";
}

class BadCertificateException implements Exception {
  final String? message;

  const BadCertificateException(this.message);

  @override
  String toString() => "BadCertificateException => $message";
}

class BadResponseException implements Exception {
  final String? message;

  const BadResponseException(this.message);

  @override
  String toString() => "BadResponseException => $message";
}

class FetchCancelledException implements Exception {
  final String? message;

  const FetchCancelledException(this.message);

  @override
  String toString() => "FetchCancelledException => $message";
}
