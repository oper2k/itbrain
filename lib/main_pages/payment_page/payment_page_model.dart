import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/purchase_pages/thanks_for_buying/thanks_for_buying_widget.dart';
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:flutter/material.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  Local state fields for this page.

  bool paymentSucceeded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for thanksForBuying component.
  late ThanksForBuyingModel thanksForBuyingModel;

  @override
  void initState(BuildContext context) {
    thanksForBuyingModel = createModel(context, () => ThanksForBuyingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    thanksForBuyingModel.dispose();
  }
}
