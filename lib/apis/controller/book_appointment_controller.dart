import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pdf;
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
    final pdf = pdf.Document();
    pdf.addPage(
      pdf.Page(
        build: (pdf.Context context) {
          return pdf.Column(
            crossAxisAlignment: pdf.CrossAxisAlignment.start,
            children: [
              pdf.Text('Patient Details', style: pdf.TextStyle(fontSize: 24)),
              pdf.Text('Name: ${name.value}'),
              pdf.Text('Age: ${age.value}'),
              pdf.Text('Email: ${email.value}'),
              pdf.Text('Phone: ${phone.value}'),
              pdf.Text('Notes: ${notes.value}'),
              pdf.SizedBox(height: 20),
              pdf.Text('Doctor Details', style: pdf.TextStyle(fontSize: 24)),
              pdf.Text(doctorDetails),
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
