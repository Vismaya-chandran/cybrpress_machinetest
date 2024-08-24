import 'package:cyberpress_machinetest/apis/controller/book_appointment_controller.dart';
import 'package:cyberpress_machinetest/core/constants/images.dart';
import 'package:cyberpress_machinetest/core/widgets/primary_button.dart';
import 'package:cyberpress_machinetest/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  final AppointmentController patientController =
      Get.put(AppointmentController());
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "BOOK AN APPOINTMENT",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                "Patient Details",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Name",
                controller: nameController,
                errorMessage: "Please enter name",
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  patientController.updateName(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Age",
                controller: ageController,
                errorMessage: "Please enter age",
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  patientController.updateAge(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Email",
                controller: emailController,
                errorMessage: "Please enter email",
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  patientController.updateEmail(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Phone",
                controller: nameController,
                errorMessage: "Please enter phone number",
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  patientController.updatePhone(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Notes",
                controller: notesController,
                maxLines: 4,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  patientController.updateNotes(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black,
                endIndent: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Doctor Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
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
                      height: 45,
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
                        "Pediatric dentistry",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Gender-: Male",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Time: 10:00 am - 4:00 pm",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Location: New Jersy",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              PrimaryButton(
                  label: "GENERATE PDF/SEND",
                  onPressed: () {
                    String doctorDetails =
                        'Dr. John Doe\nCardiologist\nXYZ Hospital';
                    patientController.generatePDF(doctorDetails);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
