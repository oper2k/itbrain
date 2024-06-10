import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'study_cover_model.dart';
export 'study_cover_model.dart';

class StudyCoverWidget extends StatefulWidget {
  const StudyCoverWidget({super.key});

  @override
  State<StudyCoverWidget> createState() => _StudyCoverWidgetState();
}

class _StudyCoverWidgetState extends State<StudyCoverWidget> {
  late StudyCoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudyCoverModel());
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
      height: 190.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 500),
          fadeOutDuration: const Duration(milliseconds: 500),
          imageUrl: 'https://picsum.photos/seed/400/600',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
