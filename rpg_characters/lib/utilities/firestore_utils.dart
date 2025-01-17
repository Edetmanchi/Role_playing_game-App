import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUtils {
  static final ref = FirebaseFirestore.instance
    .collection('characters');
}