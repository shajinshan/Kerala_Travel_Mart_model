import 'package:intl/intl.dart';

class Venue {
  String id;
  String name;
  String description;
  List<DateTime> dateTime;
  String category;
  String image;
  String locationUrl;

  Venue(
      {required this.id,
      required this.name,
      required this.description,
      required this.dateTime,
      required this.category,
      required this.image,
      required this.locationUrl});

  String getFormattedDate() {
    return dateTime
        .map((date) => DateFormat('d-M-yyyy').format(date))
        .join(', ');
  }
}
