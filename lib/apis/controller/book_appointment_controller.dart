import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pdfwidget;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AppointmentController extends GetxController {
  var name = ''.obs;
  var age = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var notes = ''.obs;

  void updateName(String value) {
    name.value = value;
  }

  void updateAge(String value) {
    age.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePhone(String value) {
    phone.value = value;
  }

  void updateNotes(String value) {
    notes.value = value;
  }

  Future<void> generatePDF(String doctorDetails) async {
    final pdf = pdfwidget.Document();
    pdf.addPage(
      pdfwidget.Page(
        build: (pdfwidget.Context context) {
          return pdfwidget.Column(
            crossAxisAlignment: pdfwidget.CrossAxisAlignment.start,
            children: [
              pdfwidget.Text('Patient Details',
                  style: const pdfwidget.TextStyle(fontSize: 24)),
              pdfwidget.Text('Name: ${name.value}'),
              pdfwidget.Text('Age: ${age.value}'),
              pdfwidget.Text('Email: ${email.value}'),
              pdfwidget.Text('Phone: ${phone.value}'),
              pdfwidget.Text('Notes: ${notes.value}'),
              pdfwidget.SizedBox(height: 20),
              pdfwidget.Text('Doctor Details',
                  style: const pdfwidget.TextStyle(fontSize: 24)),
              pdfwidget.Text(doctorDetails),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/patient_doctor_details.pdf');
    await file.writeAsBytes(await pdf.save());

    print('PDF saved at ${file.path}');
  }
}
