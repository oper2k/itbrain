import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_cabinet_widget.dart' show ProfileCabinetWidget;
import 'package:flutter/material.dart';

class ProfileCabinetModel extends FlutterFlowModel<ProfileCabinetWidget> {
  ///  Local state fields for this page.

  int iterationIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OrdersRecord>? orders;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<MeditationCategoriesRecord>? meditations;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
