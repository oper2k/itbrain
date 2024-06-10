import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/study/created_by/created_by_widget.dart';
import '/study/divider/divider_widget.dart';
import '/study/study_audio/study_audio_widget.dart';
import '/study/study_file/study_file_widget.dart';
import '/study/study_image/study_image_widget.dart';
import '/study/task_book_comp/task_book_comp_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'content_block_widget.dart' show ContentBlockWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContentBlockModel extends FlutterFlowModel<ContentBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for studyImage component.
  late StudyImageModel studyImageModel;
  // Model for studyAudio component.
  late StudyAudioModel studyAudioModel;
  // Stores action output result for [Custom Action - convertLessonToMeditation] action in studyAudio widget.
  List<MeditationsRecord>? meditations;
  // Model for createdBy component.
  late CreatedByModel createdByModel;
  // Model for taskBookComp component.
  late TaskBookCompModel taskBookCompModel;
  // Model for divider component.
  late DividerModel dividerModel;
  // Model for studyFile component.
  late StudyFileModel studyFileModel;

  @override
  void initState(BuildContext context) {
    studyImageModel = createModel(context, () => StudyImageModel());
    studyAudioModel = createModel(context, () => StudyAudioModel());
    createdByModel = createModel(context, () => CreatedByModel());
    taskBookCompModel = createModel(context, () => TaskBookCompModel());
    dividerModel = createModel(context, () => DividerModel());
    studyFileModel = createModel(context, () => StudyFileModel());
  }

  @override
  void dispose() {
    studyImageModel.dispose();
    studyAudioModel.dispose();
    createdByModel.dispose();
    taskBookCompModel.dispose();
    dividerModel.dispose();
    studyFileModel.dispose();
  }
}
