import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'confirm_email_profile_model.dart';
export 'confirm_email_profile_model.dart';

class ConfirmEmailProfileWidget extends StatefulWidget {
  const ConfirmEmailProfileWidget({super.key});

  @override
  State<ConfirmEmailProfileWidget> createState() =>
      _ConfirmEmailProfileWidgetState();
}

class _ConfirmEmailProfileWidgetState extends State<ConfirmEmailProfileWidget> {
  late ConfirmEmailProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmEmailProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'confirmEmailProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFIRM_EMAIL_PROFILE_confirmEmailProfil');
      await authManager.refreshUser();
      logFirebaseEvent('confirmEmailProfile_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('confirmEmailProfile_timer');
      _model.timerController.onStartTimer();
      logFirebaseEvent('confirmEmailProfile_auth');
      await authManager.sendEmailVerification();
      logFirebaseEvent('confirmEmailProfile_start_periodic_actio');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 300),
        callback: (timer) async {
          if (currentUserEmailVerified) {
            logFirebaseEvent('confirmEmailProfile_update_page_state');
            _model.emailVerified = true;
            setState(() {});
            logFirebaseEvent('confirmEmailProfile_stop_periodic_action');
            _model.instantTimer?.cancel();
            if (currentUserEmailVerified) {
              logFirebaseEvent('confirmEmailProfile_navigate_to');

              context.goNamed('editProfile');

              logFirebaseEvent('confirmEmailProfile_show_snack_bar');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Email подтвержден!',
                    style: TextStyle(
                      fontFamily: 'Evolventa',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 15.0,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: const Color(0xFF541882),
                ),
              );
            }
          } else {
            logFirebaseEvent('confirmEmailProfile_update_page_state');
            _model.emailVerified = false;
            setState(() {});
            return;
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 46.0),
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
                            'CONFIRM_EMAIL_PROFILE_Container_t3xlp0wv');
                        logFirebaseEvent('Container_navigate_back');
                        context.pop();
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
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CONFIRM_EMAIL_PROFILE_НАПИСАТЬ_В_ПОДДЕРЖ');
                        logFirebaseEvent('Button_launch_u_r_l');
                        await launchURL(
                            FFLocalizations.of(context).getVariableText(
                          ruText: 'https://gold-platform.ru/cms/system/contact',
                          enText:
                              'https://kamallaya-academy.com/cms/system/contact',
                        ));
                      },
                      text: FFLocalizations.of(context).getText(
                        'crrgc7f3' /* Написать в поддержку */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Evolventa',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                  lineHeight: 1.6,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/9jbw0_.webp',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'yl8kmbu3' /* Подтвердите email */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getVariableText(
                      ruText:
                          'Для этого перейдите по ссылке в письме на $currentUserEmail',
                      enText: 'follow the link on$currentUserEmail',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (!_model.showNewCode) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'x3fb3rnp' /* Отправить код еще раз через */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Evolventa',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                              FlutterFlowTimer(
                                initialTime: _model.timerInitialTimeMs,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.timerController,
                                updateStateInterval:
                                    const Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) setState(() {});
                                },
                                onEnded: () async {
                                  logFirebaseEvent(
                                      'CONFIRM_EMAIL_PROFILE_Timer_sov0gcv9_ON_');
                                  logFirebaseEvent('Timer_update_page_state');
                                  _model.showNewCode = true;
                                  setState(() {});
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Evolventa',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CONFIRM_EMAIL_PROFILE_ОТПРАВИТЬ_КОД_ЕЩЕ_');
                              logFirebaseEvent('Button_auth');
                              await authManager.sendEmailVerification();
                              logFirebaseEvent('Button_update_page_state');
                              _model.showNewCode = false;
                              setState(() {});
                              logFirebaseEvent('Button_timer');
                              _model.timerController.onResetTimer();

                              logFirebaseEvent('Button_timer');
                              _model.timerController.onStartTimer();
                            },
                            text: FFLocalizations.of(context).getText(
                              'n9p18jdy' /* Отправить код еще раз */,
                            ),
                            options: FFButtonOptions(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Evolventa',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                    lineHeight: 1.2,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'd9f6lqf8' /* Не забудьте проверить папку «С... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Evolventa',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                          lineHeight: 1.2,
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
