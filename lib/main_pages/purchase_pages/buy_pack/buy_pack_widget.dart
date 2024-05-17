import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'buy_pack_model.dart';
export 'buy_pack_model.dart';

class BuyPackWidget extends StatefulWidget {
  const BuyPackWidget({
    super.key,
    required this.meditationCategory,
  });

  final MeditationCategoriesRecord? meditationCategory;

  @override
  State<BuyPackWidget> createState() => _BuyPackWidgetState();
}

class _BuyPackWidgetState extends State<BuyPackWidget> {
  late BuyPackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyPackModel());

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
        body: StreamBuilder<List<MeditationsRecord>>(
          stream: FFAppState().buyPackCache(
            uniqueQueryKey: widget.meditationCategory?.reference.id,
            requestFn: () => queryMeditationsRecord(
              queryBuilder: (meditationsRecord) => meditationsRecord.where(
                'meditationCategory',
                isEqualTo: widget.meditationCategory?.reference,
              ),
            ),
          ),
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
            List<MeditationsRecord> containerMeditationsRecordList =
                snapshot.data!;
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
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 46.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            '1mqgvry8' /* Покупка пака */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getVariableText(
                            ruText: widget.meditationCategory?.nameCategory,
                            enText: widget.meditationCategory?.nameCategoryEng,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 28.0, 4.0, 0.0),
                        child: Text(
                          '${FFLocalizations.of(context).getVariableText(
                            ruText: 'Вы получите полный доступ к этому паку с ',
                            enText:
                                ' You will get full access to this pack with ',
                          )}${valueOrDefault<String>(
                            containerMeditationsRecordList.length.toString(),
                            '0',
                          )}${FFLocalizations.of(context).getVariableText(
                            ruText: ' медитациями внутри',
                            enText: ' meditations inside',
                          )}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Evolventa',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                                lineHeight: 1.2,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 20.0, 4.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final meditations =
                                  containerMeditationsRecordList.toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: meditations.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 36.0),
                                itemBuilder: (context, meditationsIndex) {
                                  final meditationsItem =
                                      meditations[meditationsIndex];
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: const BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: MeditationsWidget(
                                        key: Key(
                                            'Keya8c_${meditationsIndex}_of_${meditations.length}'),
                                        meditation: meditationsItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'z5n995ut' /* Сумма */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getVariableText(
                                  ruText:
                                      '${widget.meditationCategory?.coastOfPack.toString()} ₽',
                                  enText:
                                      '${widget.meditationCategory?.coastOfPackEng} \$',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.29,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 34.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'paymentMethod',
                            queryParameters: {
                              'category': serializeParam(
                                widget.meditationCategory,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'category': widget.meditationCategory,
                            },
                          );
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
                                'wj08bxya' /* Далее */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
            );
          },
        ),
      ),
    );
  }
}
