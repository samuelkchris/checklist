class Reminder {
  String title;
  String description;
  String date;
  String time;
  var userLocation;

  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }

  Reminder(
      {required this.title,
      required this.description,
      required this.date,
      required this.time,
      this.userLocation,
      this.isDone = false});
}
