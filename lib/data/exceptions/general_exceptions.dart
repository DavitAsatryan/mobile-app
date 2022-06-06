class NoInternetException implements Exception {
  final String? message;
  NoInternetException({this.message});

  @override
  String toString() {
    return message ?? 'You are not connected to the internet.';
  }
}

class BadRequestException implements Exception {
  final String? message;
  BadRequestException({this.message});

  @override
  String toString() {
    return message ?? 'Bad Request';
  }
}

class UnauhtorizedException implements Exception {
  final String? message;
  UnauhtorizedException({this.message});

  @override
  String toString() {
    return message ?? 'You are not authenticated';
  }
}

class EntityTooLargeException implements Exception {
  final String? message;
  EntityTooLargeException({this.message});

  @override
  String toString() {
    return message ?? 'Selected media is too large';
  }
}

class UserNotFoundException implements Exception {
  final String? message;
  UserNotFoundException({this.message});

  @override
  String toString() {
    return message ?? 'User not found';
  }
}

class GoogleSignInException implements Exception {
  final String? message;
  GoogleSignInException({this.message});

  @override
  String toString() {
    return message ?? 'Authentication with google failed';
  }
}

class FacebookSignInException implements Exception {
  final String? message;
  FacebookSignInException({this.message});

  @override
  String toString() {
    return message ?? 'Authentication with facebook failed';
  }
}

class AppleSignInException implements Exception {
  final String? message;
  AppleSignInException({this.message});

  @override
  String toString() {
    return message ?? 'Authentication with apple failed';
  }
}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});

  @override
  String toString() {
    return message ?? 'Server isnt currently available.';
  }
}

class UnknownException implements Exception {
  final String? message;
  UnknownException({this.message});

  @override
  String toString() {
    return message ?? 'Unknown Problem!! Contact support if it happens again';
  }
}
