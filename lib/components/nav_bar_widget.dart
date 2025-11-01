import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.95),
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SafeArea(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color(0x02202124),
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: 100.0,
                height: 120.0,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.050000000000000044),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 100.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0x0094B5D8),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.05, -0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.home_rounded,
                              color:
                                  getCurrentRoute(context) == '/gettingStarted'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(GettingStartedWidget.routeName);
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.chat_bubble,
                              color:
                                  'midkysymyksettoimii://midkysymyksettoimii.com${GoRouterState.of(context).uri.toString()}' ==
                                          '/miDAiChat'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(MIDChatAICopyWidget.routeName);
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.05, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 25.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.leaf,
                                    color: getCurrentRoute(context) ==
                                            '/mygrowth'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    size: 26.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(MygrowthWidget.routeName);
                                  },
                                ),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.favorite,
                              color: getCurrentRoute(context) == '/insights'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                              size: 26.0,
                            ),
                            onPressed: () async {
                              await Future.delayed(
                                Duration(
                                  milliseconds: 200,
                                ),
                              );

                              context.pushNamed(
                                InsightsWidget.routeName,
                                queryParameters: {
                                  'userTimezone': serializeParam(
                                    dateTimeFormat(
                                      "d/M h:mm a",
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.lightbulb,
                              color: (getCurrentRoute(context) == MaikkiWidget.routeName ||
        getCurrentRoute(context) == MaikkiWidget.routePath)
    ? FlutterFlowTheme.of(context).primary
    : FlutterFlowTheme.of(context).secondary,

                              size: 26.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(MaikkiWidget.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
