import 'package:meta/meta.dart';

/// Утилиты работы с датами.
///
/// См. также [Utils].
class DateUtils {

  ///判断a和b两个时间是否是同一天
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// Returns [DateTime] for the beginning of the day (00:00:00).
  ///
  /// (2020, 4, 9, 16, 50) -> (2020, 4, 9, 0, 0)
  static DateTime startOfDay(DateTime dateTime) =>
      _date(dateTime.isUtc, dateTime.year, dateTime.month, dateTime.day);

  /// Returns [DateTime] for the beginning of the next day (00:00:00).
  ///
  /// (2020, 4, 9, 16, 50) -> (2020, 4, 10, 0, 0)
  static DateTime startOfNextDay(DateTime dateTime) =>
      _date(dateTime.isUtc, dateTime.year, dateTime.month, dateTime.day + 1);

  /// Returns [DateTime] for the beginning of today (00:00:00).
  static DateTime startOfToday() => startOfDay(DateTime.now());

  /// Creates a copy of [date] but with time replaced with the new values.
  static DateTime setTime(DateTime date, int hours, int minutes,
          [int seconds = 0, int milliseconds = 0, int microseconds = 0]) =>
      _date(date.isUtc, date.year, date.month, date.day, hours, minutes,
          seconds, milliseconds, microseconds);

  /// Creates a copy of [date] but with the given fields
  /// replaced with the new values.
  static DateTime copyWith(DateTime date,
          {int year,
          int month,
          int day,
          int hour,
          int minute,
          int second,
          int millisecond,
          int microsecond}) =>
      _date(
          date.isUtc,
          year ?? date.year,
          month ?? date.month,
          day ?? date.day,
          hour ?? date.hour,
          minute ?? date.minute,
          second ?? date.second,
          millisecond ?? date.millisecond,
          microsecond ?? date.microsecond);

  /// Returns a number of the next month.
  static int nextMonth(DateTime date) {
    final month = date.month;
    return month == DateTime.monthsPerYear ? 1 : month + 1;
  }

  /// Returns the [DateTime] resulting from adding the given number
  /// of months to this [DateTime].
  ///
  /// The result is computed by incrementing the month parts of this
  /// [DateTime] by months months, and, if required, adjusting the day part
  /// of the resulting date downwards to the last day of the resulting month.
  ///
  /// For example:
  /// (2020, 12, 31) -> add 2 months -> (2021, 2, 28).
  /// (2020, 12, 31) -> add 1 month -> (2021, 1, 31).
  static DateTime addMonths(DateTime date, int months) {
    var res = DateUtils.copyWith(date, month: date.month + months);
    if (date.day != res.day) res = DateUtils.copyWith(res, day: 0);
    return res;
  }

  /// Returns week number in year.
  ///
  /// The first week of the year is the week that contains
  /// 4 or more days of that year (='First 4-day week').
  ///
  /// So if week contains less than 4 days - it's in another year.
  ///
  /// The highest week number in a year is either 52 or 53.
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  static int getWeekNumber(DateTime date, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    if (isWeekInYear(date, date.year, firstWeekday)) {
      final startOfTheFirstWeek =
          firstDayOfFirstWeek(date.year, firstWeekday: firstWeekday);
      final diffInDays = getDaysDifference(date, startOfTheFirstWeek);
      return (diffInDays / DateTime.daysPerWeek).floor() + 1;
    } else if (date.month == DateTime.december) {
      // first of the next year
      return 1;
    } else {
      // last of the previous year
      return getWeekNumber(DateTime(date.year - 1, DateTime.december, 31),
          firstWeekday: firstWeekday);
    }
  }

  /// Returns number of the last week in [year].
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  ///
  /// See [getWeekNumber].
  static int getLastWeekNumber(int year, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    final start = firstDayOfFirstWeek(year, firstWeekday: firstWeekday);
    final end = firstDayOfWeek(DateTime(year, DateTime.december, 31),
        firstWeekday: firstWeekday);
    final diffInDays = getDaysDifference(end, start);
    var res = diffInDays ~/ DateTime.daysPerWeek;
    if (isWeekInYear(end, year, firstWeekday)) res++;
    return res;
  }

  /// Returns number of the day in week (starting with 1).
  ///
  /// Difference from [DateTime.weekday] is that
  /// you can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  ///
  static int getDayNumberInWeek(DateTime date, {int firstWeekday}) {
    var res = date.weekday - (firstWeekday ?? DateTime.monday) + 1;
    if (res <= 0) res += DateTime.daysPerWeek;

    return res;
  }

  /// Returns number of the day in year.
  ///
  /// Starting with 1.
  static int getDayNumberInYear(DateTime date) {
    final firstDayOfYear = DateTime(date.year, DateTime.january, 1);
    return getDaysDifference(date, firstDayOfYear) + 1;
  }

  /// Returns the number of days in a given year.
  static int getDaysInYear(int year) {
    final lastDayOfYear = DateTime(year, DateTime.december, 31);
    return getDayNumberInYear(lastDayOfYear);
  }

  /// Returns count of days between two dates.
  ///
  /// Time will be ignored, so for the dates
  /// (2020, 11, 18, 16, 50) and (2020, 11, 19, 10, 00)
  /// result will be 1.
  ///
  /// Use this method for count days instead of
  /// `a.difference(b).inDays`, since it can return
  /// some unexpected result, because of daylight saving hour.
  static int getDaysDifference(DateTime a, DateTime b) {
    final straight = a.isBefore(b);
    final start = startOfDay(straight ? a : b);
    final end = startOfDay(straight ? b : a).add(const Duration(hours: 12));
    final diff = end.difference(start);
    return diff.inHours ~/ 24;
  }

  /// Checks if [day] is in the first day of a week.
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  static bool isFirstDayOfWeek(DateTime day, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    return isSameDay(firstDayOfWeek(day, firstWeekday: firstWeekday), day);
  }

  /// Checks if [day] is in the last day of a week.
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday],
  /// so the last day will be [DateTime.sunday].
  static bool isLastDayOfWeek(DateTime day, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    return isSameDay(lastDayOfWeek(day, firstWeekday: firstWeekday), day);
  }

  /// Checks if [day] is in the first day of a month.
  static bool isFirstDayOfMonth(DateTime day) {
    return day.day == 1;
  }

  /// Checks if [day] is in the last day of a month.
  static bool isLastDayOfMonth(DateTime day) {
    return nextDay(day).month != day.month;
  }

  /// Returns start of the first day of the week for specified [dateTime].
  ///
  /// For example: (2020, 4, 9, 15, 16) -> (2020, 4, 6, 0, 0, 0, 0).
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  static DateTime firstDayOfWeek(DateTime dateTime, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    var days = dateTime.weekday - (firstWeekday ?? DateTime.monday);
    if (days < 0) days += DateTime.daysPerWeek;

    return _date(
        dateTime.isUtc, dateTime.year, dateTime.month, dateTime.day - days);
  }

  /// Returns start of the first day of the first week in [year].
  ///
  /// For example: (2020, 4, 9, 15, 16) -> (2019, 12, 30, 0, 0, 0, 0).
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday].
  ///
  /// See [getWeekNumber].
  static DateTime firstDayOfFirstWeek(int year, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    final startOfYear = DateTime(year);
    return isWeekInYear(startOfYear, year, firstWeekday)
        ? firstDayOfWeek(startOfYear, firstWeekday: firstWeekday)
        : firstDayOfNextWeek(startOfYear, firstWeekday: firstWeekday);
  }

  /// Returns start of the first day of the next week for specified [dateTime].
  ///
  /// For example: (2020, 4, 9, 15, 16) -> (2020, 4, 13, 0, 0, 0, 0).
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  /// By default it's [DateTime.monday].
  static DateTime firstDayOfNextWeek(DateTime dateTime, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    var days = dateTime.weekday - (firstWeekday ?? DateTime.monday);
    if (days >= 0) days -= DateTime.daysPerWeek;
    return _date(
        dateTime.isUtc, dateTime.year, dateTime.month, dateTime.day - days);
  }

  /// Returns start of the last day of the week for specified [dateTime].
  ///
  /// For example: (2020, 4, 9, 15, 16) -> (2020, 4, 12, 0, 0, 0, 0).
  ///
  /// You can define first weekday (Monday, Sunday or Saturday) with
  /// parameter [firstWeekday]. It should be one of the constant values
  /// [DateTime.monday], ..., [DateTime.sunday].
  ///
  /// By default it's [DateTime.monday],
  /// so the last day will be [DateTime.sunday].
  static DateTime lastDayOfWeek(DateTime dateTime, {int firstWeekday}) {
    assert(firstWeekday == null || firstWeekday > 0 && firstWeekday < 8);

    var days = (firstWeekday ?? DateTime.monday) - 1 - dateTime.weekday;
    if (days < 0) days += DateTime.daysPerWeek;

    return _date(
        dateTime.isUtc, dateTime.year, dateTime.month, dateTime.day + days);
  }

  /// Returns [DateTime] that represents a beginning
  /// of the first day of the month containing [date].
  ///
  /// Example: (2020, 4, 9, 15, 16) -> (2020, 4, 1, 0, 0, 0, 0).
  static DateTime firstDayOfMonth(DateTime date) {
    return _date(date.isUtc, date.year, date.month);
  }

  /// Returns [DateTime] that represents a beginning
  /// of the first day of the next month.
  ///
  /// Example: (2020, 4, 9, 15, 16) -> (2020, 5, 1, 0, 0, 0, 0).
  static DateTime firstDayOfNextMonth(DateTime dateTime) {
    final month = dateTime.month;
    final year = dateTime.year;
    final nextMonthStart = (month < DateTime.monthsPerYear)
        ? _date(dateTime.isUtc, year, month + 1, 1)
        : _date(dateTime.isUtc, year + 1, 1, 1);
    return nextMonthStart;
  }

  /// Returns [DateTime] that represents a beginning
  /// of the last day of the month containing [date].
  ///
  /// Example: (2020, 4, 9, 15, 16) -> (2020, 4, 30, 0, 0, 0, 0).
  static DateTime lastDayOfMonth(DateTime dateTime) {
    return previousDay(firstDayOfNextMonth(dateTime));
  }

  /// Returns [DateTime] that represents a beginning
  /// of the first day of the year containing [date].
  ///
  /// Example: (2020, 3, 9, 15, 16) -> (2020, 1, 1, 0, 0, 0, 0).
  static DateTime firstDayOfYear(DateTime dateTime) {
    return _date(dateTime.isUtc, dateTime.year, 1, 1);
  }

  /// Returns [DateTime] that represents a beginning
  /// of the first day of the next year.
  ///
  /// Example: (2020, 3, 9, 15, 16) -> (2021, 1, 1, 0, 0, 0, 0).
  static DateTime firstDayOfNextYear(DateTime dateTime) {
    return _date(dateTime.isUtc, dateTime.year + 1, 1, 1);
  }

  /// Returns [DateTime] that represents a beginning
  /// of the last day of the year containing [date].
  ///
  /// Example: (2020, 4, 9, 15, 16) -> (2020, 12, 31, 0, 0, 0, 0).
  static DateTime lastDayOfYear(DateTime dateTime) {
    return _date(dateTime.isUtc, dateTime.year, DateTime.december, 31);
  }

  /// Проверяет является ли заданная дата текущей.
  static bool isCurrentDate(DateTime date) {
    final now = DateTime.now();
    return isSameDay(date, now);
  }

  /// Returns number of days in the [month] of the [year].
  static int getDaysInMonth(int year, int monthNum) {
    assert(monthNum > 0);
    assert(monthNum <= 12);
    return DateTime(year, monthNum + 1, 0).day;
  }

  /// Returns same time in the next day.
  static DateTime nextDay(DateTime d) {
    return copyWith(d, day: d.day + 1);
  }

  /// Returns same time in the previous day.
  static DateTime previousDay(DateTime d) {
    return copyWith(d, day: d.day - 1);
  }

  /// Returns same date in the next year.
  static DateTime nextYear(DateTime d) {
    return _date(d.isUtc, d.year + 1, d.month, d.day);
  }

  /// Returns same date in the previous year.
  static DateTime previousYear(DateTime d) {
    return _date(d.isUtc, d.year - 1, d.month, d.day);
  }

  /// Returns an iterable of [DateTime] with 1 day step in given range.
  ///
  /// [start] is the start of the rande, inclusive.
  /// [end] is the end of the range, exclusive.
  ///
  /// If [start] equals [end], than [start] still will be included in interbale.
  /// If [start] less than [end], than empty interable will be returned.
  ///
  /// [DateTime] in result uses [start] timezone.
  static Iterable<DateTime> generateWithDayStep(
      DateTime start, DateTime end) sync* {
    if (end.isBefore(start)) return;

    var date = start;
    do {
      yield date;
      date = nextDay(date);
    } while (date.isBefore(end));
  }

  /// Checks if week, that contains [date] is in [year].
  @visibleForTesting
  static bool isWeekInYear(DateTime date, int year, int firstWeekday) {
    const requiredDaysInYear = 4;
    final startWeekDate = firstDayOfWeek(date, firstWeekday: firstWeekday);
    final endWeekDate = lastDayOfWeek(date, firstWeekday: firstWeekday);

    if (startWeekDate.year == year && endWeekDate.year == year) {
      return true;
    } else if (endWeekDate.year == year) {
      final startYearDate = DateTime(year, DateTime.january, 1);
      final daysInPrevYear = getDaysDifference(startYearDate, startWeekDate);
      return daysInPrevYear < requiredDaysInYear;
    } else if (startWeekDate.year == year) {
      final startNextYearDate = DateTime(year + 1, DateTime.january, 1);
      final daysInNextYear =
          getDaysDifference(endWeekDate, startNextYearDate) + 1;
      return daysInNextYear < requiredDaysInYear;
    } else {
      return false;
    }
  }

  static DateTime _date(bool utc, int year,
          [int month = 1,
          int day = 1,
          int hour = 0,
          int minute = 0,
          int second = 0,
          int millisecond = 0,
          int microsecond = 0]) =>
      utc
          ? DateTime.utc(
              year, month, day, hour, minute, second, millisecond, microsecond)
          : DateTime(
              year, month, day, hour, minute, second, millisecond, microsecond);

  DateUtils._();
}
