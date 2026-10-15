import 'package:logger/logger.dart';

// Логирование событий различного уровня { error, info, debug}
// Автор создания: 1
// Дата создания: 15.10.2026

class Logging {
  var log = Logger();

  // Форматирование сообщений в консоль
  // Входные параметры: тег, событие, детали
  // Выходные данные: формат сообщения
  String _format(String tag, String event, String details) {
    return '[$tag]: $event - $details';
  }

  // Лог уровня debug
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void debug(String tag, String event, String details) {
    log.d(_format(tag, event, details));
  }

  // Лог уровня info
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void info(String tag, String event, String details) {
    log.i(_format(tag, event, details));
  }

  // Лог уровня error
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void error(String tag, String event, String details, var error) {
    log.e(_format(tag, event, details), error: error);
  }
}
