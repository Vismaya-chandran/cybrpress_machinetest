import 'package:cyberpress_machinetest/core/constants/images.dart';
import 'package:cyberpress_machinetest/screens/pdf_detail_view.dart';
import 'package:flutter/material.dart';

class PdfListView extends StatefulWidget {
  const PdfListView({super.key});

  @override
  State<PdfListView> createState() => _PdfListViewState();
}

class _PdfListViewState extends State<PdfListView> {
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "PDF LIST",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SizedBox(
          height: kSize.height,
          width: kSize.width,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return pdfTile(kSize);
            },
          )),
    );
  }

  Widget pdfTile(Size kSize) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PdfDetailsView(),
            ));
      },
      child: Container(
        width: kSize.width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.grey.shade100,
              width: 60,
              child: Image.asset(
                AppImages.pdfIcon,
                height: 40,
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
                  "12.00 PM - 12.00 AM",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
