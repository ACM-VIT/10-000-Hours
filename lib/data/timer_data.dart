class TimerData {
  int hours = 0, minutes = 0, seconds = 0;
  TimerData(hours, minutes, seconds);

  updateData(int hr, int min, int sec) {
    hours = hr;
    minutes = min;
    seconds = sec;
  }

  int getHour() {
    return hours;
  }

  int getMinutes() {
    return minutes;
  }

  int getSeconds() {
    return seconds;
  }
}
