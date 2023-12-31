import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:travelapp/homeadmin/homeadminpage.dart';

class DestinationForm extends StatefulWidget {
  @override
  _DestinationFormState createState() => _DestinationFormState();
}

class _DestinationFormState extends State<DestinationForm> {
  void setPictureUrl(String url) {
    setState(() {
      _pictureUrl = url;
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _pictureUrl = '';
  String _destinationName = '';
  String _location = '';
  String _description = '';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

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
                    // Upload the image to Firebase Storage
                    final imageUrl = await _uploadImageToStorage(bytes);
                    setState(() {
                      _pictureUrl = imageUrl;
                    });
                  }
                },
                child: Text('Upload Image'),
              ),
              _pictureUrl.isNotEmpty
                  ? Image.network(
                      _pictureUrl,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
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

  Future<String> _uploadImageToStorage(List<int> bytes) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final imagePath = 'images/$timestamp.jpg';
      final storageReference = _storage.ref().child(imagePath);
      final uploadTask = storageReference.putData(Uint8List.fromList(bytes));

      // Wait for the upload to complete
      await uploadTask.whenComplete(() {});

      // Get the download URL from the storage reference
      final imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      // Handle error as needed
      return '';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save data to Firestore
      _saveDataToFirestore();
    }
  }

  void _saveDataToFirestore() async {
    try {
      await _firestore.collection('admin').add({
        'pictureUrl': _pictureUrl,
        'destinationName': _destinationName,
        'location': _location,
        'description': _description,
      });

      // Data successfully saved to Firestore
      print('Data saved to Firestore!');

      // Show a success notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved successfully!'),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeAdmin(),
        ),
      );
    } catch (error) {
      // Handle errors
      print('Error saving data to Firestore: $error');
    }
  }
}
