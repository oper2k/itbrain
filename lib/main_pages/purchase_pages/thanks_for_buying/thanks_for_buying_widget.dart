import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'thanks_for_buying_model.dart';
export 'thanks_for_buying_model.dart';

class ThanksForBuyingWidget extends StatefulWidget {
  const ThanksForBuyingWidget({super.key});

  @override
  State<ThanksForBuyingWidget> createState() => _ThanksForBuyingWidgetState();
}

class _ThanksForBuyingWidgetState extends State<ThanksForBuyingWidget> {
  late ThanksForBuyingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThanksForBuyingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Frame_11818.png',
          ).image,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: Icon(
                FFIcons.kheadphones,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 104.0,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'l1euzcsg' /* Спасибо за покупку */,
                ),
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
                FFLocalizations.of(context).getText(
                  '7tg1x2jk' /* Ваш платеж пока обрабатывается */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Evolventa',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                      lineHeight: 1.41,
                    ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('THANKS_FOR_BUYING_Container_c1ym1rkq_ON_');
                  logFirebaseEvent('Container_navigate_to');

                  context.goNamed(
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
                        '647mfzjl' /* На главную */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
  }
}
