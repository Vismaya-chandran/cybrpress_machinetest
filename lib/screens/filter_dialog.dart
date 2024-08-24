import 'package:cyberpress_machinetest/apis/controller/controller.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key, required this.controller});
  final ApiController controller;
  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  Gender? _selectedGender = Gender.male;
  int selectedValue = 0;
  late ApiController controller;
  List<String> timeList = ["10.00 AM - 12.00 PM", "10.00 AM - 12.00 PM"];
  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Filter by",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Gender",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                      controller.selectedGender.value = 'Male';
                    });
                  },
                ),
                const Text('Male'),
                Radio<Gender>(
                  activeColor: Colors.black,
                  value: Gender.female,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                      controller.selectedGender.value = 'Female';
                    });
                  },
                ),
                const Text('Female'),
                Radio<Gender>(
                  activeColor: Colors.black,
                  value: Gender.others,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                      controller.selectedGender.value = 'Others';
                    });
                  },
                ),
                const Text('Others'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.black,
              endIndent: 1,
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Time",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => timeTile(timeList[index], index),
                )),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 130,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const LinearBorder()),
                    onPressed: () {
                      controller.filterDoctors();
                      controller.selectedConsultingTime.value =
                          timeList[selectedValue] ?? '';
                    },
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
              ),
            )
          ],
        ));
  }

  Widget timeTile(String value, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedValue = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedValue == index ? Colors.black : Colors.white),
            color: Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          value,
          style: TextStyle(
              color: selectedValue == index ? Colors.white : Colors.black,
              fontSize: 12),
        ),
      ),
    );
  }
}

enum Gender { male, female, others }
