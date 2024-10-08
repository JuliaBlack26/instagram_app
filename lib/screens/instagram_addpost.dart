import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InstaGramAddPost extends StatefulWidget {
  const InstaGramAddPost({Key? key}) : super(key: key);

  @override
  _InstaGramAddPostState createState() => _InstaGramAddPostState();
}

class _InstaGramAddPostState extends State<InstaGramAddPost> {
  final TextEditingController _captionController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to capture an image using the camera
  Future<void> _captureImageWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to handle post submission
  void _postImage() {
    if (_image != null && _captionController.text.isNotEmpty) {
      // Handle posting logic here (e.g., uploading the image and caption to a server)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post submitted!')),
      );

      // Clear the image and caption after posting
      setState(() {
        _image = null;
        _captionController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image and write a caption.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display selected image
            _image == null
                ? const Placeholder(
                    fallbackHeight: 200.0,
                    fallbackWidth: double.infinity,
                  )
                : Image.file(_image!, height: 200.0, fit: BoxFit.cover),

            const SizedBox(height: 20.0),

            // Button to pick an image from the gallery
            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text('Pick Image from Gallery'),
            ),

            const SizedBox(height: 10.0),

            // Button to capture an image using the camera
            ElevatedButton.icon(
              onPressed: _captureImageWithCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Capture Image with Camera'),
            ),

            const SizedBox(height: 20.0),

            // Caption TextField
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                labelText: 'Write a caption...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 20.0),

            // Post Button
            ElevatedButton(
              onPressed: _postImage,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}

