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
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  Local state fields for this page.

  bool showEmailError = false;

  bool showPassError = false;

  bool showConfirmPassError = false;

  bool showNameError = false;

  bool showSurnameError = false;

  bool showPhoneError = false;

  bool showMatchError = false;

  bool showDocExistsError = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? users;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameController;
  String? Function(BuildContext, String?)? surnameControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPassVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    surnameFocusNode?.dispose();
    surnameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
