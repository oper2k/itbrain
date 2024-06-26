import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/delete_account_confirm/delete_account_confirm_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_PROFILE_editProfile_ON_INIT_STATE');
      logFirebaseEvent('editProfile_custom_action');
      await actions.yesCreateScreenshots();
      logFirebaseEvent('editProfile_custom_action');
      await actions.lockOrientation();
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nameFocusNode ??= FocusNode();
    _model.nameFocusNode!.addListener(() => setState(() {}));
    _model.surnameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.surname, ''));
    _model.surnameFocusNode ??= FocusNode();
    _model.surnameFocusNode!.addListener(() => setState(() {}));
    _model.phoneTextController ??= TextEditingController(
        text: currentPhoneNumber != ''
            ? currentPhoneNumber
            : '+7');
    _model.phoneFocusNode ??= FocusNode();
    _model.phoneFocusNode!.addListener(() => setState(() {}));
    _model.emailTextController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailFocusNode ??= FocusNode();
    _model.emailFocusNode!.addListener(() => setState(() {}));
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
                'assets/images/Frame_11818.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 44.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE_Container_4q36zwo2_ON_TAP');
                                  logFirebaseEvent('Container_navigate_back');
                                  context.safePop();
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 44.0,
                                  decoration: const BoxDecoration(),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Icon(
                                      FFIcons.kleft2,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE_Container_gayao3sc_ON_TAP');
                                  logFirebaseEvent('Container_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const DeleteAccountConfirmWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 44.0,
                                  decoration: const BoxDecoration(),
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Icon(
                                      FFIcons.kleft345,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '30fimlrh' /* Изменить профиль */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'EDIT_PROFILE_PAGE_Row_fsdekspl_ON_TAP');
                              logFirebaseEvent('Row_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 492.00,
                                maxHeight: 492.00,
                                imageQuality: 95,
                                allowPhoto: true,
                                includeBlurHash: true,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).buttonColor,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                pickerFontFamily: 'Roboto',
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    FFLocalizations.of(context).getText(
                                      'lc5m8b8r' /* Загрузка фото */,
                                    ),
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                  showUploadMessage(
                                      context,
                                      FFLocalizations.of(context).getText(
                                        'jb7evkbp' /* Готово! */,
                                      ));
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context,
                                      FFLocalizations.of(context).getText(
                                        'vnw9exr8' /* Ошибка при загрузке фотографии */,
                                      ));
                                  return;
                                }
                              }

                              logFirebaseEvent('Row_update_app_state');
                              FFAppState().imageProfileBlurHash =
                                  _model.uploadedLocalFile.blurHash!;
                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if ((currentUserPhoto == '') &&
                                        (_model.uploadedFileUrl == '')) {
                                      return Container(
                                        width: 124.0,
                                        height: 124.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                      );
                                    } else {
                                      return Stack(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: OctoImage(
                                                placeholderBuilder: (_) =>
                                                    SizedBox.expand(
                                                  child: Image(
                                                    image: BlurHashImage(
                                                        FFAppState()
                                                            .imageProfileBlurHash),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                image:
                                                    CachedNetworkImageProvider(
                                                  _model.uploadedFileUrl !=
                                                              ''
                                                      ? _model.uploadedFileUrl
                                                      : currentUserPhoto,
                                                ),
                                                width: 124.0,
                                                height: 124.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, -1.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 0.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                FFIcons.kunion,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 12.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'EDIT_PROFILE_PAGE_union_ICN_ON_TAP');
                                                if (_model.uploadedFileUrl !=
                                                        '') {
                                                  logFirebaseEvent(
                                                      'IconButton_clear_uploaded_data');
                                                  setState(() {
                                                    _model.isDataUploading =
                                                        false;
                                                    _model.uploadedLocalFile =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]));
                                                    _model.uploadedFileUrl = '';
                                                  });
                                                } else {
                                                  if (currentUserPhoto != '') {
                                                    logFirebaseEvent(
                                                        'IconButton_backend_call');

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'photo_url':
                                                              FieldValue
                                                                  .delete(),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'jkqcishr' /* Добавить фото */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            height: 58.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: (_model.nameFocusNode?.hasFocus ?? false)
                                    ? FlutterFlowTheme.of(context).accent1
                                    : Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
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
                                      'fjhfuyy7' /* Имя */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color:
                                              (_model.nameFocusNode?.hasFocus ??
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    suffixIcon: _model
                                            .nameTextController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.nameTextController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  keyboardType: TextInputType.name,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  validator: _model.nameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            height: 58.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color:
                                    (_model.surnameFocusNode?.hasFocus ?? false)
                                        ? FlutterFlowTheme.of(context).accent1
                                        : Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
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
                                      '7zskc5m5' /* Фамилия */,
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
                                          lineHeight: 1.17,
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    suffixIcon: _model.surnameTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.surnameTextController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            height: 58.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color:
                                    (_model.phoneFocusNode?.hasFocus ?? false)
                                        ? FlutterFlowTheme.of(context).accent1
                                        : Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.phoneTextController,
                                  focusNode: _model.phoneFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.phoneTextController',
                                    const Duration(milliseconds: 500),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '9c4wz64o' /* Номер телефона */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Evolventa',
                                          color:
                                              (_model.phoneFocusNode
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    suffixIcon: _model.phoneTextController!.text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.phoneTextController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  keyboardType: TextInputType.phone,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  validator: _model.phoneTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: !currentUserEmailVerified
                                      ? const Color(0xFFFF3F3F)
                                      : Colors.transparent,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 14.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 14.0, 0.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model.emailTextController,
                                            focusNode: _model.emailFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.emailTextController',
                                              const Duration(milliseconds: 500),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            readOnly: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'muo9s8yx' /* Email */,
                                              ),
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Evolventa',
                                                    color: (_model
                                                                .emailFocusNode
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
                                                    lineHeight: 1.2,
                                                  ),
                                              alignLabelWithHint: false,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              errorStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
                                            textAlign: TextAlign.start,
                                            maxLength: 18,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            validator: _model
                                                .emailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (!currentUserEmailVerified)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EDIT_PROFILE_PAGE_ПОДТВЕРДИТЬ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context
                                              .pushNamed('confirmEmailProfile');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'y79yrq61' /* Подтвердить */,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Evolventa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (!currentUserEmailVerified)
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  FFLocalizations.of(context).getText(
                                    'kjzekphk' /* Email не подтвержден */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Evolventa',
                                        color: const Color(0xFFFF3F3F),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
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
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 46.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'EDIT_PROFILE_Container_ffb6lw25_ON_TAP');
                      logFirebaseEvent('Container_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        displayName: _model.nameTextController.text != ''
                            ? _model.nameTextController.text
                            : currentUserDisplayName,
                        surname: _model.surnameTextController.text != ''
                            ? _model.surnameTextController.text
                            : valueOrDefault(currentUserDocument?.surname, ''),
                        phoneNumber: _model.phoneTextController.text != ''
                            ? _model.phoneTextController.text
                            : currentPhoneNumber,
                        photoUrl: _model.uploadedFileUrl != ''
                            ? _model.uploadedFileUrl
                            : currentUserPhoto,
                      ));
                      logFirebaseEvent('Container_navigate_to');

                      context.goNamed('profileCabinet');
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
                            'bu2xr0l3' /* Применить */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Evolventa',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
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
    );
  }
}
