import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/meditations/meditations_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:text_search/text_search.dart';
import 'search_page_new_model.dart';
export 'search_page_new_model.dart';

class SearchPageNewWidget extends StatefulWidget {
  const SearchPageNewWidget({super.key});

  @override
  State<SearchPageNewWidget> createState() => _SearchPageNewWidgetState();
}

class _SearchPageNewWidgetState extends State<SearchPageNewWidget> {
  late SearchPageNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.yesCreateScreenshots();
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Frame_11818.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 46.0, 24.0, 46.0),
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
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(96.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(96.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                width: 219.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x15FFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(96.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(96.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        FFIcons.ksearch,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              const Duration(milliseconds: 300),
                                              () async {
                                                setState(() {
                                                  _model.searchOk = true;
                                                });
                                                await queryMeditationsRecordOnce()
                                                    .then(
                                                      (records) => _model
                                                              .simpleSearchResults =
                                                          TextSearch(
                                                        records
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                    record
                                                                        .title
                                                                  ]),
                                                            )
                                                            .toList(),
                                                      )
                                                              .search(_model
                                                                  .textController
                                                                  .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .toList(),
                                                    )
                                                    .onError((_, __) => _model
                                                            .simpleSearchResults =
                                                        [])
                                                    .whenComplete(
                                                        () => setState(() {}));
                                              },
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6q5n83tq' /* Что бы вы хотели послушать? */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        fontSize: 12.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/Subtract.webp',
                                        width: 103.0,
                                        height: 56.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.5, 0.0),
                                      child: Icon(
                                        FFIcons.kclose2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (!_model.searchOk!) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mc97jo4d' /* История поиска */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Evolventa',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 17.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.41,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'searchHistory':
                                                FieldValue.delete(),
                                          },
                                        ),
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '85uigr7j' /* Очистить */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Evolventa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.6,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final meditationRef =
                                            (currentUserDocument?.searchHistory
                                                        .toList() ??
                                                    [])
                                                .toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: meditationRef.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 32.0),
                                          itemBuilder:
                                              (context, meditationRefIndex) {
                                            final meditationRefItem =
                                                meditationRef[
                                                    meditationRefIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: StreamBuilder<
                                                  MeditationsRecord>(
                                                stream:
                                                    FFAppState().historyCache(
                                                  requestFn: () =>
                                                      MeditationsRecord
                                                          .getDocument(
                                                              meditationRefItem),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final meditationsMeditationsRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'playerPage',
                                                        queryParameters: {
                                                          'audio':
                                                              serializeParam(
                                                            functions
                                                                .addMeditationDocumentToList(
                                                                    meditationsMeditationsRecord),
                                                            ParamType.Document,
                                                            true,
                                                          ),
                                                          'medCategory':
                                                              serializeParam(
                                                            meditationsMeditationsRecord
                                                                .meditationCategory,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'audio': functions
                                                              .addMeditationDocumentToList(
                                                                  meditationsMeditationsRecord),
                                                        },
                                                      );
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .meditationsModels1
                                                          .getModel(
                                                        meditationRefIndex
                                                            .toString(),
                                                        meditationRefIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child: MeditationsWidget(
                                                        key: Key(
                                                          'Keyztd_${meditationRefIndex.toString()}',
                                                        ),
                                                        meditation:
                                                            meditationsMeditationsRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final results =
                                    _model.simpleSearchResults.toList();
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: results.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 32.0),
                                  itemBuilder: (context, resultsIndex) {
                                    final resultsItem = results[resultsIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: StreamBuilder<
                                          MeditationCategoriesRecord>(
                                        stream: MeditationCategoriesRecord
                                            .getDocument(resultsItem
                                                .meditationCategory!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final meditationsMeditationCategoriesRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (resultsItem.isPaid) {
                                                if ((currentUserDocument
                                                            ?.purchasedMeditationsPacks
                                                            .toList() ??
                                                        [])
                                                    .contains(resultsItem
                                                        .meditationCategory)) {
                                                  setState(() {
                                                    FFAppState().positionMS = 0;
                                                  });

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'searchHistory':
                                                            FieldValue
                                                                .arrayUnion([
                                                          resultsItem.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });

                                                  context.pushNamed(
                                                    'playerPage',
                                                    queryParameters: {
                                                      'audio': serializeParam(
                                                        _model
                                                            .simpleSearchResults,
                                                        ParamType.Document,
                                                        true,
                                                      ),
                                                      'medCategory':
                                                          serializeParam(
                                                        resultsItem
                                                            .meditationCategory,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'audio': _model
                                                          .simpleSearchResults,
                                                    },
                                                  );

                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    'meditationInfo',
                                                    queryParameters: {
                                                      'meditationCategory':
                                                          serializeParam(
                                                        meditationsMeditationCategoriesRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'meditationCategory':
                                                          meditationsMeditationCategoriesRecord,
                                                    },
                                                  );

                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'searchHistory':
                                                            FieldValue
                                                                .arrayUnion([
                                                          resultsItem.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  return;
                                                }
                                              } else {
                                                setState(() {
                                                  FFAppState().positionMS = 0;
                                                });

                                                context.pushNamed(
                                                  'playerPage',
                                                  queryParameters: {
                                                    'audio': serializeParam(
                                                      _model
                                                          .simpleSearchResults,
                                                      ParamType.Document,
                                                      true,
                                                    ),
                                                    'medCategory':
                                                        serializeParam(
                                                      resultsItem
                                                          .meditationCategory,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'audio': _model
                                                        .simpleSearchResults,
                                                  },
                                                );

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'searchHistory':
                                                          FieldValue
                                                              .arrayUnion([
                                                        resultsItem.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                return;
                                              }
                                            },
                                            child: wrapWithModel(
                                              model: _model.meditationsModels2
                                                  .getModel(
                                                resultsIndex.toString(),
                                                resultsIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: MeditationsWidget(
                                                key: Key(
                                                  'Keyv7j_${resultsIndex.toString()}',
                                                ),
                                                meditation: resultsItem,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }
                      },
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
