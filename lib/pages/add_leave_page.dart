import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/pages/view_leaves_page.dart';
import 'package:smart_pos_mobile/services/leave_service.dart';
import 'package:provider/provider.dart';

class RequestLeavePage extends StatelessWidget {
  static const routeName = '/requestLeavePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Leave'),
      ),
      body: RequestLeaveForm(),
    );
  }
}

class RequestLeaveForm extends StatefulWidget {
  @override
  _RequestLeaveFormState createState() => _RequestLeaveFormState();
}

class _RequestLeaveFormState extends State<RequestLeaveForm> {
  final format = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final description_controller = TextEditingController();
  final from_controller = TextEditingController();
  final to_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: description_controller,
              maxLines: 3,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            DateTimeField(
              controller: from_controller,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'From'),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              validator: (value) {
                if (value == null) {
                  return 'Please enter the date';
                }
              },
            ),
            DateTimeField(
              controller: to_controller,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'To'),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              validator: (value) {
                if (value == null) {
                  return 'Please enter the date';
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LeaveService.addLeave(
                      description_controller.text,
                      from_controller.text,
                      to_controller.text,
                      sModel.getSalespersonId());

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Saved')));
                  Navigator.of(context).pushNamed(ViewLeavePage.routeName);
                }
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
