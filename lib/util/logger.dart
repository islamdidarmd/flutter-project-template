class Log {
  static bool shouldLog = true;

  static init({bool? shouldLog}) {
    Log.shouldLog = shouldLog ?? Log.shouldLog;
  }

  static info(dynamic message) {
    if (shouldLog) {
      print('INFO: $message');
    }
  }
}
