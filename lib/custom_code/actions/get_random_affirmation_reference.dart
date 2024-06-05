// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<AffirmationRecord> getRandomAffirmationReference() async {
  // Add your function code here!
  final collection = FirebaseFirestore.instance.collection('affirmation');
  final countSnapshot = await collection.get();
  final totalCount = countSnapshot.size;

  if (totalCount == 0) {
    throw Exception("No documents found");
  }

  final randomOffset = Random().nextInt(totalCount);
  DocumentSnapshot? lastDoc;

  for (int i = 0; i < randomOffset; i++) {
    final query = collection.limit(1);
    QuerySnapshot snapshot;

    if (lastDoc != null) {
      snapshot = await query.startAfterDocument(lastDoc).get();
    } else {
      snapshot = await query.get();
    }

    if (snapshot.docs.isEmpty) {
      throw Exception("Error retrieving document");
    }
    lastDoc = snapshot.docs.first;
  }

  final query = collection.limit(1);
  final randomDocSnapshot = await query.startAfterDocument(lastDoc!).get();

  if (randomDocSnapshot.docs.isEmpty) {
    throw Exception("Error retrieving random document.");
  }

  final randomDocRef = randomDocSnapshot.docs.first;

  return AffirmationRecord.fromSnapshot(randomDocRef);
}
