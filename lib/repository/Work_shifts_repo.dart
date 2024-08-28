import 'package:new_random/Models/Work_shifts_item.dart';

class WorkShiftsRepo {
  static final WorkShiftsRepo _singleton = WorkShiftsRepo._internal();

  factory WorkShiftsRepo() {
    return _singleton;
  }

  WorkShiftsRepo._internal();

  WorkShiftsItem getWeekend() {
    WorkShiftsItem day = WorkShiftsItem(
        title: 'Пятница - Суббота',
        zones: ['Холодосы', 'Центр', '2 Сервак', '1 Этаж', '1 Сервак']);
    return day;
  }

  WorkShiftsItem getMidWeek() {
    WorkShiftsItem day = WorkShiftsItem(
        title: 'Среда - Чеверг', zones: ['2 Сервак', '1 Этаж', '1 Сервак']);
    return day;
  }

  WorkShiftsItem getStartWeek() {
    WorkShiftsItem day = WorkShiftsItem(
        title: 'Воскресенье - Вторник', zones: ['1 Этаж', '1 Сервак']);
    return day;
  }

  WorkShiftsItem getOnltSecondFloor() {
    WorkShiftsItem day = WorkShiftsItem(
        title: 'Второй этаж', zones: ['Холодосы', 'Центр', '2 Сервак']);
    return day;
  }

  WorkShiftsItem getFourBartenders() {
    WorkShiftsItem day = WorkShiftsItem(
        title: '4 Шурика',
        zones: ['Холодосы', '2 Сервак', '1 Этаж', '1 Сервак']);
    return day;
  }

  WorkShiftsItem getOnlyOne() {
    WorkShiftsItem days = WorkShiftsItem(title: 'Лошок', zones: ['Лошок']);
    return days;
  }
}
