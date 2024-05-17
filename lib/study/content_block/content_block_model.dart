import '/flutter_flow/flutter_flow_util.dart';
import '/study/created_by/created_by_widget.dart';
import '/study/divider/divider_widget.dart';
import '/study/study_audio/study_audio_widget.dart';
import '/study/study_image/study_image_widget.dart';
import '/study/task_book_comp/task_book_comp_widget.dart';
import 'content_block_widget.dart' show ContentBlockWidget;
import 'package:flutter/material.dart';

class ContentBlockModel extends FlutterFlowModel<ContentBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for studyImage component.
  late StudyImageModel studyImageModel;
  // Model for studyAudio component.
  late StudyAudioModel studyAudioModel;
  // Model for createdBy component.
  late CreatedByModel createdByModel;
  // Model for taskBookComp component.
  late TaskBookCompModel taskBookCompModel;
  // Model for divider component.
  late DividerModel dividerModel;

  @override
  void initState(BuildContext context) {
    studyImageModel = createModel(context, () => StudyImageModel());
    studyAudioModel = createModel(context, () => StudyAudioModel());
    createdByModel = createModel(context, () => CreatedByModel());
    taskBookCompModel = createModel(context, () => TaskBookCompModel());
    dividerModel = createModel(context, () => DividerModel());
  }

  @override
  void dispose() {
    studyImageModel.dispose();
    studyAudioModel.dispose();
    createdByModel.dispose();
    taskBookCompModel.dispose();
    dividerModel.dispose();
  }
}
