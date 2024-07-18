import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbar/navbar_profile/navbar_profile_widget.dart';
import '/profile/check_purchases/check_purchases_widget.dart';
import '/profile/log_out_confirm/log_out_confirm_widget.dart';
import '/profile/rate_the_app/rate_the_app_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'profile_cabinet_model.dart';
export 'profile_cabinet_model.dart';

class ProfileCabinetWidget extends StatefulWidget {
  const ProfileCabinetWidget({super.key});

  @override
  State<ProfileCabinetWidget> createState() => _ProfileCabinetWidgetState();
}

class _ProfileCabinetWidgetState extends State<ProfileCabinetWidget>
    with TickerProviderStateMixin {
  late ProfileCabinetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCabinetModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profileCabinet'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_CABINET_profileCabinet_ON_INIT_S');
      logFirebaseEvent('profileCabinet_custom_action');
      await actions.yesCreateScreenshots();
      logFirebaseEvent('profileCabinet_custom_action');
      await actions.lockOrientation();
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 820.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        body: Container(
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 0.0),
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
                            logFirebaseEvent(
                                'PROFILE_CABINET_Container_g9haqbvh_ON_TA');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              'HomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_CABINET_Container_a4h9yvat_ON_TA');
                            logFirebaseEvent('Container_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const LogOutConfirmWidget(),
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
                                FFIcons.kleft23,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 160.0,
                                height: 170.0,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (currentUserPhoto != '') {
                                            return Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
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
                                                    image: NetworkImage(
                                                      currentUserPhoto,
                                                    ),
                                                    width: 164.0,
                                                    height: 164.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Container(
                                              width: 164.0,
                                              height: 164.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .buttonColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    functions.nameSurnameFirstLetters(
                                                        currentUserDisplayName,
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.surname,
                                                            ''))!,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          fontSize: 40.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (!currentUserEmailVerified) {
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_CABINET_Container_jhl3yy0h_ON_TA');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context
                                                    .pushNamed('editProfile');
                                              },
                                              child: Container(
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFFF3F3F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        FFIcons
                                                            .kattentionTriangle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '87r6bjyr' /* Подтвердите email */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Evolventa',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else if (currentUserEmailVerified) {
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_CABINET_Container_r2y5lsoo_ON_TA');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context
                                                    .pushNamed('editProfile');
                                              },
                                              child: Container(
                                                width: 126.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFF9747FF),
                                                      Color(0xFFF1618E),
                                                      Color(0xFFFE710B)
                                                    ],
                                                    stops: [0.0, 0.4, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, 0.34),
                                                    end: AlignmentDirectional(
                                                        -1.0, -0.34),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.done,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 16.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zn198xg4' /* Подтвержден */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Evolventa',
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  '$currentUserDisplayName ${valueOrDefault(currentUserDocument?.surname, '')}',
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
                                    0.0, 8.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILE_CABINET_PAGE_Row_gzqntcgs_ON_TAP');
                                    logFirebaseEvent('Row_navigate_to');

                                    context.pushNamed('editProfile');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'hwhd0k82' /* Изменить профиль */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Evolventa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                                lineHeight: 1.29,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kedit1,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 18.0,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: StreamBuilder<List<AffirmationRecord>>(
                                stream: queryAffirmationRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<AffirmationRecord>
                                      containerAffirmationRecordList =
                                      snapshot.data!;

                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerAffirmationRecord =
                                      containerAffirmationRecordList.isNotEmpty
                                          ? containerAffirmationRecordList.first
                                          : null;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PROFILE_CABINET_Container_el6nck9q_ON_TA');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed('changeLanguage');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .buttonColor2,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FFIcons.k332,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '57j7skci' /* Сменить язык */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_CABINET_Container_iqpg6i5d_ON_TA');
                                  logFirebaseEvent('Container_launch_u_r_l');
                                  await launchURL(FFLocalizations.of(context)
                                      .getVariableText(
                                    ruText:
                                        'https://gold-platform.ru/cms/system/contact',
                                    enText:
                                        'https://kamallaya-academy.com/cms/system/contact',
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .buttonColor2,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kheadphones,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'qp57yist' /* Поддержка */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_CABINET_Container_dln8tlea_ON_TA');
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
                                          child: const RateTheAppWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .buttonColor2,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kstar,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'axa6feaj' /* Оценить приложение */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PROFILE_CABINET_Container_7e2osajn_ON_TA');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed('aboutPage');
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .buttonColor2,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kinfoCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '35gw7woq' /* О приложении */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Evolventa',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if ((currentUserEmail == 'test@test.test') ||
                                (currentUserEmail ==
                                    'alexsabinovcom@gmail.com'))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILE_CABINET_PAGE_Debug_ON_TAP');
                                    if ((currentUserEmail ==
                                            'test@test.test') ||
                                        (currentUserEmail ==
                                            'alexsabinovcom@gmail.com')) {
                                      logFirebaseEvent('Debug_navigate_to');

                                      context.pushNamed('DebugPage');
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .buttonColor2,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.bug,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sy3bs2sk' /* Отладка */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Evolventa',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            StreamBuilder<List<ShowAppleRecord>>(
                              stream: queryShowAppleRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).tertiary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ShowAppleRecord>
                                    containerShowAppleRecordList =
                                    snapshot.data!;

                                final containerShowAppleRecord =
                                    containerShowAppleRecordList.isNotEmpty
                                        ? containerShowAppleRecordList.first
                                        : null;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Visibility(
                                    visible:
                                        containerShowAppleRecord?.isShow1 ??
                                            true,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILE_CABINET_Container_gpg67m6d_ON_TA');
                                          logFirebaseEvent(
                                              'Container_revenue_cat');
                                          await revenue_cat.restorePurchases();
                                          logFirebaseEvent(
                                              'Container_firestore_query');
                                          _model.orders =
                                              await queryOrdersRecordOnce(
                                            queryBuilder: (ordersRecord) =>
                                                ordersRecord.where(
                                              'client_email',
                                              isEqualTo: currentUserEmail,
                                            ),
                                          );
                                          if (_model.orders!.isNotEmpty) {
                                            logFirebaseEvent(
                                                'Container_firestore_query');
                                            _model.meditations =
                                                await queryMeditationCategoriesRecordOnce(
                                              queryBuilder:
                                                  (meditationCategoriesRecord) =>
                                                      meditationCategoriesRecord
                                                          .whereIn(
                                                              'getcourse_offer',
                                                              _model.orders
                                                                  ?.map((e) => e
                                                                      .purchasedProduct)
                                                                  .toList()),
                                            );
                                            logFirebaseEvent(
                                                'Container_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'purchasedMeditationsPacks':
                                                      _model.meditations
                                                          ?.map((e) =>
                                                              e.reference)
                                                          .toList(),
                                                },
                                              ),
                                            });
                                          }
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
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
                                                  child: const CheckPurchasesWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .buttonColor2,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  FFIcons.kbag2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6j51rwq2' /* Восстановить покупки */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Evolventa',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ].addToEnd(const SizedBox(height: 100.0)),
                        ),
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarProfileModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: const NavbarProfileWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
