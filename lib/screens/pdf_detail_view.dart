import 'package:cyberpress_machinetest/core/constants/images.dart';
import 'package:flutter/material.dart';

class PdfDetailsView extends StatefulWidget {
  const PdfDetailsView({super.key});

  @override
  State<PdfDetailsView> createState() => _PdfDetailsViewState();
}

class _PdfDetailsViewState extends State<PdfDetailsView> {
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "PDF VIEW",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Patient Details",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              rowWidget("Name", "John"),
              rowWidget('Age', "22"),
              rowWidget("Email", "abscd@gmail.com"),
              rowWidget("Phone", "8606936845"),
              rowWidget("Notes", "Dental cares"),
              const SizedBox(height: 25),
              const Divider(
                color: Colors.black,
                endIndent: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Doctor Details",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                    child: Image.asset(
                      AppImages.doctorImage,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John M",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "Pediatritian",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Gender : Male",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Time : 10AM - 12PM",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Location : New Jersy",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(":"),
          const SizedBox(
            width: 15,
          ),
          Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
