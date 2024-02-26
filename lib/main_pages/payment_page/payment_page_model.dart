import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/purchase_pages/thanks_for_buying/thanks_for_buying_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  Local state fields for this page.

  bool paymentSucceeded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<OrdersRecord>? containerPreviousSnapshot;
  // Model for thanksForBuying component.
  late ThanksForBuyingModel thanksForBuyingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    thanksForBuyingModel = createModel(context, () => ThanksForBuyingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    thanksForBuyingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
