import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_page_widget.dart' show SignInPageWidget;
import 'package:flutter/material.dart';

class SignInPageModel extends FlutterFlowModel<SignInPageWidget> {
  ///  Local state fields for this page.

  bool showEmailError = false;

  bool showPassError = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
