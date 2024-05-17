import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_widget.dart' show PaymentMethodWidget;
import 'package:flutter/material.dart';

class PaymentMethodModel extends FlutterFlowModel<PaymentMethodWidget> {
  ///  Local state fields for this page.

  bool buySite = false;

  bool buyApp = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [RevenueCat - Purchase] action in Container widget.
  bool? revenuePurchase;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
