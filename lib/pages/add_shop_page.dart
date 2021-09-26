import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/data/salespersonModel.dart';
import 'package:smart_pos_mobile/pages/bottom_navigation_page.dart';
import 'package:smart_pos_mobile/pages/home_page.dart';
import 'package:smart_pos_mobile/services/shop_service.dart';
import 'package:provider/provider.dart';

class AddShopPage extends StatelessWidget {
  static const routeName = '/addShopPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Shop'),
        ),
        body: AddShopForm());
  }
}

class AddShopForm extends StatefulWidget {
  @override
  _AddShopFormState createState() => _AddShopFormState();
}

class _AddShopFormState extends State<AddShopForm> {
  final _formKey = GlobalKey<FormState>();

  final shopName_controller = TextEditingController();
  final ownerName_controller = TextEditingController();
  final email_controller = TextEditingController();
  final telephone_controller = TextEditingController();
  final address_controller = TextEditingController();
  final location_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sModel = context.watch<SalespersonModel>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: shopName_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Shop name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ownerName_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Owner Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: email_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telephone_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Telephone',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: location_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address_controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var a = ShopService.addShop(
                        shopName_controller.text,
                        ownerName_controller.text,
                        email_controller.text,
                        telephone_controller.text,
                        location_controller.text,
                        address_controller.text,
                        sModel.getWarehouseId());
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Saved')));
                    Navigator.of(context)
                        .pushNamed(BottomNavigationPage.routeName);
                  }
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
