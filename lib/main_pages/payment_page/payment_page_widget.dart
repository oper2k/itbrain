import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/purchase_pages/thanks_for_buying/thanks_for_buying_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_page_model.dart';
export 'payment_page_model.dart';

class PaymentPageWidget extends StatefulWidget {
  const PaymentPageWidget({
    super.key,
    required this.getCoursePaymentLink,
  });

  final MeditationCategoriesRecord? getCoursePaymentLink;

  @override
  State<PaymentPageWidget> createState() => _PaymentPageWidgetState();
}

class _PaymentPageWidgetState extends State<PaymentPageWidget> {
  late PaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<OrdersRecord>>(
          stream: queryOrdersRecord(
            queryBuilder: (ordersRecord) => ordersRecord
                .where(
                  'client_email',
                  isEqualTo: currentUserEmail,
                )
                .where(
                  'purchased_product',
                  isEqualTo: widget.getCoursePaymentLink?.getcourseOffer,
                ),
          )..listen((snapshot) async {
              List<OrdersRecord> containerOrdersRecordList = snapshot;
              if (_model.containerPreviousSnapshot != null &&
                  !const ListEquality(OrdersRecordDocumentEquality()).equals(
                      containerOrdersRecordList,
                      _model.containerPreviousSnapshot)) {
                if (containerOrdersRecordList.length > 0) {
                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'purchasedMeditationsPacks': FieldValue.arrayUnion(
                            [widget.getCoursePaymentLink?.reference]),
                      },
                    ),
                  });
                  setState(() {
                    _model.paymentSucceeded = true;
                  });
                }

                setState(() {});
              }
              _model.containerPreviousSnapshot = snapshot;
            }),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                ),
              );
            }
            List<OrdersRecord> containerOrdersRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Frame_11818.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 40.0,
                            height: 44.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Icon(
                                FFIcons.kleft2,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              FlutterFlowWebView(
                                content:
                                    FFLocalizations.of(context).getVariableText(
                                  ruText:
                                      widget.getCoursePaymentLink?.getCourseUrl,
                                  enText: widget
                                      .getCoursePaymentLink?.getCourseUrlEng,
                                ),
                                bypass: false,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                verticalScroll: false,
                                horizontalScroll: false,
                              ),
                              if (_model.paymentSucceeded)
                                wrapWithModel(
                                  model: _model.thanksForBuyingModel,
                                  updateCallback: () => setState(() {}),
                                  child: ThanksForBuyingWidget(),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
