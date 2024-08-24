import 'package:cyberpress_machinetest/apis/controller/controller.dart';
import 'package:cyberpress_machinetest/apis/models/doctors_model.dart';
import 'package:cyberpress_machinetest/core/constants/images.dart';
import 'package:cyberpress_machinetest/screens/doctors_detail_view.dart';
import 'package:cyberpress_machinetest/screens/filter_dialog.dart';
import 'package:cyberpress_machinetest/screens/pdf_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsListView extends StatefulWidget {
  const DoctorsListView({super.key});

  @override
  State<DoctorsListView> createState() => _DoctorsListViewState();
}

class _DoctorsListViewState extends State<DoctorsListView> {
  late ApiController controller;

  @override
  void initState() {
    controller = Get.put(ApiController());
    controller.fetchDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const SizedBox(),
          centerTitle: true,
          title: const Text(
            "Doctors",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfListView(),
                    ));
              },
              child: Image.asset(
                AppImages.pdfIcon,
                height: 20,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterDialog(
                      controller: controller,
                    );
                  },
                );
              },
              child: Image.asset(
                AppImages.filterIcon,
                color: Colors.white,
                height: 20,
              ),
            ),
            const SizedBox(
              width: 25,
            )
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else {
            return SizedBox(
                height: kSize.height,
                width: kSize.width,
                child: ListView.builder(
                  itemCount: controller.doctorList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return doctorDataTile(controller.doctorList[index]);
                  },
                ));
          }
        }));
  }

  Widget doctorDataTile(DoctorsModel doctors) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorsDetailsView(doctorDetails: doctors),
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Image.asset(
                AppImages.doctorImage,
                height: 60,
                color: Colors.grey,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors.name,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  doctors.specialization,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "Gender : ${doctors.gender}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Time : ${doctors.consultationTime.start}AM - ${doctors.consultationTime.end}PM",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "Location : ${doctors.address.location}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
