import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';
import '/flutter_flow/upload_data.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  // 🟢 Tällä säilytetään valittu kuva heti galleriasta, ennen kuin se tallennetaan pilveen.
  FFUploadedFile? uploadedLocalFile_uploadedFileURLViewPageNew;

  String? yourName;
  String? city;
  String? country;
  String? bio;

  FFUploadedFile? uploadedImage;
  String? base64Image;
  String? uploadedPhotoUrlApiReturn;
  String? finalPhotoUrl;
  String? currentPhotoUrl;
  bool? hasImage;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadedFileURLViewPageNew = false;
  FFUploadedFile uploadedLocalFile_uploadedFileURLViewPageNew_init =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadedFileURLViewPageNew = '';

  // Stores action output result for [Backend Call - API (deleteUserPhoto)] action in CircleImageCover widget.
  ApiCallResponse? apiResultDelete;

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;

  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;

  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  // Stores action output result for [Backend Call - API (createUserProfile)] action in Button widget.
  ApiCallResponse? createUserProfile;

  // Stores action output result for [Backend Call - API (getUserProfile)] action in Button widget.
  ApiCallResponse? getProfileParams;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

