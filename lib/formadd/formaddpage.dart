import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DestinationForm extends StatefulWidget {
  @override
  _DestinationFormState createState() => _DestinationFormState();
}

class _DestinationFormState extends State<DestinationForm> {
  final _formKey = GlobalKey<FormState>();
  String _pictureUrl = ''; // This will store the path string
  String _destinationName = '';
  String _location = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    final bytes = await pickedFile.readAsBytes();
                    setState(() {
                      _pictureUrl = base64Encode(bytes);
                    });
                  }
                },
                child: Text('Upload Image'),
              ),
              _pictureUrl.isNotEmpty
                  ? Image.memory(
                      base64Decode(_pictureUrl), // Decode base64 to bytes
                      height: 200,
                      width: 200,
                    )
                  : Text('No image selected.'),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Destination Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a destination name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _destinationName = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
                maxLines: 3,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Perform actions with the form data
      print('Picture URL: $_pictureUrl');
      print('Destination Name: $_destinationName');
      print('Location: $_location');
      print('Description: $_description');
    }
  }
}
