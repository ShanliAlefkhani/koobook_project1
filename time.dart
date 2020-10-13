class Time {
  int day;
  int hour;
  int minute;
  bool b = true;

  Time(this.day, this.hour, this.minute);

  void minus() {
    if (minute != 0) {
      minute--;
    } else if (hour != 0) {
      hour--;
      minute = 59;
    } else if (day != 0) {
      day--;
      hour = 23;
      minute = 59;
    } else {
      b = false;
      minute = 1;
    }
  }

  void plus() {
    if (minute < 59) {
      minute++;
    } else if (hour < 23) {
      hour++;
      minute = 0;
    } else {
      day++;
      hour = 0;
      minute = 0;
    }
  }

  @override
  String toString() {
    return day.toString() +
        ":" +
        hour.toString().padLeft(2, '0') +
        ":" +
        minute.toString().padLeft(2, '0');
  }
}
