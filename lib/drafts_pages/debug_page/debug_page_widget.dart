import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'debug_page_model.dart';
export 'debug_page_model.dart';

class DebugPageWidget extends StatefulWidget {
  const DebugPageWidget({
    super.key,
    this.meditaionsList,
  });

  final List<MeditationsRecord>? meditaionsList;

  @override
  State<DebugPageWidget> createState() => _DebugPageWidgetState();
}

class _DebugPageWidgetState extends State<DebugPageWidget> {
  late DebugPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugPageModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '29zd174a' /* DEBUG PAGE */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Evolventa',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Builder(
              builder: (context) {
                final item = widget.meditaionsList?.toList() ?? [];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(item.length, (itemIndex) {
                    final itemItem = item[itemIndex];
                    return Text(
                      valueOrDefault<String>(
                        itemItem.title,
                        '-_-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Evolventa',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
