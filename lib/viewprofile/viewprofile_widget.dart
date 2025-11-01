import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'viewprofile_model.dart';
export 'viewprofile_model.dart';

class ViewprofileWidget extends StatefulWidget {
  const ViewprofileWidget({
    super.key,
    this.name,
    this.country,
    this.city,
    this.bio,
    this.email,
    this.photoUrl,
  });

  final String? name;
  final String? country;
  final String? city;
  final String? bio;
  final String? email;
  final String? photoUrl;

  static String routeName = 'viewprofile';
  static String routePath = '/viewprofile';

  @override
  State<ViewprofileWidget> createState() => _ViewprofileWidgetState();
}

class _ViewprofileWidgetState extends State<ViewprofileWidget> {
  late ViewprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewprofileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 400,
        ),
      );
      _model.apiResultViewProfile = await GetUserProfileCall.call(
        userId: currentUserUid,
      );

      await Future.delayed(
        Duration(
          milliseconds: 400,
        ),
      );
      _model.name = UserProfileResponseStruct.maybeFromMap(
              (_model.apiResultViewProfile?.jsonBody ?? ''))
          ?.displayName;
      safeSetState(() {});
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.country = UserProfileResponseStruct.maybeFromMap(
              (_model.apiResultViewProfile?.jsonBody ?? ''))
          ?.country;
      safeSetState(() {});
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.city = UserProfileResponseStruct.maybeFromMap(
              (_model.apiResultViewProfile?.jsonBody ?? ''))
          ?.city;
      safeSetState(() {});
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.myBio = UserProfileResponseStruct.maybeFromMap(
              (_model.apiResultViewProfile?.jsonBody ?? ''))
          ?.bio;
      safeSetState(() {});
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      _model.photo = getJsonField(
        (_model.apiResultViewProfile?.jsonBody ?? ''),
        r'''$.photo_url''',
      ).toString();
      _model.hasImage = true;
      safeSetState(() {});
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            context.pushNamed(GettingStartedWidget.routeName);
          },
        ),
        title: AutoSizeText(
          FFLocalizations.of(context).getText(
            '2jqne7hh' /* MID Your profile */,
          ),
          minFontSize: 16.0,
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.interTight(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 110.0,
                                      height: 110.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: custom_widgets.CircleImageCover(
                                          width: 100.0,
                                          height: 100.0,
                                          imageUrl: widget.photoUrl == null ||
                                                  widget.photoUrl == ''
                                              ? valueOrDefault<String>(
                                                  getJsonField(
                                                    (_model.apiResultViewProfile
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.photo_url''',
                                                  )?.toString(),
                                                  'photo',
                                                )
                                              : valueOrDefault<String>(
                                                  widget.photoUrl,
                                                  'photo',
                                                ),
                                          size: 100.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hh8z3rgr' /* Your information */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.91,
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 8.0, 16.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.name != null && widget.name != ''
                                        ? widget.name
                                        : _model.name,
                                    'Name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.91,
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 8.0, 8.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.country != null &&
                                            widget.country != ''
                                        ? widget.country
                                        : _model.country,
                                    'Country',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.91,
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 8.0, 8.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.city != null && widget.city != ''
                                        ? widget.city
                                        : _model.city,
                                    'City',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.91,
                              height: MediaQuery.sizeOf(context).height * 0.14,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 8.0, 8.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.bio != null && widget.bio != ''
                                        ? widget.bio
                                        : _model.myBio,
                                    'My bio',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.91,
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 8.0, 8.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.email != null && widget.email != ''
                                        ? widget.email
                                        : valueOrDefault<String>(
                                            _model.email,
                                            'Email',
                                          ),
                                    'email',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        EditProfileWidget.routeName,
                        queryParameters: {
                          'currentPhoto': serializeParam(
                            getJsonField(
                              (_model.apiResultViewProfile?.jsonBody ?? ''),
                              r'''$.photo_url''',
                            ).toString(),
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '7q5ooeau' /* Edit Profile */,
                    ),
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                Container(
                  height: 200.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
