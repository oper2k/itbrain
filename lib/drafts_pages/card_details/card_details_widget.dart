import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/purchase_pages/thanks_for_buying/thanks_for_buying_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'card_details_model.dart';
export 'card_details_model.dart';

class CardDetailsWidget extends StatefulWidget {
  const CardDetailsWidget({super.key});

  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  late CardDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardDetailsModel());

    _model.cardNumberController ??= TextEditingController();
    _model.cardNumberFocusNode ??= FocusNode();
    _model.cardNumberFocusNode!.addListener(() => setState(() {}));
    _model.dateEndController ??= TextEditingController();
    _model.dateEndFocusNode ??= FocusNode();
    _model.dateEndFocusNode!.addListener(() => setState(() {}));
    _model.cvcController ??= TextEditingController();
    _model.cvcFocusNode ??= FocusNode();
    _model.cvcFocusNode!.addListener(() => setState(() {}));
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
        body: Container(
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 46.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed('onBoarding');
                      },
                      child: Container(
                        width: 40.0,
                        height: 44.0,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'mhc5jm2i' /* Введите данные карты */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                            lineHeight: 1.16,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      height: 58.0,
                      decoration: BoxDecoration(
                        color: _model.showCardNumberError
                            ? FlutterFlowTheme.of(context).error
                            : FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: () {
                            if ((_model.cardNumberFocusNode?.hasFocus ??
                                false)) {
                              return FlutterFlowTheme.of(context).accent1;
                            } else if (_model.showCardNumberError) {
                              return FlutterFlowTheme.of(context).error;
                            } else {
                              return Colors.transparent;
                            }
                          }(),
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              14.0, 0.0, 14.0, 0.0),
                          child: TextFormField(
                            controller: _model.cardNumberController,
                            focusNode: _model.cardNumberFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.cardNumberController',
                              const Duration(milliseconds: 500),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '2junazsi' /* Номер карты */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: (_model.cardNumberFocusNode
                                                ?.hasFocus ??
                                            false)
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 17.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.7,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              errorStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: FlutterFlowTheme.of(context).error,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Evolventa',
                                  fontSize: 17.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.5,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor: FlutterFlowTheme.of(context).accent1,
                            validator: _model.cardNumberControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_model.showCardNumberError)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'a20uhjw9' /* Поле должно содержать 16 симво... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 15.0,
                              useGoogleFonts: false,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                height: 58.0,
                                decoration: BoxDecoration(
                                  color: _model.chowDateEndError
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: () {
                                      if ((_model.dateEndFocusNode?.hasFocus ??
                                          false)) {
                                        return FlutterFlowTheme.of(context)
                                            .accent1;
                                      } else if (_model.chowDateEndError) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else {
                                        return Colors.transparent;
                                      }
                                    }(),
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.dateEndController,
                                      focusNode: _model.dateEndFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.dateEndController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'ucaza66x' /* Дата окончания */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model.dateEndFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.7,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.datetime,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .dateEndControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.chowDateEndError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '8n86293r' /* Неверная дата */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                height: 58.0,
                                decoration: BoxDecoration(
                                  color: _model.showCVVerror
                                      ? FlutterFlowTheme.of(context).error
                                      : FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: () {
                                      if ((_model.cvcFocusNode?.hasFocus ??
                                          false)) {
                                        return FlutterFlowTheme.of(context)
                                            .accent1;
                                      } else if (_model.showCVVerror) {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      } else {
                                        return Colors.transparent;
                                      }
                                    }(),
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.cvcController,
                                      focusNode: _model.cvcFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.cvcController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'jt97zzal' /* CVC/CVV */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model.cvcFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.7,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model.cvcControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showCVVerror)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '6249a6x8' /* Неверный CVC */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ].divide(const SizedBox(width: 12.0)),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'dtzghv4i' /* Сумма */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              fontSize: 15.0,
                              useGoogleFonts: false,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        revenue_cat.offerings!.current!.lifetime!.storeProduct
                            .priceString,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                              lineHeight: 1.29,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 46.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((_model.cardNumberController.text != '') ||
                          functions.cardNumberCheck(
                              _model.cardNumberController.text)!) {
                        setState(() {
                          _model.showCardNumberError = false;
                        });
                        if (functions.cardDateEndCheck(
                            _model.dateEndController.text,
                            getCurrentTimestamp)) {
                          setState(() {
                            _model.chowDateEndError = false;
                          });
                          if (functions.cvvCheck(
                              int.tryParse(_model.cvcController.text))!) {
                            setState(() {
                              _model.showCVVerror = false;
                            });
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const ThanksForBuyingWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            setState(() {
                              _model.showCVVerror = false;
                            });
                            return;
                          }

                          return;
                        } else {
                          setState(() {
                            _model.chowDateEndError = true;
                          });
                          return;
                        }
                      } else {
                        setState(() {
                          _model.showCardNumberError = true;
                        });
                        return;
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF9747FF),
                            Color(0xFFF1618E),
                            Color(0xFFFE710B)
                          ],
                          stops: [0.0, 0.4, 1.0],
                          begin: AlignmentDirectional(1.0, 0.34),
                          end: AlignmentDirectional(-1.0, -0.34),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'iv8rypsd' /* Оплатить */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
