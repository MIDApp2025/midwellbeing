import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.currentPhoto,
  });

  final String? currentPhoto;

  static String routeName = 'editProfile';
  static String routePath = '/editProfile';

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;
  bool _isPicking = false; // ✅ tämä estää iOS:lla tuplagallerian

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentPhotoUrl = widget.currentPhoto;
      safeSetState(() {});
    });

    _model.yourNameTextController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    _model.cityTextController ??= TextEditingController();
    _model.cityFocusNode ??= FocusNode();

    _model.myBioTextController ??= TextEditingController();
    _model.myBioFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.emailTextController?.text =
              FFLocalizations.of(context).getText(
            'fonsu6rw' /*  */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent3,
        appBar: AppBar(
          backgroundColor: Color(0x0094B5D8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(ViewprofileWidget.routeName);
            },
          ),
          title: AutoSizeText(
            FFLocalizations.of(context).getText(
              '8ethu2dz' /* MID Edit profile */,
            ),
            minFontSize: 16.0,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.more_vert,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(SettingsageWidget.routeName);
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 570.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 44.0, 16.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'jn2yunef' /* Edit Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          shape: BoxShape.circle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
            width: 2.0,
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,

          onTap: () async {
  if (_isPicking) return; // 🔒 estää tuplakutsun
  _isPicking = true;

 try {
  await Future.delayed(const Duration(milliseconds: 200)); // 🩹 iOS fix
  final selectedMedia = await selectMediaWithSourceBottomSheet(
    context: context,
    maxWidth: 1024.0,
    maxHeight: 1024.0,
    imageQuality: 80,
    allowPhoto: true,
    includeDimensions: true,
  );

    if (selectedMedia != null &&
        selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
      _model.uploadedLocalFile_uploadedFileURLViewPageNew = FFUploadedFile(
        name: selectedMedia.first.storagePath.split('/').last,
        bytes: selectedMedia.first.bytes,
        height: selectedMedia.first.dimensions?.height,
        width: selectedMedia.first.dimensions?.width,
        blurHash: selectedMedia.first.blurHash,
      );

      safeSetState(() {});
      safeSetState(() =>
          _model.isDataUploading_uploadedFileURLViewPageNew = true);

      var selectedUploadedFiles = <FFUploadedFile>[];
      var downloadUrls = <String>[];

      try {
        selectedUploadedFiles = selectedMedia
            .map((m) => FFUploadedFile(
                  name: m.storagePath.split('/').last,
                  bytes: m.bytes,
                  height: m.dimensions?.height,
                  width: m.dimensions?.width,
                  blurHash: m.blurHash,
                ))
            .toList();

        downloadUrls = (await Future.wait(selectedMedia.map(
          (m) async => await uploadData(m.storagePath, m.bytes),
        )))
            .where((u) => u != null)
            .map((u) => u!)
            .toList();
      } finally {
        _model.isDataUploading_uploadedFileURLViewPageNew = false;
      }

      if (selectedUploadedFiles.length == selectedMedia.length &&
          downloadUrls.length == selectedMedia.length) {
        safeSetState(() {
          _model.uploadedLocalFile_uploadedFileURLViewPageNew =
              selectedUploadedFiles.first;
          _model.uploadedFileUrl_uploadedFileURLViewPageNew = downloadUrls.first;
        });
      } else {
        safeSetState(() {});
        return;
      }

      await Future.delayed(const Duration(milliseconds: 200));
      await actions.cropSelectedImage();
      _model.finalPhotoUrl = _model.uploadedFileUrl_uploadedFileURLViewPageNew;
      safeSetState(() {});
    }
  } finally {
    _isPicking = false; // 🔓 vapautetaan lukko
  }
},

          onLongPress: () async {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Delete profile picture?'),
                      content: Text('Are you sure you want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;

            if (confirmDialogResponse) {
              _model.apiResultDelete = await DeleteUserPhotoCall.call(
                userId: currentUserUid,
              );

              _model.currentPhotoUrl = '';
              safeSetState(() {});
              await actions.forceClearImage();
              context.safePop();
            }

            safeSetState(() {});
          },

          child: ClipOval(
            child: Builder(
              builder: (context) {
                if (_model.uploadedLocalFile_uploadedFileURLViewPageNew?.bytes != null) {
                  return Image.memory(
                    _model.uploadedLocalFile_uploadedFileURLViewPageNew!.bytes!,
                    fit: BoxFit.cover,
                  );
                } else if (_model.uploadedFileUrl_uploadedFileURLViewPageNew.isNotEmpty) {
                  return Image.network(
                    _model.uploadedFileUrl_uploadedFileURLViewPageNew,
                    fit: BoxFit.cover,
                  );
                } else if (widget.currentPhoto != null &&
                    widget.currentPhoto!.isNotEmpty) {
                  return Image.network(
                    widget.currentPhoto!,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Image.asset(
                    'assets/images/avatar-1577909_640.png',
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
          ),
        ),
      ),
    ],
  ),
),



                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 36.0, 20.0, 12.0),
                          child: TextFormField(
                            controller: _model.yourNameTextController,
                            focusNode: _model.yourNameFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '15bjjt1h' /* Your Name */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.yourNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 12.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.countryValueController ??=
                                  FormFieldController<String>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  '3sry2247' /* Finland */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'u55ebezs' /* Sweden */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4mr3etg4' /* Norway */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'uag0eeoq' /* Denmark */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'i21tkg17' /* Germany */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mfw725dm' /* France */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'u5d8y537' /* Netherlands */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '1xkyh1yu' /* Belgium */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ka95ibpg' /* Switzerland */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2tk30uz2' /* Austria */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mlfiad9d' /* Spain */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'br6vciou' /* Italy */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'm742tdsi' /* Portugal */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '59k13g6r' /* Greece */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'czesg0id' /* United Kingdom */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '737ek4nz' /* Ireland */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'lkxfb6z7' /* Poland */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'th23i3sc' /* Czech Republic */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '41vyl00d' /* Slovakia */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'lhfabo99' /* Hungary */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ehzafso2' /* Romania */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'd6zbmuqm' /* Bulgaria */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '5clxo19h' /* China */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ji376krm' /* Japan */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6nvx54hf' /* South Korea */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xk68yoab' /* India */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ug3t3aje' /* Thailand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'w8htw0xk' /* USA */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'r37hioc6' /* Canada */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'upqhymus' /* Mexico */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xctyp8cn' /* Brazil */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'qymjjyny' /* Argentina */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '1wqrlrjx' /* Chile */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'd2o3gtu4' /* South Africa */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6jhx2bqb' /* Nigeria */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3hflumyl' /* Egypt */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'gsr4uxpb' /* Australia */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ixdueexb' /* New Zealand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3wvn6mxh' /* Other */,
                                )
                              ],
                              onChanged: (val) =>
                                  safeSetState(() => _model.countryValue = val),
                              width: double.infinity,
                              menuOffset: const Offset(0, 200.0),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'u0pgklnn' /* Select Country */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 1.0,
                              borderRadius: 12.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 12.0),
                            child: TextFormField(
                              controller: _model.cityTextController,
                              focusNode: _model.cityFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'gpt3fsfp' /* Your City */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              validator: _model.cityTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 12.0),
                            child: TextFormField(
                              controller: _model.myBioTextController,
                              focusNode: _model.myBioFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.myBioTextController',
                                Duration(milliseconds: 2000),
                                () => safeSetState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'p2dcatpz' /* Your bio */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'bsh0tvfp' /* Your bio */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                                suffixIcon: _model
                                        .myBioTextController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.myBioTextController?.clear();
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 4,
                              validator: _model.myBioTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 24.0),
                          child: TextFormField(
                            controller: _model.emailTextController,
                            focusNode: _model.emailFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'djebyudm' /* Email */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '81ho7wd9' /*  */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.emailTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.05),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 24.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.createUserProfile =
                                    await CreateUserProfileCall.call(
                                  userId: currentUserUid,
                                  city: _model.cityTextController.text,
                                  bio: _model.myBioTextController.text,
                                  displayName:
                                      _model.yourNameTextController.text,
                                  country: _model.countryValue,
                                  photoUrl: _model
                                      .uploadedFileUrl_uploadedFileURLViewPageNew,
                                  email: _model.emailTextController.text,
                                );

                                if ((_model.createUserProfile?.succeeded ??
                                    true)) {
                                  _model.getProfileParams =
                                      await GetUserProfileCall.call(
                                    userId: currentUserUid,
                                  );

                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    ViewprofileWidget.routeName,
                                    queryParameters: {
                                      'name': serializeParam(
                                        UserProfileResponseStruct.maybeFromMap(
                                                (_model.getProfileParams
                                                        ?.jsonBody ??
                                                    ''))
                                            ?.displayName,
                                        ParamType.String,
                                      ),
                                      'country': serializeParam(
                                        UserProfileResponseStruct.maybeFromMap(
                                                (_model.getProfileParams
                                                        ?.jsonBody ??
                                                    ''))
                                            ?.country,
                                        ParamType.String,
                                      ),
                                      'city': serializeParam(
                                        UserProfileResponseStruct.maybeFromMap(
                                                (_model.getProfileParams
                                                        ?.jsonBody ??
                                                    ''))
                                            ?.city,
                                        ParamType.String,
                                      ),
                                      'bio': serializeParam(
                                        UserProfileResponseStruct.maybeFromMap(
                                                (_model.getProfileParams
                                                        ?.jsonBody ??
                                                    ''))
                                            ?.bio,
                                        ParamType.String,
                                      ),
                                      'email': serializeParam(
                                        UserProfileResponseStruct.maybeFromMap(
                                                (_model.getProfileParams
                                                        ?.jsonBody ??
                                                    ''))
                                            ?.email,
                                        ParamType.String,
                                      ),
                                      'photoUrl': serializeParam(
                                        _model.finalPhotoUrl,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'create profile not succeed',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'vgdyjjlb' /* Save Changes */,
                              ),
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
