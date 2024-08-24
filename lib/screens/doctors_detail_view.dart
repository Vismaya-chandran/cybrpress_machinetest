import 'package:cyberpress_machinetest/apis/models/doctors_model.dart';
import 'package:cyberpress_machinetest/core/constants/images.dart';
import 'package:cyberpress_machinetest/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DoctorsDetailsView extends StatefulWidget {
  const DoctorsDetailsView({super.key, required this.doctorDetails});
  final DoctorsModel doctorDetails;
  @override
  State<DoctorsDetailsView> createState() => _DoctorsDetailsViewState();
}

class _DoctorsDetailsViewState extends State<DoctorsDetailsView> {
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Column(
          children: [
            Container(
              color: Colors.black54,
              height: 250,
              width: kSize.width,
              child: Image.asset(
                AppImages.doctorImage,
                height: 150,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            BackButton(
              onPressed: () {},
              color: Colors.white,
            ),
            doctorDetails(widget.doctorDetails)
          ],
        ),
      ),
    );
  }

  Widget doctorDetails(DoctorsModel doctor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doctor.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              Text(
                doctor.gender,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            doctor.specialization,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Text(
            "About",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          const SizedBox(height: 5),
          const Text(
            "The holder of an accredited acdemic degree. A medical practitioner, including: Audiologist. Dentist.Optometrist.Physician.Other roles.\n\n The holder of an accredited acdemic degree. A medical practitioner, including: Audiologist. Dentist.Optometrist.Physician.Other roles.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Time:",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text(
                "${doctor.consultationTime.start}:00 am - ${doctor.consultationTime.end}:00 pm",
                style: const TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Location: ",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text(
                doctor.address.location,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          PrimaryButton(label: "BOOK AN APPOINTMENT", onPressed: () {}),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
