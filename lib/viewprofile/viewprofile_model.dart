import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'viewprofile_widget.dart' show ViewprofileWidget;
import 'package:flutter/material.dart';

class ViewprofileModel extends FlutterFlowModel<ViewprofileWidget> {
  ///  Local state fields for this page.

  String? viewPagePhotoUrl;

  String? name;

  String? country;

  String? city;

  String? myBio;

  String? email;

  String? photo;

  UserProfileResponseStruct? userProfileData;
  void updateUserProfileDataStruct(
      Function(UserProfileResponseStruct) updateFn) {
    updateFn(userProfileData ??= UserProfileResponseStruct());
  }

  bool? hasImage;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getUserProfile)] action in viewprofile widget.
  ApiCallResponse? apiResultViewProfile;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
