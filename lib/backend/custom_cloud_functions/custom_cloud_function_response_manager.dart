import '/backend/schema/structs/index.dart';

class CheckGetcoursePaymentsCloudFunctionCallResponse {
  CheckGetcoursePaymentsCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
