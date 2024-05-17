import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/doc_exists/doc_exists_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'sign_up_page_model.dart';
export 'sign_up_page_model.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({
    super.key,
    this.pageParameter,
  });

  final int? pageParameter;

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  late SignUpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.emailFocusNode!.addListener(() => setState(() {}));
    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
    _model.passwordFocusNode!.addListener(() => setState(() {}));
    _model.confirmPassTextController ??= TextEditingController();
    _model.confirmPassFocusNode ??= FocusNode();
    _model.confirmPassFocusNode!.addListener(() => setState(() {}));
    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();
    _model.nameFocusNode!.addListener(() => setState(() {}));
    _model.surnameTextController ??= TextEditingController();
    _model.surnameFocusNode ??= FocusNode();
    _model.surnameFocusNode!.addListener(() => setState(() {}));
    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
    _model.phoneNumberFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.png',
              ).image,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 500.0,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _model.pageViewController ??= PageController(
                  initialPage: max(
                      0,
                      min(
                          valueOrDefault<int>(
                            widget.pageParameter ?? 0,
                            0,
                          ),
                          2))),
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 44.0, 20.0, 46.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('signInPage');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '2ls9dy4w' /* Есть аккаунт? */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.transparent,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                          lineHeight: 1.6,
                                        ),
                                    elevation: 0.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vao99jhi' /* Шаг №1 из 3 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.41,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'a29d8kon' /* Регистрация */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.16,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showEmailError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model.emailFocusNode?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.emailTextController,
                                      focusNode: _model.emailFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.emailTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'z4ur154g' /* Email */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  (_model.emailFocusNode
                                                              ?.hasFocus ??
                                                          false)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent1
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.17,
                                            ),
                                        alignLabelWithHint: false,
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: _model.emailTextController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.emailTextController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.6,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showEmailError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'w0jko964' /* Поле не заполнено */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showPassError ||
                                            _model.showMatchError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model.passwordFocusNode
                                                  ?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.passwordTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'wig6i5ol' /* Придумайте пароль */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model.passwordFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.17,
                                            ),
                                        alignLabelWithHint: false,
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.6,
                                          ),
                                      textAlign: TextAlign.start,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showPassError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'npgm2tfr' /* Минимум 6 символов  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showConfirmPassError ||
                                            _model.showMatchError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model.confirmPassFocusNode
                                                  ?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.confirmPassTextController,
                                      focusNode: _model.confirmPassFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.confirmPassTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText:
                                          !_model.confirmPassVisibility,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'dw40rg6m' /* Подтвердите пароль */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model
                                                          .confirmPassFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.17,
                                            ),
                                        alignLabelWithHint: false,
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.confirmPassVisibility =
                                                !_model.confirmPassVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.confirmPassVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.6,
                                          ),
                                      textAlign: TextAlign.start,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .confirmPassTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                if (_model.showConfirmPassError)
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'cb64r48o' /* Минимум 6 символов */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  ),
                                if (_model.showMatchError)
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'dxdipov4' /* Пароли не совпадают */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 46.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var shouldSetState = false;
                                if (_model.emailTextController.text != '') {
                                  setState(() {
                                    _model.showEmailError = false;
                                  });
                                  if ((_model.passwordTextController.text !=
                                              '') &&
                                      functions.passCheck(_model
                                          .passwordTextController.text)!) {
                                    setState(() {
                                      _model.showPassError = false;
                                    });
                                    if ((_model.confirmPassTextController
                                                    .text !=
                                                '') &&
                                        functions.passCheck(_model
                                            .confirmPassTextController.text)!) {
                                      setState(() {
                                        _model.showConfirmPassError = false;
                                      });
                                      if (_model.passwordTextController.text ==
                                          _model
                                              .confirmPassTextController.text) {
                                        setState(() {
                                          _model.showMatchError = false;
                                        });
                                        _model.users =
                                            await queryUsersRecordCount(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'email',
                                            isEqualTo:
                                                functions.emailLowerWords(_model
                                                    .emailTextController.text),
                                          ),
                                        );
                                        shouldSetState = true;
                                        if (_model.users! > 0) {
                                          setState(() {
                                            _model.showDocExistsError = true;
                                          });
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const DocExistsWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          if (shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          setState(() {
                                            _model.showDocExistsError = false;
                                          });
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          if (_model.passwordTextController
                                                  .text !=
                                              _model.confirmPassTextController
                                                  .text) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'a9ptdanj' /* Пароли не совпадают */,
                                                  ),
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          final user = await authManager
                                              .createAccountWithEmail(
                                            context,
                                            _model.emailTextController.text,
                                            _model.passwordTextController.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          await UsersRecord.collection
                                              .doc(user.uid)
                                              .update(createUsersRecordData(
                                                email: functions
                                                    .emailLowerWords(_model
                                                        .emailTextController
                                                        .text),
                                                surname: _model
                                                    .surnameTextController.text,
                                              ));

                                          context.pushNamedAuth(
                                              'confirmEmail', context.mounted);

                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        setState(() {
                                          _model.showMatchError = true;
                                        });
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      setState(() {
                                        _model.showConfirmPassError = true;
                                      });
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    setState(() {
                                      _model.showPassError = true;
                                    });
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  setState(() {
                                    _model.showEmailError = true;
                                  });
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
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
                                      '0hn1n0c5' /* Зарегистрироваться */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await _model.pageViewController
                                        ?.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 44.0,
                                    decoration: const BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'm872kyq1' /* Шаг №2 из 3 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.41,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gfu7laa4' /* Давай знакомиться */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jbstkkoi' /* Это поможет подстроить приложе... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.41,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showNameError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model.nameFocusNode?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.nameTextController,
                                      focusNode: _model.nameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.nameTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '2o2yaouw' /* Имя */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model.nameFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: _model.nameTextController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.nameTextController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .nameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showNameError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4820xm03' /* Поле не заполнено */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showSurnameError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model
                                                  .surnameFocusNode?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.surnameTextController,
                                      focusNode: _model.surnameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.surnameTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'pv7nzke4' /* Фамилия */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model.surnameFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: _model
                                                .surnameTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.surnameTextController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                      textAlign: TextAlign.start,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .surnameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showSurnameError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'vu7m3huf' /* Поле не заполнено */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: _model.showPhoneError
                                        ? const Color(0x1FFF3F3F)
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (_model.phoneNumberFocusNode
                                                  ?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.phoneNumberTextController,
                                      focusNode: _model.phoneNumberFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.phoneNumberTextController',
                                        const Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'o190g5el' /* Телефон */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color: (_model
                                                          .phoneNumberFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent1
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                        alignLabelWithHint: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        suffixIcon: _model
                                                .phoneNumberTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .phoneNumberTextController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLength: 30,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.phone,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      validator: _model
                                          .phoneNumberTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.showPhoneError)
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'q41nmuj2' /* Поле не заполнено */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 46.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.nameTextController.text != '') {
                                  setState(() {
                                    _model.showNameError = false;
                                  });
                                  if (_model.surnameTextController.text != '') {
                                    setState(() {
                                      _model.showSurnameError = false;
                                    });
                                    if (_model.phoneNumberTextController.text !=
                                            '') {
                                      setState(() {
                                        _model.showPhoneError = false;
                                      });

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        displayName:
                                            _model.nameTextController.text,
                                        createdTime: getCurrentTimestamp,
                                        surname:
                                            _model.surnameTextController.text,
                                        phoneNumber: _model
                                            .phoneNumberTextController.text,
                                      ));
                                      await _model.pageViewController?.nextPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                      return;
                                    } else {
                                      setState(() {
                                        _model.showPhoneError = true;
                                      });
                                      return;
                                    }
                                  } else {
                                    setState(() {
                                      _model.showSurnameError = true;
                                    });
                                    return;
                                  }
                                } else {
                                  setState(() {
                                    _model.showNameError = true;
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
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 14.0, 12.0, 14.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'qom7s9h0' /* Далее */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 44.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.pageViewController
                                          ?.previousPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 44.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Icon(
                                          FFIcons.kleft2,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0apbqllj' /* Шаг №3 из 3 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.41,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'bpew0i3k' /* Вы почти у цели! */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'zr7hsquf' /* Добавьте фото */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.41,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 42.0, 0.0, 0.0),
                                  child: SizedBox(
                                    width: 174.0,
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if (_model.uploadedFileUrl == '')
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: SizedBox(
                                              width: 174.0,
                                              height: 174.0,
                                              child: custom_widgets
                                                  .DottedContainer(
                                                width: 174.0,
                                                height: 174.0,
                                                colorDecoration:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                intDash: 2,
                                                intSpase: 2,
                                                doubleStrokeWidth: 1.0,
                                                doubleRadius: 100.0,
                                              ),
                                            ),
                                          ),
                                        Builder(
                                          builder: (context) {
                                            if (_model.uploadedFileUrl == '') {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (await getPermissionStatus(
                                                        photoLibraryPermission)) {
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        maxWidth: 492.00,
                                                        maxHeight: 492.00,
                                                        imageQuality: 95,
                                                        allowPhoto: true,
                                                        includeBlurHash: true,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .buttonColor,
                                                        textColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'lc5m8b8r' /* Загрузка фото */,
                                                            ),
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          setState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'jb7evkbp' /* Готово! */,
                                                              ));
                                                        } else {
                                                          setState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'vnw9exr8' /* Ошибка при загрузке фотографии */,
                                                              ));
                                                          return;
                                                        }
                                                      }

                                                      setState(() {
                                                        FFAppState()
                                                                .imageProfileBlurHash =
                                                            _model
                                                                .uploadedLocalFile
                                                                .blurHash!;
                                                      });
                                                    } else {
                                                      await requestPermission(
                                                          photoLibraryPermission);
                                                    }
                                                  },
                                                  text: '',
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 24.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 169.0,
                                                    height: 169.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsets.all(70.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      child: OctoImage(
                                                        placeholderBuilder:
                                                            (_) =>
                                                                SizedBox.expand(
                                                          child: Image(
                                                            image: BlurHashImage(
                                                                FFAppState()
                                                                    .imageProfileBlurHash),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        image: NetworkImage(
                                                          _model
                                                              .uploadedFileUrl,
                                                        ),
                                                        width: 174.0,
                                                        height: 174.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 0.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          FFIcons.kunion,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 12.0,
                                                        ),
                                                        onPressed: () async {
                                                          setState(() {
                                                            _model.isDataUploading =
                                                                false;
                                                            _model.uploadedLocalFile =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                            _model.uploadedFileUrl =
                                                                '';
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'q5okcufk' /* Добавить фото */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl,
                          ));

                          context.goNamed('HomePage');
                        },
                        text: FFLocalizations.of(context).getText(
                          'qvydele0' /* Пропустить */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Evolventa',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 46.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrl: _model.uploadedFileUrl,
                          ));

                          context.goNamed('HomePage');
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 14.0, 12.0, 14.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mjf8bgjf' /* Далее */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
