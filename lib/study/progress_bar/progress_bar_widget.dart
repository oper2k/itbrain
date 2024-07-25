import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'progress_bar_model.dart';
export 'progress_bar_model.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    super.key,
    required this.levels,
    required this.course,
  });

  final LevelsRecord? levels;
  final StudyCategoriesRecord? course;

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late ProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LessonsRecord>>(
      stream: queryLessonsRecord(
        queryBuilder: (lessonsRecord) => lessonsRecord
            .where(
              'course',
              isEqualTo: widget.course?.reference,
            )
            .where(
              'lang',
              isEqualTo: FFLocalizations.of(context).languageCode,
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
        List<LessonsRecord> containerLessonsRecordList = snapshot.data!;

        return Container(
          width: 24.0,
          height: 24.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: AuthUserStreamWidget(
            builder: (context) => CircularPercentIndicator(
              percent: valueOrDefault<double>(
                functions.progressFull(
                    containerLessonsRecordList
                        .where((e) =>
                            (e.level == widget.levels?.reference) &&
                            (e.course == widget.course?.reference) &&
                            (currentUserDocument?.completeLessons.toList() ??
                                    [])
                                .contains(e.reference))
                        .toList()
                        .length
                        .toDouble(),
                    containerLessonsRecordList
                        .where((e) =>
                            (e.level == widget.levels?.reference) &&
                            (e.course == widget.course?.reference))
                        .toList()
                        .length
                        .toDouble()),
                0.0,
              ),
              radius: 12.0,
              lineWidth: 3.0,
              animation: true,
              animateFromLastPercent: true,
              progressColor: FlutterFlowTheme.of(context).primary,
              backgroundColor: FlutterFlowTheme.of(context).accent4,
            ),
          ),
        );
      },
    );
  }
}
