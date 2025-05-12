// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:fluttertoast/fluttertoast.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> addContactToDevice(String fullName, String jobTitle,
    String companyName, String phone, String email) async {
  if (await Permission.contacts.request().isGranted) {
    final contact = Contact(
      givenName: fullName,
      company: companyName,
      jobTitle: jobTitle,
      phones: [Item(label: 'mobile', value: phone)],
      emails: [Item(label: 'work', value: email)],
    );
    await ContactsService.addContact(contact);
    print('Contact for $fullName added successfully.');
    Fluttertoast.showToast(msg: 'Contact added successfully 🎉');
  } else {
    Fluttertoast.showToast(msg: 'Failed to add contact ❌');
    print('Contacts permission denied.');
  }
}
