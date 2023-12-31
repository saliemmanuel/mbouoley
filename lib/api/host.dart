class Host {
  static var host = 'http://192.168.137.1:3366';
  // static var host = 'https://bw-image.000webhostapp.com';

  Uri baseUrl({String? endpoint}) => Uri.parse("$host/$endpoint");
  String baseUrl2({String? endpoint}) => "$host/api/$endpoint";

  Map<String, String> headers(String bearer) =>
      {"Accept": "application/json", "Authorization": "Bearer $bearer"};
}
