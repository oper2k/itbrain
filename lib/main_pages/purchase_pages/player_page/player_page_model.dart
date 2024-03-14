import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/is_deleted_once/is_deleted_once_widget.dart';
import '/profile/is_downloaded_once/is_downloaded_once_widget.dart';
import '/profile/is_not_downloaded/is_not_downloaded_widget.dart';
import '/profile/meditation_player_info/meditation_player_info_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PlayerPageModel extends FlutterFlowModel<PlayerPageWidget> {
  ///  Local state fields for this page.

  bool isAudioLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // Stores action output result for [Custom Action - deleteFiles] action in RemoveTrackBtn widget.
  bool? isDeleted;
  // Stores action output result for [Custom Action - downloadUrl] action in DonwloadTrackBtn widget.
  bool? isDownload;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
