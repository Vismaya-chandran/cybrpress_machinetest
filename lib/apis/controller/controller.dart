import 'dart:developer';

import 'package:cyberpress_machinetest/apis/models/doctors_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController extends GetxController {
  var isLoading = true.obs;
  var doctorList = <DoctorsModel>[].obs;
  var filteredList = <DoctorsModel>[].obs;

  var selectedGender = ''.obs;
  var selectedConsultingTime = ''.obs;

  void fetchDoctors() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse('http://65.2.162.150/api/v1/test/getAllDoctors'),
        headers: {
          'Authorization':
              '''Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRlZmE3NjQxOTgyODcyYTNiYWVkNTYiLCJpYXQiOjE3MjQzMjgzMDMsImV4cCI6MTc1NTg2NDMwM30.CCDbn8FR5_XOsN5yQdDlhIxzSh_AlvwFGHmhEHH9IkE''',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;

        doctorList.value =
            jsonData.map((post) => DoctorsModel.fromJson(post)).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  void getDoctorDetails(String id) async {
    try {
      isLoading(true);
      var response = await http.post(
        Uri.parse('http://65.2.162.150/api/v1/test/getSingleDoctor'),
        body: {"_id": id},
        headers: {
          'Authorization':
              '''Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGRlZmE3NjQxOTgyODcyYTNiYWVkNTYiLCJpYXQiOjE3MjQzMjgzMDMsImV4cCI6MTc1NTg2NDMwM30.CCDbn8FR5_XOsN5yQdDlhIxzSh_AlvwFGHmhEHH9IkE''',
        },
      );
      log(response.body);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        log("response.body");
        // doctorsList.value =
        //     jsonData.map((post) => DoctorsModel.fromJson(post)).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  void filterDoctors() {
    doctorList.value = doctorList.where((doctor) {
      bool matchesGender =
          selectedGender.value.isEmpty || doctor.gender == selectedGender.value;
      bool matchesTime = selectedConsultingTime.value.isEmpty ||
          "${doctor.consultationTime.start}AM - ${doctor.consultationTime.end}PM" ==
              selectedConsultingTime.value;
      return matchesGender && matchesTime;
    }).toList();
  }
}
