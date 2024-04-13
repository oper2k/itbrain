import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/purchase_pages/thanks_for_buying/thanks_for_buying_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'card_details_widget.dart' show CardDetailsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
}
