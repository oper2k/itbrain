import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'book_page_info_model.dart';
export 'book_page_info_model.dart';

class BookPageInfoWidget extends StatefulWidget {
  const BookPageInfoWidget({
    super.key,
    required this.pageInfo,
  });

  final BooksPagesRecord? pageInfo;

  @override
  State<BookPageInfoWidget> createState() => _BookPageInfoWidgetState();
}

class _BookPageInfoWidgetState extends State<BookPageInfoWidget> {
  late BookPageInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookPageInfoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'bookPageInfo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_INFO_bookPageInfo_ON_INIT_STATE');
      logFirebaseEvent('bookPageInfo_custom_action');
      await actions.notCreateScreenshots();
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
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 46.0),
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
                        logFirebaseEvent('BOOK_INFO_Container_shbosqyg_ON_TAP');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed('HomePage');
                      },
                      child: Container(
                        width: 40.0,
                        height: 44.0,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Icon(
                            FFIcons.kclose2,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.pageInfo?.title,
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Evolventa',
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 44.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('BOOK_INFO_Image_2yaoitp8_ON_TAP');
                      logFirebaseEvent('Image_expand_image');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 0),
                              fadeOutDuration: const Duration(milliseconds: 0),
                              imageUrl: widget.pageInfo!.photo,
                              fit: BoxFit.contain,
                            ),
                            allowRotation: true,
                            tag: widget.pageInfo!.photo,
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: widget.pageInfo!.photo,
                      transitionOnUserGestures: true,
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 0),
                        fadeOutDuration: const Duration(milliseconds: 0),
                        imageUrl: widget.pageInfo!.photo,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.pageInfo?.textTitle,
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: MarkdownBody(
                      data: widget.pageInfo!.mainText,
                      selectable: false,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ),
                  ),
                ),
              ].addToEnd(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
