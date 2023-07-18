import 'dart:io';

import 'package:bayut_clone_app/Widgets/customSnackBar.dart';
import 'package:bayut_clone_app/models/HousePostModel.dart';
import 'package:bayut_clone_app/models/PostModel.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageGetController extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool _isUploading = false.obs;
  bool get isUploading => _isUploading.value;

  RxDouble _progress = 0.0.obs;
  double get progress => _progress.value;

  Future<List<String>?> uploadImages(
      List<XFile> imageFiles, BuildContext context) async {
    try {
      _isUploading.value = true;

      List<String> downloadUrls = [];

      for (XFile imageFile in imageFiles) {
        // Generate a unique file name for the uploaded image
        String uid = FirebaseAuthHelper(FirebaseAuth.instance).user.uid;
        String fileName =
            DateTime.now().millisecondsSinceEpoch.toString() + uid;

        // Upload the image to Firebase Storage
        final Reference storageReference =
            _storage.ref().child('images/$fileName');

        final UploadTask uploadTask =
            storageReference.putFile(File(imageFile.path));
        // to get the progress of task
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          _progress.value = progress;
        });
        final TaskSnapshot taskSnapshot = await uploadTask;

        // Get the download URL of the uploaded image
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        downloadUrls.add(downloadUrl);
      }

      _isUploading.value = false;

      // Notify listeners about the successful upload
      update(['upload']);
      showSnackBar(context, "SucessFully Uploaded");

      return downloadUrls;
    } catch (error) {
      _isUploading.value = false;
      // Handle error
      print('Image upload error: $error');
      showSnackBar(context, "Error Occur While Uploading Images");
      return null;
    }
  }

  Future<void> createPost(PostModel post, BuildContext context) async {
    try {
      // Generate a unique UID for the post collection
      _isUploading.value = true;
      final String postUid = DateTime.now().millisecondsSinceEpoch.toString();
      await _firestore.collection('posts').doc(postUid).set({
        'category': post.category,
        'subcategory': post.subcategory,
        'price': post.price,
        'type': post.type,
        'features': post.features,
        'areaUnit': post.areaUnit,
        'area': post.area,
        'title': post.title,
        'description': post.description,
        'imageUrls': post.imageUrls,
        'userId': post.userId
      });
      print('Post created successfully!');
      _isUploading.value = false;

      showSnackBar(context, "SucessFully Uploaded");
    } catch (error) {
      print('Error creating post: $error');
      showSnackBar(context, "Error Ocuured  ${error.toString()}");
    }
  }

  Future<void> createHousePost(
      HousePostModel post, BuildContext context) async {
    try {
      // Generate a unique UID for the post collection
      _isUploading.value = true;
      final String postUid = DateTime.now().millisecondsSinceEpoch.toString();
      await _firestore.collection('posts').doc(postUid).set({
        "category": post.category,
        "subcategory": post.subcategory,
        "price": post.price,
        "furnishedState": post.furnishedState,
        "bedRoomNumber": post.bedRoomNumber,
        "bathRoomNumber": post.bathRoomNumber,
        "constructionState": post.constructionState,
        "features": post.features,
        "areaUnit": post.areaUnit,
        "area": post.area,
        "title": post.title,
        "description": post.description,
        "imageUrls": post.imageUrls,
        "userId": post.userId
      });
      print('Post created successfully!');
      _isUploading.value = false;

      showSnackBar(context, "SucessFully Uploaded");
    } catch (error) {
      print('Error creating post: $error');
      showSnackBar(context, "Error Ocuured  ${error.toString()}");
    }
  }
}
