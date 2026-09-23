import 'package:logger/logger.dart';

// Уровни логирования
enum LogLevel {info, debug, error}

// Инициализация логгера
// Логи всегда включены на уровне debug и выше
final appLogger = Logger(
  printer: SimplePrinter(colors: false, printTime: false),
  level: Level.debug
);

// Метод отображения лога
// Входящие данные: тэг, событие, детали и уровень лога
// Возвращаемые значения: форматирование лога// Автор создания: #
// Дата создания: ##.##.####

void appLog(String tag, String event, String details, {LogLevel level = LogLevel.info}) {
  final mes = '[$tag]: $event - $details';
  switch (level) {
    case LogLevel.debug:
      appLogger.d(mes);
      break;
    case LogLevel.info:
      appLogger.i(mes);
      break;
    case LogLevel.error:
      appLogger.e(mes);
      break;
  }
}