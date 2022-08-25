import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;

final questionRF = fireStore.collection('Quizquestions');
DocumentReference questionRef({
  required String id,
  required String questionID,
  //Here we create subcollection based on main collection
  //
}) =>
    questionRF.doc(id).collection('Quizquestions').doc(questionID);

Reference get firbaseStorage => FirebaseStorage.instance.ref();
