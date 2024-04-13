import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stories_model.dart';
export 'stories_model.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({
    super.key,
    required this.stories,
    required this.index,
  });

  final List<StoriesRecord>? stories;
  final int? index;

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  late StoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoriesModel());

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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: custom_widgets.Story(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              initialPage: widget.index!,
              allStories: widget.stories
                  ?.where(
                      (e) => e.lang == FFLocalizations.of(context).languageCode)
                  .toList(),
              color: FlutterFlowTheme.of(context).primaryBackground,
              image:
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/d-m-t-meditation-y84ym0/assets/kel0crxujwhz/Background.png',
              onUserChanged: () async {
                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'viewedStories':
                          FieldValue.arrayUnion([FFAppState().currentStory]),
                    },
                  ),
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
