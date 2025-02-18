class Company {
  String id;
  String companyName;
  String registerNumber;
  String date;

  String email;

  String phone;
  String websiteUrl;

  String city;
  String state;
  String pin;
  String country;
  String password;
  String highlights;

  Company(
      {required this.id,
      required this.companyName,
      required this.registerNumber,
      required this.date,
      required this.email,
      required this.phone,
      required this.websiteUrl,
      required this.city,
      required this.state,
      required this.pin,
      required this.country,
      required this.password,
      required this.highlights});
}
