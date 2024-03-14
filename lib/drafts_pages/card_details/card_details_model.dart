import '/flutter_flow/flutter_flow_util.dart';
import 'card_details_widget.dart' show CardDetailsWidget;
import 'package:flutter/material.dart';

class CardDetailsModel extends FlutterFlowModel<CardDetailsWidget> {
  ///  Local state fields for this page.

  bool showCardNumberError = false;

  bool chowDateEndError = false;

  bool showCVVerror = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberController;
  String? Function(BuildContext, String?)? cardNumberControllerValidator;
  // State field(s) for dateEnd widget.
  FocusNode? dateEndFocusNode;
  TextEditingController? dateEndController;
  String? Function(BuildContext, String?)? dateEndControllerValidator;
  // State field(s) for CVC widget.
  FocusNode? cvcFocusNode;
  TextEditingController? cvcController;
  String? Function(BuildContext, String?)? cvcControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    cardNumberFocusNode?.dispose();
    cardNumberController?.dispose();

    dateEndFocusNode?.dispose();
    dateEndController?.dispose();

    cvcFocusNode?.dispose();
    cvcController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
