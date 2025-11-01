import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _testId = prefs.getString('ff_testId') ?? _testId;
    });
    _safeInit(() {
      _sessionId = prefs.getString('ff_sessionId') ?? _sessionId;
    });
    _safeInit(() {
      _currentQuestion = prefs.getInt('ff_currentQuestion') ?? _currentQuestion;
    });
    _safeInit(() {
      _lastanswer =
          prefs.getStringList('ff_lastanswer')?.map(int.parse).toList() ??
              _lastanswer;
    });
    _safeInit(() {
      _activeSessionIdApp =
          prefs.getString('ff_activeSessionIdApp') ?? _activeSessionIdApp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _SelectedIndex = 0;
  int get SelectedIndex => _SelectedIndex;
  set SelectedIndex(int value) {
    _SelectedIndex = value;
  }

  /// Käyttäjän valitsema testi
  String _testId = '';
  String get testId => _testId;
  set testId(String value) {
    _testId = value;
    prefs.setString('ff_testId', value);
  }

  /// Yksilöllinen testi-istunto
  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
    prefs.setString('ff_sessionId', value);
  }

  /// Missä kohdassa testi on
  int _currentQuestion = 0;
  int get currentQuestion => _currentQuestion;
  set currentQuestion(int value) {
    _currentQuestion = value;
    prefs.setInt('ff_currentQuestion', value);
  }

  /// Tallentaa vastaukset
  List<int> _lastanswer = [];
  List<int> get lastanswer => _lastanswer;
  set lastanswer(List<int> value) {
    _lastanswer = value;
    prefs.setStringList(
        'ff_lastanswer', value.map((x) => x.toString()).toList());
  }

  void addToLastanswer(int value) {
    lastanswer.add(value);
    prefs.setStringList(
        'ff_lastanswer', _lastanswer.map((x) => x.toString()).toList());
  }

  void removeFromLastanswer(int value) {
    lastanswer.remove(value);
    prefs.setStringList(
        'ff_lastanswer', _lastanswer.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromLastanswer(int index) {
    lastanswer.removeAt(index);
    prefs.setStringList(
        'ff_lastanswer', _lastanswer.map((x) => x.toString()).toList());
  }

  void updateLastanswerAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    lastanswer[index] = updateFn(_lastanswer[index]);
    prefs.setStringList(
        'ff_lastanswer', _lastanswer.map((x) => x.toString()).toList());
  }

  void insertAtIndexInLastanswer(int index, int value) {
    lastanswer.insert(index, value);
    prefs.setStringList(
        'ff_lastanswer', _lastanswer.map((x) => x.toString()).toList());
  }

  List<dynamic> _testMessages = [];
  List<dynamic> get testMessages => _testMessages;
  set testMessages(List<dynamic> value) {
    _testMessages = value;
  }

  void addToTestMessages(dynamic value) {
    testMessages.add(value);
  }

  void removeFromTestMessages(dynamic value) {
    testMessages.remove(value);
  }

  void removeAtIndexFromTestMessages(int index) {
    testMessages.removeAt(index);
  }

  void updateTestMessagesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    testMessages[index] = updateFn(_testMessages[index]);
  }

  void insertAtIndexInTestMessages(int index, dynamic value) {
    testMessages.insert(index, value);
  }

  List<dynamic> _emptyMessageList = [];
  List<dynamic> get emptyMessageList => _emptyMessageList;
  set emptyMessageList(List<dynamic> value) {
    _emptyMessageList = value;
  }

  void addToEmptyMessageList(dynamic value) {
    emptyMessageList.add(value);
  }

  void removeFromEmptyMessageList(dynamic value) {
    emptyMessageList.remove(value);
  }

  void removeAtIndexFromEmptyMessageList(int index) {
    emptyMessageList.removeAt(index);
  }

  void updateEmptyMessageListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    emptyMessageList[index] = updateFn(_emptyMessageList[index]);
  }

  void insertAtIndexInEmptyMessageList(int index, dynamic value) {
    emptyMessageList.insert(index, value);
  }

  /// Näyttää käyttäjän viimeisimmän vastauksen
  String _latestAnswerUser = '';
  String get latestAnswerUser => _latestAnswerUser;
  set latestAnswerUser(String value) {
    _latestAnswerUser = value;
  }

  /// antaa uuden kysymyjsen
  String _apiMessage = '';
  String get apiMessage => _apiMessage;
  set apiMessage(String value) {
    _apiMessage = value;
  }

  int _nextQuestion = 0;
  int get nextQuestion => _nextQuestion;
  set nextQuestion(int value) {
    _nextQuestion = value;
  }

  String _apiButtonMessage = '';
  String get apiButtonMessage => _apiButtonMessage;
  set apiButtonMessage(String value) {
    _apiButtonMessage = value;
  }

  String _testStart = '';
  String get testStart => _testStart;
  set testStart(String value) {
    _testStart = value;
  }

  List<String> _ChatMessages = [];
  List<String> get ChatMessages => _ChatMessages;
  set ChatMessages(List<String> value) {
    _ChatMessages = value;
  }

  void addToChatMessages(String value) {
    ChatMessages.add(value);
  }

  void removeFromChatMessages(String value) {
    ChatMessages.remove(value);
  }

  void removeAtIndexFromChatMessages(int index) {
    ChatMessages.removeAt(index);
  }

  void updateChatMessagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ChatMessages[index] = updateFn(_ChatMessages[index]);
  }

  void insertAtIndexInChatMessages(int index, String value) {
    ChatMessages.insert(index, value);
  }

  String _textField = '';
  String get textField => _textField;
  set textField(String value) {
    _textField = value;
  }

  String _apiOpenQuestion = '';
  String get apiOpenQuestion => _apiOpenQuestion;
  set apiOpenQuestion(String value) {
    _apiOpenQuestion = value;
  }

  String _openQuestion = '';
  String get openQuestion => _openQuestion;
  set openQuestion(String value) {
    _openQuestion = value;
  }

  String _testTheme = '';
  String get testTheme => _testTheme;
  set testTheme(String value) {
    _testTheme = value;
  }

  String _testName = '';
  String get testName => _testName;
  set testName(String value) {
    _testName = value;
  }

  String _openAnswer = '';
  String get openAnswer => _openAnswer;
  set openAnswer(String value) {
    _openAnswer = value;
  }

  String _selectedTestName = '';
  String get selectedTestName => _selectedTestName;
  set selectedTestName(String value) {
    _selectedTestName = value;
  }

  dynamic _palyload;
  dynamic get palyload => _palyload;
  set palyload(dynamic value) {
    _palyload = value;
  }

  int _answer = 0;
  int get answer => _answer;
  set answer(int value) {
    _answer = value;
  }

  List<dynamic> _connectionAndBelongingTests = [];
  List<dynamic> get connectionAndBelongingTests => _connectionAndBelongingTests;
  set connectionAndBelongingTests(List<dynamic> value) {
    _connectionAndBelongingTests = value;
  }

  void addToConnectionAndBelongingTests(dynamic value) {
    connectionAndBelongingTests.add(value);
  }

  void removeFromConnectionAndBelongingTests(dynamic value) {
    connectionAndBelongingTests.remove(value);
  }

  void removeAtIndexFromConnectionAndBelongingTests(int index) {
    connectionAndBelongingTests.removeAt(index);
  }

  void updateConnectionAndBelongingTestsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    connectionAndBelongingTests[index] =
        updateFn(_connectionAndBelongingTests[index]);
  }

  void insertAtIndexInConnectionAndBelongingTests(int index, dynamic value) {
    connectionAndBelongingTests.insert(index, value);
  }

  List<dynamic> _thinkingAndDecisionsTests = [];
  List<dynamic> get thinkingAndDecisionsTests => _thinkingAndDecisionsTests;
  set thinkingAndDecisionsTests(List<dynamic> value) {
    _thinkingAndDecisionsTests = value;
  }

  void addToThinkingAndDecisionsTests(dynamic value) {
    thinkingAndDecisionsTests.add(value);
  }

  void removeFromThinkingAndDecisionsTests(dynamic value) {
    thinkingAndDecisionsTests.remove(value);
  }

  void removeAtIndexFromThinkingAndDecisionsTests(int index) {
    thinkingAndDecisionsTests.removeAt(index);
  }

  void updateThinkingAndDecisionsTestsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    thinkingAndDecisionsTests[index] =
        updateFn(_thinkingAndDecisionsTests[index]);
  }

  void insertAtIndexInThinkingAndDecisionsTests(int index, dynamic value) {
    thinkingAndDecisionsTests.insert(index, value);
  }

  List<dynamic> _growthAndStrengthTests = [];
  List<dynamic> get growthAndStrengthTests => _growthAndStrengthTests;
  set growthAndStrengthTests(List<dynamic> value) {
    _growthAndStrengthTests = value;
  }

  void addToGrowthAndStrengthTests(dynamic value) {
    growthAndStrengthTests.add(value);
  }

  void removeFromGrowthAndStrengthTests(dynamic value) {
    growthAndStrengthTests.remove(value);
  }

  void removeAtIndexFromGrowthAndStrengthTests(int index) {
    growthAndStrengthTests.removeAt(index);
  }

  void updateGrowthAndStrengthTestsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    growthAndStrengthTests[index] = updateFn(_growthAndStrengthTests[index]);
  }

  void insertAtIndexInGrowthAndStrengthTests(int index, dynamic value) {
    growthAndStrengthTests.insert(index, value);
  }

  List<ConfidenceTestQuestionStruct> _FeelingsAndMood = [];
  List<ConfidenceTestQuestionStruct> get FeelingsAndMood => _FeelingsAndMood;
  set FeelingsAndMood(List<ConfidenceTestQuestionStruct> value) {
    _FeelingsAndMood = value;
  }

  void addToFeelingsAndMood(ConfidenceTestQuestionStruct value) {
    FeelingsAndMood.add(value);
  }

  void removeFromFeelingsAndMood(ConfidenceTestQuestionStruct value) {
    FeelingsAndMood.remove(value);
  }

  void removeAtIndexFromFeelingsAndMood(int index) {
    FeelingsAndMood.removeAt(index);
  }

  void updateFeelingsAndMoodAtIndex(
    int index,
    ConfidenceTestQuestionStruct Function(ConfidenceTestQuestionStruct)
        updateFn,
  ) {
    FeelingsAndMood[index] = updateFn(_FeelingsAndMood[index]);
  }

  void insertAtIndexInFeelingsAndMood(
      int index, ConfidenceTestQuestionStruct value) {
    FeelingsAndMood.insert(index, value);
  }

  List<ApiTestItemStruct> _fetchedTestsList = [];
  List<ApiTestItemStruct> get fetchedTestsList => _fetchedTestsList;
  set fetchedTestsList(List<ApiTestItemStruct> value) {
    _fetchedTestsList = value;
  }

  void addToFetchedTestsList(ApiTestItemStruct value) {
    fetchedTestsList.add(value);
  }

  void removeFromFetchedTestsList(ApiTestItemStruct value) {
    fetchedTestsList.remove(value);
  }

  void removeAtIndexFromFetchedTestsList(int index) {
    fetchedTestsList.removeAt(index);
  }

  void updateFetchedTestsListAtIndex(
    int index,
    ApiTestItemStruct Function(ApiTestItemStruct) updateFn,
  ) {
    fetchedTestsList[index] = updateFn(_fetchedTestsList[index]);
  }

  void insertAtIndexInFetchedTestsList(int index, ApiTestItemStruct value) {
    fetchedTestsList.insert(index, value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  String _savedUserId = '';
  String get savedUserId => _savedUserId;
  set savedUserId(String value) {
    _savedUserId = value;
  }

  bool _savedIsImportant = false;
  bool get savedIsImportant => _savedIsImportant;
  set savedIsImportant(bool value) {
    _savedIsImportant = value;
  }

  String _savedMessageContent = '';
  String get savedMessageContent => _savedMessageContent;
  set savedMessageContent(String value) {
    _savedMessageContent = value;
  }

  String _currentDay = '';
  String get currentDay => _currentDay;
  set currentDay(String value) {
    _currentDay = value;
  }

  String _selectedType = '';
  String get selectedType => _selectedType;
  set selectedType(String value) {
    _selectedType = value;
  }

  int _selectedValue = 0;
  int get selectedValue => _selectedValue;
  set selectedValue(int value) {
    _selectedValue = value;
  }

  String _selectedLanguage = '';
  String get selectedLanguage => _selectedLanguage;
  set selectedLanguage(String value) {
    _selectedLanguage = value;
  }

  String _selectedContext = '';
  String get selectedContext => _selectedContext;
  set selectedContext(String value) {
    _selectedContext = value;
  }

  String _customContext = '';
  String get customContext => _customContext;
  set customContext(String value) {
    _customContext = value;
  }

  bool _customTextField = false;
  bool get customTextField => _customTextField;
  set customTextField(bool value) {
    _customTextField = value;
  }

  bool _isFullMonthCalendar = false;
  bool get isFullMonthCalendar => _isFullMonthCalendar;
  set isFullMonthCalendar(bool value) {
    _isFullMonthCalendar = value;
  }

  DateTime? _selectedConfidenceDate =
      DateTime.fromMillisecondsSinceEpoch(1754941980000);
  DateTime? get selectedConfidenceDate => _selectedConfidenceDate;
  set selectedConfidenceDate(DateTime? value) {
    _selectedConfidenceDate = value;
  }

  DateTime? _selectedCalendarDate =
      DateTime.fromMillisecondsSinceEpoch(1754941980000);
  DateTime? get selectedCalendarDate => _selectedCalendarDate;
  set selectedCalendarDate(DateTime? value) {
    _selectedCalendarDate = value;
  }

  DateTime? _lastSelectedCalendarDay =
      DateTime.fromMillisecondsSinceEpoch(1754941920000);
  DateTime? get lastSelectedCalendarDay => _lastSelectedCalendarDay;
  set lastSelectedCalendarDay(DateTime? value) {
    _lastSelectedCalendarDay = value;
  }

  String _documentIdToQuery = '';
  String get documentIdToQuery => _documentIdToQuery;
  set documentIdToQuery(String value) {
    _documentIdToQuery = value;
  }

  String _deleteOivallus = '';
  String get deleteOivallus => _deleteOivallus;
  set deleteOivallus(String value) {
    _deleteOivallus = value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  String _latestAssistantText = '';
  String get latestAssistantText => _latestAssistantText;
  set latestAssistantText(String value) {
    _latestAssistantText = value;
  }

  List<MessageStruct> _chat = [];
  List<MessageStruct> get chat => _chat;
  set chat(List<MessageStruct> value) {
    _chat = value;
  }

  void addToChat(MessageStruct value) {
    chat.add(value);
  }

  void removeFromChat(MessageStruct value) {
    chat.remove(value);
  }

  void removeAtIndexFromChat(int index) {
    chat.removeAt(index);
  }

  void updateChatAtIndex(
    int index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    chat[index] = updateFn(_chat[index]);
  }

  void insertAtIndexInChat(int index, MessageStruct value) {
    chat.insert(index, value);
  }

  bool _hasSummaryMood = false;
  bool get hasSummaryMood => _hasSummaryMood;
  set hasSummaryMood(bool value) {
    _hasSummaryMood = value;
  }

  bool _hasSummaryConfidence = false;
  bool get hasSummaryConfidence => _hasSummaryConfidence;
  set hasSummaryConfidence(bool value) {
    _hasSummaryConfidence = value;
  }

  bool _hasSummaryStregth = false;
  bool get hasSummaryStregth => _hasSummaryStregth;
  set hasSummaryStregth(bool value) {
    _hasSummaryStregth = value;
  }

  bool _hasSummaryBelonging = false;
  bool get hasSummaryBelonging => _hasSummaryBelonging;
  set hasSummaryBelonging(bool value) {
    _hasSummaryBelonging = value;
  }

  bool _hasWeek = false;
  bool get hasWeek => _hasWeek;
  set hasWeek(bool value) {
    _hasWeek = value;
  }

  bool _hasMonth = false;
  bool get hasMonth => _hasMonth;
  set hasMonth(bool value) {
    _hasMonth = value;
  }

  List<dynamic> _historyItems = [];
  List<dynamic> get historyItems => _historyItems;
  set historyItems(List<dynamic> value) {
    _historyItems = value;
  }

  void addToHistoryItems(dynamic value) {
    historyItems.add(value);
  }

  void removeFromHistoryItems(dynamic value) {
    historyItems.remove(value);
  }

  void removeAtIndexFromHistoryItems(int index) {
    historyItems.removeAt(index);
  }

  void updateHistoryItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    historyItems[index] = updateFn(_historyItems[index]);
  }

  void insertAtIndexInHistoryItems(int index, dynamic value) {
    historyItems.insert(index, value);
  }

  dynamic _weeklyHistorySheet;
  dynamic get weeklyHistorySheet => _weeklyHistorySheet;
  set weeklyHistorySheet(dynamic value) {
    _weeklyHistorySheet = value;
  }

  dynamic _monthlyHistorySheet;
  dynamic get monthlyHistorySheet => _monthlyHistorySheet;
  set monthlyHistorySheet(dynamic value) {
    _monthlyHistorySheet = value;
  }

  List<dynamic> _monthlyHistoryItems = [];
  List<dynamic> get monthlyHistoryItems => _monthlyHistoryItems;
  set monthlyHistoryItems(List<dynamic> value) {
    _monthlyHistoryItems = value;
  }

  void addToMonthlyHistoryItems(dynamic value) {
    monthlyHistoryItems.add(value);
  }

  void removeFromMonthlyHistoryItems(dynamic value) {
    monthlyHistoryItems.remove(value);
  }

  void removeAtIndexFromMonthlyHistoryItems(int index) {
    monthlyHistoryItems.removeAt(index);
  }

  void updateMonthlyHistoryItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    monthlyHistoryItems[index] = updateFn(_monthlyHistoryItems[index]);
  }

  void insertAtIndexInMonthlyHistoryItems(int index, dynamic value) {
    monthlyHistoryItems.insert(index, value);
  }

  List<String> _savedMessageIds = [];
  List<String> get savedMessageIds => _savedMessageIds;
  set savedMessageIds(List<String> value) {
    _savedMessageIds = value;
  }

  void addToSavedMessageIds(String value) {
    savedMessageIds.add(value);
  }

  void removeFromSavedMessageIds(String value) {
    savedMessageIds.remove(value);
  }

  void removeAtIndexFromSavedMessageIds(int index) {
    savedMessageIds.removeAt(index);
  }

  void updateSavedMessageIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    savedMessageIds[index] = updateFn(_savedMessageIds[index]);
  }

  void insertAtIndexInSavedMessageIds(int index, String value) {
    savedMessageIds.insert(index, value);
  }

  String _chatMemoryContext = '';
  String get chatMemoryContext => _chatMemoryContext;
  set chatMemoryContext(String value) {
    _chatMemoryContext = value;
  }

  String _chatMemoryContextLive = '';
  String get chatMemoryContextLive => _chatMemoryContextLive;
  set chatMemoryContextLive(String value) {
    _chatMemoryContextLive = value;
  }

  bool _hasSentHistory = false;
  bool get hasSentHistory => _hasSentHistory;
  set hasSentHistory(bool value) {
    _hasSentHistory = value;
  }

  String _chatSummary12 = '';
  String get chatSummary12 => _chatSummary12;
  set chatSummary12(String value) {
    _chatSummary12 = value;
  }

  int _newCount = 0;
  int get newCount => _newCount;
  set newCount(int value) {
    _newCount = value;
  }

  int _MessageCounterTest = 0;
  int get MessageCounterTest => _MessageCounterTest;
  set MessageCounterTest(int value) {
    _MessageCounterTest = value;
  }

  bool _hasUpdatedTitle = false;
  bool get hasUpdatedTitle => _hasUpdatedTitle;
  set hasUpdatedTitle(bool value) {
    _hasUpdatedTitle = value;
  }

  String _activeSessionIdApp = '';
  String get activeSessionIdApp => _activeSessionIdApp;
  set activeSessionIdApp(String value) {
    _activeSessionIdApp = value;
    prefs.setString('ff_activeSessionIdApp', value);
  }

  int _listVersion = 0;
  int get listVersion => _listVersion;
  set listVersion(int value) {
    _listVersion = value;
  }

  bool _isHydrating = false;
  bool get isHydrating => _isHydrating;
  set isHydrating(bool value) {
    _isHydrating = value;
  }

  int _week = 0;
  int get week => _week;
  set week(int value) {
    _week = value;
  }

  String _overrideUID = '';
  String get overrideUID => _overrideUID;
  set overrideUID(String value) {
    _overrideUID = value;
  }

  List<ChatSessionsStruct> _chatSessions = [];
  List<ChatSessionsStruct> get chatSessions => _chatSessions;
  set chatSessions(List<ChatSessionsStruct> value) {
    _chatSessions = value;
  }

  void addToChatSessions(ChatSessionsStruct value) {
    chatSessions.add(value);
  }

  void removeFromChatSessions(ChatSessionsStruct value) {
    chatSessions.remove(value);
  }

  void removeAtIndexFromChatSessions(int index) {
    chatSessions.removeAt(index);
  }

  void updateChatSessionsAtIndex(
    int index,
    ChatSessionsStruct Function(ChatSessionsStruct) updateFn,
  ) {
    chatSessions[index] = updateFn(_chatSessions[index]);
  }

  void insertAtIndexInChatSessions(int index, ChatSessionsStruct value) {
    chatSessions.insert(index, value);
  }

  double _selectedValueDouble = 0.0;
  double get selectedValueDouble => _selectedValueDouble;
  set selectedValueDouble(double value) {
    _selectedValueDouble = value;
  }

  String _currentQuote = '';
  String get currentQuote => _currentQuote;
  set currentQuote(String value) {
    _currentQuote = value;
  }

  bool _isComplited = false;
  bool get isComplited => _isComplited;
  set isComplited(bool value) {
    _isComplited = value;
  }

  bool _isTrue = false;
  bool get isTrue => _isTrue;
  set isTrue(bool value) {
    _isTrue = value;
  }

  bool _refreshList = false;
  bool get refreshList => _refreshList;
  set refreshList(bool value) {
    _refreshList = value;
  }

  double _progMoodMh = 0.0;
  double get progMoodMh => _progMoodMh;
  set progMoodMh(double value) {
    _progMoodMh = value;
  }

  double _progBelongingMh = 0.0;
  double get progBelongingMh => _progBelongingMh;
  set progBelongingMh(double value) {
    _progBelongingMh = value;
  }

  double _progConfidenceMh = 0.0;
  double get progConfidenceMh => _progConfidenceMh;
  set progConfidenceMh(double value) {
    _progConfidenceMh = value;
  }

  double _ProgStrengthMh = 0.0;
  double get ProgStrengthMh => _ProgStrengthMh;
  set ProgStrengthMh(double value) {
    _ProgStrengthMh = value;
  }

  double _progMoodWr = 0.0;
  double get progMoodWr => _progMoodWr;
  set progMoodWr(double value) {
    _progMoodWr = value;
  }

  double _progConfidenceWr = 0.0;
  double get progConfidenceWr => _progConfidenceWr;
  set progConfidenceWr(double value) {
    _progConfidenceWr = value;
  }

  double _progBelongingWr = 0.0;
  double get progBelongingWr => _progBelongingWr;
  set progBelongingWr(double value) {
    _progBelongingWr = value;
  }

  double _progStrengthWr = 0.0;
  double get progStrengthWr => _progStrengthWr;
  set progStrengthWr(double value) {
    _progStrengthWr = value;
  }

  double _averMoodWr = 0.0;
  double get averMoodWr => _averMoodWr;
  set averMoodWr(double value) {
    _averMoodWr = value;
  }

  double _AverConfidenceWr = 0.0;
  double get AverConfidenceWr => _AverConfidenceWr;
  set AverConfidenceWr(double value) {
    _AverConfidenceWr = value;
  }

  double _averBelongingWr = 0.0;
  double get averBelongingWr => _averBelongingWr;
  set averBelongingWr(double value) {
    _averBelongingWr = value;
  }

  double _averStrengthWr = 0.0;
  double get averStrengthWr => _averStrengthWr;
  set averStrengthWr(double value) {
    _averStrengthWr = value;
  }

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
  }

  String _bio = '';
  String get bio => _bio;
  set bio(String value) {
    _bio = value;
  }

  String _country = '';
  String get country => _country;
  set country(String value) {
    _country = value;
  }

  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  dynamic _profileAll;
  dynamic get profileAll => _profileAll;
  set profileAll(dynamic value) {
    _profileAll = value;
  }

  String _titleUpdate = '';
  String get titleUpdate => _titleUpdate;
  set titleUpdate(String value) {
    _titleUpdate = value;
  }

  String _appLanguage = '';
  String get appLanguage => _appLanguage;
  set appLanguage(String value) {
    _appLanguage = value;
  }

  String _updatetAtNote = '';
  String get updatetAtNote => _updatetAtNote;
  set updatetAtNote(String value) {
    _updatetAtNote = value;
  }

  String _tempEditedNotes = '';
  String get tempEditedNotes => _tempEditedNotes;
  set tempEditedNotes(String value) {
    _tempEditedNotes = value;
  }

  bool _isListening = false;
  bool get isListening => _isListening;
  set isListening(bool value) {
    _isListening = value;
  }

  String _micText = '';
  String get micText => _micText;
  set micText(String value) {
    _micText = value;
  }

  bool _redrawTrigger = false;
  bool get redrawTrigger => _redrawTrigger;
  set redrawTrigger(bool value) {
    _redrawTrigger = value;
  }

  String _userTimezone = '';
  String get userTimezone => _userTimezone;
  set userTimezone(String value) {
    _userTimezone = value;
  }

  String _createdAtNote = '';
  String get createdAtNote => _createdAtNote;
  set createdAtNote(String value) {
    _createdAtNote = value;
  }

  String _createdAtRaw = '';
  String get createdAtRaw => _createdAtRaw;
  set createdAtRaw(String value) {
    _createdAtRaw = value;
  }

  int _timezoneOffset = 0;
  int get timezoneOffset => _timezoneOffset;
  set timezoneOffset(int value) {
    _timezoneOffset = value;
  }

  List<dynamic> _allCoachingPrograms = [
    jsonDecode(
        '[{\"id\":\"thankyourself\",\"emoji\":\"💖\",\"titleEn\":\"Thank Yourself\",\"titleFi\":\"Kiitä itseäsi\",\"longTitleEn\":\"The Art of Thanking Yourself\",\"longTitleFi\":\"Itsensä Kiittämisen Taito\",\"contentEn\":[\"Close your eyes. Take three slow, steady breaths. Feel yourself arriving in this moment — without needing to do anything.\",\"Think of recent moments when you could have given up, but didn’t. Maybe you kept going while tired, maybe you were kind while struggling, or maybe you simply got out of bed. All of these deserve gratitude.\",\"Say quietly or out loud: \'Thank you, me. Thank you for doing your best. Thank you for still being here.\' Notice what happens in your body when you say this.\",\"Thanking yourself isn’t selfish — it’s self-compassion. It reconnects you to your humanity and helps you move forward more gently.\",\"✨ Daily practice: Each evening, whisper one sentence: \'Today, I thank myself for…\' and finish it with something small but true.\"],\"contentFi\":[\"Sulje silmäsi. Hengitä kolme hidasta, tasaista henkäystä. Tunne itsesi tässä hetkessä – ilman että sinun tarvitsee tehdä mitään.\",\"Mieti hetkiä, jolloin olisit voinut luovuttaa, mutta et tehnyt sitä. Ehkä jatkoit väsyneenä, olit ystävällinen vaikeuksista huolimatta, tai vain nousit sängystä. Kaikki nämä ansaitsevat kiitollisuuden.\",\"Sano hiljaa tai ääneen: \'Kiitos, minä. Kiitos, että teit parhaasi. Kiitos, että olet vielä täällä.\' Huomaa, mitä kehossasi tapahtuu, kun sanot tämän.\",\"Itsensä kiittäminen ei ole itsekästä – se on itsemyötätuntoa. Se yhdistää sinut uudelleen inhimillisyyteesi ja auttaa sinua liikkumaan eteenpäin lempeämmin.\",\"✨ Päivittäinen harjoitus: Kuiskaa joka ilta yksi lause: \'Tänään kiitän itseäni…\' ja täydennä se jollakin pienellä, mutta todenmukaisella asialla.\"]},{\"id\":\"pause\",\"emoji\":\"🌿\",\"titleEn\":\"Pause for a moment\",\"titleFi\":\"Pysähdy hetkeksi\",\"longTitleEn\":\"Finding Balance in Stillness\",\"longTitleFi\":\"Tasapainon Löytäminen Pysähtyneisyydessä\",\"contentEn\":[\"Take five quiet minutes today. Turn off notifications and simply breathe.\",\"Ask yourself: \'What do I need right now?\'\",\"Often balance begins not from doing more, but by stopping for a moment.\",\"Notice that stillness is not emptiness — it’s space for clarity to enter.\"],\"contentFi\":[\"Ota tänään viisi hiljaista minuuttia. Sammuta ilmoitukset ja vain hengitä.\",\"Kysy itseltäsi: \'Mitä tarvitsen juuri nyt?\'\",\"Usein tasapaino alkaa ei tekemällä enemmän, vaan pysähtymällä hetkeksi.\",\"Huomaa, että pysähtyneisyys ei ole tyhjyyttä – se on tilaa selkeydelle saapua.\"]},{\"id\":\"courage\",\"emoji\":\"🔥\",\"titleEn\":\"Do one brave thing\",\"titleFi\":\"Tee yksi rohkea asia\",\"longTitleEn\":\"The Small Act of Courage\",\"longTitleFi\":\"Pieni Rohkeuden Teko\",\"contentEn\":[\"Courage doesn’t always roar — sometimes it’s a quiet decision.\",\"Think of one thing you’ve postponed because of fear or doubt.\",\"Today, take a tiny step toward it. Even writing it down counts.\",\"Courage grows not from confidence, but from action despite uncertainty.\"],\"contentFi\":[\"Rohkeus ei aina karju – joskus se on hiljainen päätös.\",\"Mieti yhtä asiaa, jota olet lykännyt pelon tai epäilyn vuoksi.\",\"Ota tänään pieni askel sitä kohti. Jo sen kirjoittaminen riittää.\",\"Rohkeus kasvaa toiminnasta epävarmuudesta huolimatta, ei itseluottamuksesta.\"]},{\"id\":\"allowfeelings\",\"emoji\":\"🌕\",\"titleEn\":\"Allow your feelings\",\"titleFi\":\"Salli tunteesi\",\"longTitleEn\":\"Embracing Emotional Honesty\",\"longTitleFi\":\"Tunteellisen Rehellisyyden Syleileminen\",\"contentEn\":[\"Name your feeling, even if it’s unpleasant — disappointment, irritation, sadness.\",\"Say to yourself: \'This feeling is allowed to exist.\'\",\"Your emotions are not flaws — they are messages about what matters.\",\"Let them flow, and they lose their heaviness.\"],\"contentFi\":[\"Nimeä tunteesi, vaikka se olisi epämiellyttävä – pettymys, ärsytys, suru.\",\"Sano itsellesi: \'Tämän tunteen sallitaan olla olemassa.\'\",\"Tunteesi eivät ole vikoja – ne ovat viestejä siitä, millä on merkitystä.\",\"Anna niiden virrata, ja ne menettävät painavuutensa.\"]},{\"id\":\"belong\",\"emoji\":\"🌈\",\"titleEn\":\"Reconnect with life\",\"titleFi\":\"Yhdistä elämään\",\"longTitleEn\":\"Belonging to the Bigger Picture\",\"longTitleFi\":\"Kuuluminen Suurempaan Kokonaisuuteen\",\"contentEn\":[\"Notice one small moment that reminds you that you belong — a color, a breeze, a smile.\",\"Even in solitude, you are part of life’s rhythm.\",\"Belonging isn’t something you earn; it’s something you remember.\",\"Breathe in connection, breathe out gratitude.\"],\"contentFi\":[\"Huomaa yksi pieni hetki, joka muistuttaa sinua siitä, että kuulut joukkoon – väri, tuuli, hymy.\",\"Jopa yksinäisyydessä olet osa elämän rytmiä.\",\"Kuuluminen ei ole asia, jonka ansaitset; se on asia, jonka muistat.\",\"Hengitä sisään yhteyttä, hengitä ulos kiitollisuutta.\"]}]')
  ];
  List<dynamic> get allCoachingPrograms => _allCoachingPrograms;
  set allCoachingPrograms(List<dynamic> value) {
    _allCoachingPrograms = value;
  }

  void addToAllCoachingPrograms(dynamic value) {
    allCoachingPrograms.add(value);
  }

  void removeFromAllCoachingPrograms(dynamic value) {
    allCoachingPrograms.remove(value);
  }

  void removeAtIndexFromAllCoachingPrograms(int index) {
    allCoachingPrograms.removeAt(index);
  }

  void updateAllCoachingProgramsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    allCoachingPrograms[index] = updateFn(_allCoachingPrograms[index]);
  }

  void insertAtIndexInAllCoachingPrograms(int index, dynamic value) {
    allCoachingPrograms.insert(index, value);
  }

  dynamic _selectedProgram;
  dynamic get selectedProgram => _selectedProgram;
  set selectedProgram(dynamic value) {
    _selectedProgram = value;
  }

  String _selectedProgramId = '';
  String get selectedProgramId => _selectedProgramId;
  set selectedProgramId(String value) {
    _selectedProgramId = value;
  }

  List<dynamic> _tempProgramList = [];
  List<dynamic> get tempProgramList => _tempProgramList;
  set tempProgramList(List<dynamic> value) {
    _tempProgramList = value;
  }

  void addToTempProgramList(dynamic value) {
    tempProgramList.add(value);
  }

  void removeFromTempProgramList(dynamic value) {
    tempProgramList.remove(value);
  }

  void removeAtIndexFromTempProgramList(int index) {
    tempProgramList.removeAt(index);
  }

  void updateTempProgramListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tempProgramList[index] = updateFn(_tempProgramList[index]);
  }

  void insertAtIndexInTempProgramList(int index, dynamic value) {
    tempProgramList.insert(index, value);
  }

  String _getDeviceTimeZone1 = '';
  String get getDeviceTimeZone1 => _getDeviceTimeZone1;
  set getDeviceTimeZone1(String value) {
    _getDeviceTimeZone1 = value;
  }

  bool _micUpdated = false;
  bool get micUpdated => _micUpdated;
  set micUpdated(bool value) {
    _micUpdated = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
