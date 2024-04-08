// ignore_for_file: non_constant_identifier_names

extension DateTimeExt on DateTime {
  String get calculateAge =>
      "${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year / ${DateTime.now().year - year} year";

  String get toView =>
      "${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year";

  String get DMYHM =>
      "${day.toString().padLeft(2, "0")}.${month.toString().padLeft(2, "0")}.$year ${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
}
