import 'dart:convert';
import 'package:http/http.dart' as http;


Future fetchStaffList() async {
  final response = await http.get(Uri.parse('http://m8itsolutions.in/mobilestaticapp/events/exhibitor/staff_list.json'));

  if (response.statusCode == 200) {
    final dynamic data = jsonDecode(response.body);
    var staffData = data["data"]["results"];

    return staffData;
  } else {
    throw Exception('Failed to fetch staff list');
  }
}

