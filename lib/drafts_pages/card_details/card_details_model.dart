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
  TextEditingController? cardNumberTextController;
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  // State field(s) for dateEnd widget.
  FocusNode? dateEndFocusNode;
  TextEditingController? dateEndTextController;
  String? Function(BuildContext, String?)? dateEndTextControllerValidator;
  // State field(s) for CVC widget.
  FocusNode? cvcFocusNode;
  TextEditingController? cvcTextController;
  String? Function(BuildContext, String?)? cvcTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    cardNumberFocusNode?.dispose();
    cardNumberTextController?.dispose();

    dateEndFocusNode?.dispose();
    dateEndTextController?.dispose();

    cvcFocusNode?.dispose();
    cvcTextController?.dispose();
  }
}
