import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? fiText = '',
  }) =>
      [enText, fiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // logIn
  {
    '8sqjqbtn': {
      'en': 'Be happy with confidence',
      'fi': 'Ole onnellinen, luota itseesi',
    },
    'pvjcw4ex': {
      'en': 'MID Wellbeing',
      'fi': 'MID-hyvinvointi',
    },
    'nwz11w2t': {
      'en': 'Sign in with  Apple',
      'fi': 'Kirjaudu sisään Applella',
    },
    'a5hjvgny': {
      'en': 'Sign in with Google',
      'fi': 'Kirjaudu sisään Googlella',
    },
    'm88otrtp': {
      'en': 'Sign in with  e-mail',
      'fi': 'Kirjaudu sisään sähköpostilla',
    },
    'o03w5sx9': {
      'en': 'Forgot your password?',
      'fi': 'Unohditko salasanasi?',
    },
    'b5p2kl8t': {
      'en': '',
      'fi': '',
    },
    'x02rbwzh': {
      'en': 'Don\'t have an account yet?',
      'fi': 'Eikö sinulla ole vielä tiliä?',
    },
    '2xoi1flv': {
      'en': 'Register',
      'fi': 'Rekisteröidy',
    },
    '3pidsadl': {
      'en': 'By signing in, you agree to our ',
      'fi': 'Kirjautuessasi sisään hyväksyt ',
    },
    '05pzhawo': {
      'en': 'Privacy Policy   |',
      'fi': 'Tietosuojakäytännön |',
    },
    'w0g07svf': {
      'en': 'Terms of Service',
      'fi': 'Palveluehdot',
    },
    '30tm9xsq': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // Mygrowth
  {
    'w91ho10r': {
      'en': 'My Stats',
      'fi': 'Tilastoni',
    },
    'y7g4kdca': {
      'en': 'Tap to view your daily progress',
      'fi': 'Napauta nähdäksesi päivittäisen edistymisesi',
    },
    'kgy27842': {
      'en': 'Mood',
      'fi': 'Mieliala',
    },
    '53c174to': {
      'en': 'Confidence',
      'fi': 'Itsetunto',
    },
    'm5l4jdy6': {
      'en': 'Belonging',
      'fi': 'Yhteys',
    },
    '7e1edin8': {
      'en': 'Strength',
      'fi': 'Voimavarat',
    },
    'bs6cghyf': {
      'en': 'Overall Reports',
      'fi': 'Yhteenveto',
    },
    'fz8orv8h': {
      'en': 'Weekly summary',
      'fi': 'Viikoittainen yhteenveto',
    },
    'j25ekuhs': {
      'en': ' Monthly summary',
      'fi': 'Kuukausittainen yhteenveto',
    },
    '2jen75it': {
      'en': 'MID progress',
      'fi': 'MID-edistyminen',
    },
    'oqdbwh5r': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // moodTest
  {
    'ezdpw6qr': {
      'en': 'MID Mood',
      'fi': 'MID fiilis',
    },
    'h751n5mw': {
      'en': 'How are you \nfeeling today?',
      'fi': 'Miltä sinusta tuntuu tänään',
    },
    'p27v56c7': {
      'en': 'Feeling great!',
      'fi': 'Mahtava olo!',
    },
    'c083rg63': {
      'en': 'I´m doing okay',
      'fi': 'Minulla menee ihan hyvin',
    },
    'sgmnw9xc': {
      'en': 'Not so sure today..',
      'fi': 'Ei niin varma tänään..',
    },
    '69svapmt': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // confidenceTest
  {
    'x6o34hed': {
      'en': 'MID Confidence',
      'fi': 'MID-luottamus',
    },
    'pmyefp9d': {
      'en': 'How high is  your \nself-confidence today?',
      'fi': 'Kuinka korkea itseluottamuksesi on tänään?',
    },
    'hinfo5xq': {
      'en': 'Super confident!',
      'fi': 'Supervarma!',
    },
    'cyslz82p': {
      'en': 'I´m doing okay',
      'fi': 'Minulla menee ihan hyvin',
    },
    '8dff852q': {
      'en': 'Not so sure today...',
      'fi': 'Ei niin varma tänään...',
    },
    'mstd5eso': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // StrengthTest
  {
    '3j9nbg99': {
      'en': 'MID Strength',
      'fi': 'MID voimavarat',
    },
    'dtrgue65': {
      'en': 'How do you handle  challengies today?',
      'fi': 'Miten käsittelet haasteita tänään?',
    },
    'h148zame': {
      'en': 'I´ve got this!',
      'fi': 'Minulla on homma hallussa!',
    },
    'irlickvz': {
      'en': 'I´m doing okay',
      'fi': 'Ihan ok',
    },
    'svj1xn5f': {
      'en': 'Not so sure today..',
      'fi': 'En ole niin varma tänään..',
    },
    't6v39si7': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // BelongingTest
  {
    'dqsi38j2': {
      'en': 'Do you feel like you belong today?',
      'fi': 'Tuntuuko sinusta että kuulut joukkoon tänään?',
    },
    '5mkycvns': {
      'en': 'Deeply connected!',
      'fi': 'Syvästi yhteydessä!',
    },
    '7bvgkt0x': {
      'en': 'I´m doing okay',
      'fi': 'Minulla menee ihan hyvin',
    },
    'o09sh0e3': {
      'en': 'Not so sure today..',
      'fi': 'Ei niin varma tänään..',
    },
    '1s7bazze': {
      'en': 'MID Belonging',
      'fi': 'MID-kuuluminen',
    },
    'p6duopyd': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // GettingStarted
  {
    'cqc7oay1': {
      'en': 'MID Wellbeing',
      'fi': 'MID Hyvinvointi',
    },
    '6vmvlikr': {
      'en': 'Start a daily chat',
      'fi': 'Aloita päivittäinen chat',
    },
    'jxrougpm': {
      'en': 'Reflect on your thoughts — like chatting with a wise friend.',
      'fi': 'Pohdi ajatuksiasi – aivan kuin juttelisit viisaan ystävän kanssa.',
    },
    'gqofhdi7': {
      'en': 'Tap your mood',
      'fi': 'Täppää päivän fiilis',
    },
    '48p1mfdl': {
      'en':
          'Start your day by tapping how you feel. A small check-in  makes a big diffrerence.',
      'fi':
          'Aloita päivä täppäämällä ja kuuntelemalla itseäsi – pienikin hetki tekee eron.',
    },
    's7y5qywl': {
      'en': 'Track your growth',
      'fi': 'Seuraa kasvuasi',
    },
    'mbr4uk4n': {
      'en':
          'See your progress over time with dynamic visuals. Your journey matters.',
      'fi':
          'Näe edistymisesi viikottain ja kuukausittain.– jokainen hetki merkitsee.',
    },
    '5xf5ez08': {
      'en': 'Saved insights',
      'fi': 'Tallennetut oivallukset',
    },
    '7w71a9pr': {
      'en': 'Your saved chat insights, always here when you need them.',
      'fi':
          'Tallentamasi chatin parhaat oivallukset – palaa niihin, kun kaipaat inspiraatiota.',
    },
    '4e3hcl1v': {
      'en': 'Wellbeing Test',
      'fi': 'Hyvinvointitestit',
    },
    'lwogrtko': {
      'en':
          'Discover something new about yourself. Short, insightful, and inspiring.',
      'fi':
          'Löydä uusia näkökulmia itseesi – lyhyesti, oivaltavasti ja inspiroivasti.',
    },
    '3qnam6tz': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // ConfidenceGraph
  {
    'qq55x6nf': {
      'en': 'MID Stats Confidence',
      'fi': 'MID-itseluottamus',
    },
    'ecnl4ubw': {
      'en': 'Confidence',
      'fi': 'Itseluottamus',
    },
    'y44iqqhc': {
      'en': 'Loading ...',
      'fi': 'Ladataan...',
    },
    'd7vtekkz': {
      'en': 'Self-confidencethis month',
      'fi': 'Itseluottamus tässä kuussa',
    },
    'bbljhr45': {
      'en': 'Today´s Self-confidence Summary',
      'fi': 'Itseluottamus tänään',
    },
    'ipv103mu': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // BelongingGraph
  {
    't43olmmd': {
      'en': 'MID Stats Belonging',
      'fi': 'MID-yhteenkuuluvuus',
    },
    '3op29sqg': {
      'en': 'Belonging',
      'fi': 'Yhteenkuuluvuus',
    },
    '1ugen10m': {
      'en': 'Loading...',
      'fi': 'Ladataan...',
    },
    'huobfynu': {
      'en': 'Belonging this month',
      'fi': 'Kuuluminen tässä kuussa',
    },
    '3y7kgvtb': {
      'en': 'Today´s Belonging Summary',
      'fi': 'Yhteenkuuluvuus tänään',
    },
    '3l7ee0zo': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // Insights
  {
    'tr3dnceq': {
      'en': 'MID Insights',
      'fi': 'MID Oivallukset',
    },
    'a68r9h2o': {
      'en': 'Chat insights',
      'fi': 'Oivallukset',
    },
    't6is5jfz': {
      'en': '',
      'fi': '',
    },
    'lnq0pl6z': {
      'en': ' Search insights ',
      'fi': 'Hae oivalluksia',
    },
    '6bf57yo0': {
      'en': 'My Notes',
      'fi': 'My notes',
    },
    'rxypuebf': {
      'en': '',
      'fi': '',
    },
    '359pivgh': {
      'en': ' Search notes',
      'fi': 'Hae muistiinpanoja',
    },
    'meh578oy': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // StrengtGraph
  {
    'qr9jwc38': {
      'en': 'Strength',
      'fi': 'Vahvuus',
    },
    'fm6s84gq': {
      'en': 'Loading...',
      'fi': 'Ladataan...',
    },
    'bxgril5t': {
      'en': 'Strength this month',
      'fi': 'Vahvuus tässä kuussa',
    },
    'qqb1xb3o': {
      'en': 'Today´s  Strength Summary',
      'fi': 'Vahvuus tänään',
    },
    '1ztu9e8s': {
      'en': 'MID Stats Strength',
      'fi': 'MID-vahvuus',
    },
    'gvfpmyax': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // confidenceTestPage
  {
    'fxs6pi1z': {
      'en':
          'Welcome to your personal growth journey 🌱\nThis space is for you – to reflect, explore, and grow.\n\nIMPORTANT: You’ll see a series of statements.\n\n👉 Rate each one on a scale from 1 to 5\n1 = Doesn’t describe me at all / Strongly disagree ❌\n5 = Describes me completely / Strongly agree ✅\n\nGo with your first honest feeling – what feels true for you right now.\n\nWhen you’re ready, just type “ready” – and let’s begin.',
      'fi':
          'Tervetuloa henkilökohtaiselle kasvumatkallesi 🌱\nTämä tila on sinua varten – pohdiskeluun, tutkimiseen ja kasvamiseen.\n\nTÄRKEÄÄ: Näet sarjan väittämiä.\n\n👉 Arvioi jokainen asteikolla 1–5\n1 = Ei kuvaa minua lainkaan / Täysin eri mieltä ❌\n5 = Kuvaa minua täysin / Täysin samaa mieltä ✅\n\nSeuraa ensimmäistä rehellistä tunnetta – sitä, mikä tuntuu todelta juuri nyt.\n\nKun olet valmis, kirjoita vain ”valmis” – ja aloitetaan.',
    },
    'oravpt5g': {
      'en': 'Type here... ',
      'fi': 'Kirjoita tähän...',
    },
    'um82pz07': {
      'en': 'MID Test',
      'fi': 'MID-testi',
    },
  },
  // introForTest
  {
    'mykp0lel': {
      'en': 'Explore Your Mind, \nDiscover Yourself',
      'fi': 'Tutki mieltäsi, \nlöydä itsesi',
    },
    'g0rfgpk3': {
      'en':
          'Discover who you are – one question at a time. Each question opens a door to curiosity and growth.',
      'fi':
          'Löydä kuka olet – yksi kysymys kerrallaan. Jokainen kysymys avaa oven uteliaisuuteen ja kasvuun.',
    },
    'aduf4t2y': {
      'en': 'Get Started',
      'fi': 'Valitse testi',
    },
    't4wphpci': {
      'en': 'MID Tests intro',
      'fi': 'MID testit intro',
    },
    'ik6j7t0k': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // Maikki
  {
    'nj8c8mb7': {
      'en': 'MID Tests',
      'fi': 'MID Testit',
    },
    'qpriehy7': {
      'en': 'Feelings & Mood ',
      'fi': 'Tunteet ja mieliala',
    },
    'deqn34ia': {
      'en': 'Test your mood',
      'fi': 'Testaa mielialaasi',
    },
    '6i6qqdgl': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    '3smljk9w': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    '1ntk64oi': {
      'en': '',
      'fi': '',
    },
    '6ewu7cls': {
      'en': '',
      'fi': '',
    },
    'n8fjlm69': {
      'en': '',
      'fi': '',
    },
    'e7eurs3i': {
      'en': 'Thinking & Dicessions',
      'fi': 'Päätöksenteko ja valinnat',
    },
    'qye6t0b9': {
      'en': 'Track your values',
      'fi': 'Seuraatko arvojasi?',
    },
    'hb8hba0d': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    'tswzc4u8': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    '48rekkud': {
      'en': '',
      'fi': '',
    },
    'cb1xro4m': {
      'en': '',
      'fi': '',
    },
    'ol5w55e3': {
      'en': '',
      'fi': '',
    },
    'wg9i2stz': {
      'en': 'Connection & Belonging',
      'fi': 'Yhteys ja läheisyys',
    },
    'nvx02jhy': {
      'en': 'Do you bond with others',
      'fi': 'Luotko yhteyksiä muihin?',
    },
    'sf5lhl5f': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    'k42brx93': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    'bwjhdewi': {
      'en': 'Option 1',
      'fi': 'Vaihtoehto 1',
    },
    'ug28qwoh': {
      'en': 'Option 2',
      'fi': 'Vaihtoehto 2',
    },
    'y2g3d2fp': {
      'en': 'Option 3',
      'fi': 'Vaihtoehto 3',
    },
    'vv8m361c': {
      'en': 'Growth &  Strength',
      'fi': 'Kasvu ja voimavarat',
    },
    'utm39wbo': {
      'en': 'Which are your strongest areas',
      'fi': 'Mitkä ovat vahvimmat alueesi',
    },
    'v3n9abyv': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    '8mgri7mu': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    'y11rmmfj': {
      'en': 'Option 1',
      'fi': 'Vaihtoehto 1',
    },
    'usvjvi3l': {
      'en': 'Option 2',
      'fi': 'Vaihtoehto 2',
    },
    'r7coqitb': {
      'en': 'Option 3',
      'fi': 'Vaihtoehto 3',
    },
    'v6jsxz0q': {
      'en': 'Work & Wellbeing',
      'fi': 'Työ ja hyvinvointi',
    },
    'ruf76hqy': {
      'en': 'Check your balance',
      'fi': 'Tsekkaa balanssi',
    },
    '9fou7bjs': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    'f1etz9g3': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    'p8gbea7z': {
      'en': 'Option 1',
      'fi': 'Vaihtoehto 1',
    },
    '3tfi47mi': {
      'en': 'Option 2',
      'fi': 'Vaihtoehto 2',
    },
    'iqrfrlb9': {
      'en': 'Option 3',
      'fi': 'Vaihtoehto 3',
    },
    '4yy8b9b6': {
      'en': 'Saved test results',
      'fi': 'Tallennetut testitulokset',
    },
    '8skenfof': {
      'en': 'Small Acts  💫',
      'fi': 'Pienet teot 💫',
    },
    'obe86gqb': {
      'en': 'Daily Reflection  ☘️',
      'fi': 'Päivittäinen pohdinta ☘️',
    },
    'gnndn2i7': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // introForMyGrowth
  {
    'vxqm5ce1': {
      'en': 'Track your daily growth',
      'fi': 'MID kehitys intro',
    },
    'hb1mp658': {
      'en': 'Track your daily growth',
      'fi': 'Seuraa kehitystäsi',
    },
    'aydrl5wp': {
      'en':
          'Small daily notes turn into weekly and monthly insights. Follow your progress in the bigger picture, one week and month at a time.\n',
      'fi':
          'Pienet päivittäiset täppäykset muuttuvat viikottaisiksi ja kuukausittaisiksi oivalluksiksi ja raporteiksi. Seuraa  edistymistäsi. ',
    },
    '3osezzsm': {
      'en': 'Start your journey',
      'fi': 'Aloita matkasi ',
    },
    'ruzwyhfg': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // ForgotPassword02
  {
    'vsjlsq2n': {
      'en': 'Back',
      'fi': 'Takaisin',
    },
    '52klgf6t': {
      'en': 'Forgot Password',
      'fi': 'Unohtunut salasana',
    },
    'zczg1h99': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fi':
          'Lähetämme sinulle sähköpostin, jossa on linkki salasanasi palauttamiseksi. Anna tiliisi liittyvä sähköpostiosoite alla olevaan kenttään.',
    },
    '9bzrv2s2': {
      'en': 'Your email address...',
      'fi': 'Sähköpostiosoitteesi...',
    },
    'cxn51w5f': {
      'en': 'Enter your email...',
      'fi': 'Anna sähköpostiosoitteesi...',
    },
    'zgvhakrz': {
      'en': 'Send Link',
      'fi': 'Lähetä linkki',
    },
    'gcihdf64': {
      'en': 'MID  Wellbeing',
      'fi': 'MID Hyvinvointi',
    },
    't1ujvno8': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // OivallusKokoViesti
  {
    'd7e3fp0o': {
      'en': 'Delete Insight',
      'fi': 'Poista oivallus',
    },
    'pwh4y0kt': {
      'en': 'Ok',
      'fi': 'Ok',
    },
    'cdi5558g': {
      'en': 'MID saved Insights',
      'fi': 'MID tallennetut oivallukset',
    },
    '1hf9cpvi': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // kontekstiMood
  {
    'lbbh9zit': {
      'en': 'What affected\nyour mood today? ',
      'fi': 'Mikä vaikutti mielialaasi tänään?',
    },
    'sqwowsob': {
      'en': '🌙 Sleep',
      'fi': '🌙 Uni',
    },
    'cnolglpj': {
      'en': ' 🎯 Productive',
      'fi': '🎯 Tuottavuus',
    },
    '9g5x01tp': {
      'en': '⚽️ Exercise',
      'fi': '⚽️ Liikunta',
    },
    '5eg5x5h2': {
      'en': '😊 Positive talk',
      'fi': '😊 Kehut',
    },
    'pgopdl5b': {
      'en': '⚡️ Stress',
      'fi': '⚡️ Stressi',
    },
    'ei6u2onj': {
      'en': '🧰 Work ',
      'fi': '🧰 Työ',
    },
    '04p8h1gi': {
      'en': '💕 Support',
      'fi': '💕 Tuki',
    },
    'aubiebpl': {
      'en': '🍏 Food',
      'fi': '🍏 Ruoka',
    },
    'k3b1x91w': {
      'en': 'Type your own reason below',
      'fi': 'Kerro omin sanoin',
    },
    'v1w3t9sw': {
      'en': 'Type here...',
      'fi': 'Kirjoita tähän...',
    },
    '2r332qdd': {
      'en': 'Continue →',
      'fi': 'Jatka →',
    },
    'zw2g51yc': {
      'en': 'MID Mood context',
      'fi': 'MID mielialan konteksti',
    },
    '2azindjb': {
      'en': 'Shop',
      'fi': '',
    },
  },
  // kontekstibelonging
  {
    'xn44frhq': {
      'en': 'What affected\nyour belonging today? ',
      'fi': 'Mikä vaikutti kuulumiseesi tänään?',
    },
    'wg1rovux': {
      'en': '🏡 Family',
      'fi': '🏡 Perhe',
    },
    '4y5nl8jq': {
      'en': ' 👫 Friends',
      'fi': '👫 Ystävät',
    },
    '2rf6i22p': {
      'en': '💕 Romantic',
      'fi': '💕 Romantiikka',
    },
    'q0eewsfz': {
      'en': '😊 Colleagues',
      'fi': '😊 Kollegat',
    },
    'dchurrz9': {
      'en': '🎪 Social events',
      'fi': '🎼 Tapahtumat',
    },
    '10e0inwy': {
      'en': '☔️ Loneliness',
      'fi': '☔️ Yksinäisyys',
    },
    'jdp49nzv': {
      'en': '💕 Support',
      'fi': '💕 Tuki',
    },
    'n0kfd4pq': {
      'en': '❌ Rejection',
      'fi': '❌ Hylkääminen',
    },
    'thhy7bi4': {
      'en': 'Type your own reason below',
      'fi': 'Kerro omin sanoin',
    },
    '7524ryd5': {
      'en': 'Type here...',
      'fi': 'Kirjoita tähän...',
    },
    'plohdu7e': {
      'en': 'Continue →',
      'fi': 'Jatka →',
    },
    'xz0vtuj3': {
      'en': 'MID Belonging context',
      'fi': 'MID yhteyden konteksti ',
    },
    'acv2u3t1': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // kontekstiStrength
  {
    'd15t6c27': {
      'en': 'What affected\nyour strength today? ',
      'fi': 'Mikä vaikutti vahvuuksiisi tänään?',
    },
    'u3xbz261': {
      'en': '🙏 Being patient',
      'fi': '🙏 Kärsivällisyys',
    },
    'd03o8lfd': {
      'en': ' 👁️ Shift view',
      'fi': '👁️ Eri näkökulma',
    },
    'f6xbfpkj': {
      'en': '🧩 Self-reflection',
      'fi': '🧩 Itsetutkiskelu',
    },
    'd5qb7oqy': {
      'en': '💡 New insight',
      'fi': '💡 Uusi oivallus',
    },
    'w2vf3ebi': {
      'en': '✅ Letting go',
      'fi': '✅ Päästää irti',
    },
    'ne2dkmwe': {
      'en': '🏅 Small victory',
      'fi': '🏅 Pieni voitto',
    },
    'udttpt4a': {
      'en': '🔕 Saying no',
      'fi': '🔕 Sanomalla ei',
    },
    '1p5yan3a': {
      'en': '💫 Hope',
      'fi': '💫 Toivo',
    },
    'jildi9iw': {
      'en': 'Type your own reason below',
      'fi': 'Kirjoita oma syysi alle',
    },
    '6mmnqtiv': {
      'en': 'Type here...',
      'fi': 'Kirjoita tähän...',
    },
    'xy72s9dx': {
      'en': 'Continue →',
      'fi': 'Jatka →',
    },
    'wwthfp77': {
      'en': 'MID Srength context',
      'fi': 'MID voimavarojen konteksti',
    },
    '7gv5bupz': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // monthlyHistory
  {
    'ejsyygvp': {
      'en': 'MID Monthly summary',
      'fi': 'MID Kuukausiraportti',
    },
    'y4fyqyc1': {
      'en': 'WEEKLY REPORTS',
      'fi': 'VIIKKORAPORTTI',
    },
    '8smcyggr': {
      'en': 'MONTHLY HISTORY',
      'fi': 'KUUKAUSIHISTORIA',
    },
    'hciii576': {
      'en': 'MOOD',
      'fi': 'FIILIS',
    },
    'z76zc9zo': {
      'en': '',
      'fi': '',
    },
    'kssh3fk5': {
      'en': 'CONFIDENCE',
      'fi': 'ITSETUNTO',
    },
    'iy3ji5f7': {
      'en': 'RESILIENCE',
      'fi': 'VOIMAVARAT',
    },
    'h1b05a78': {
      'en': 'BELONGING',
      'fi': 'YHTEENKUULUVUUS',
    },
    'mt04faby': {
      'en': 'Monthly Summary',
      'fi': 'Kuukausiraportti',
    },
    'nubh18aq': {
      'en': '/',
      'fi': '/',
    },
    '2udef1zf': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // weeklyReports
  {
    'dc0axbje': {
      'en': 'MID Weekly summary',
      'fi': 'MID-viikkoyhteenveto',
    },
    'wlq6khxd': {
      'en': 'WEEKLY HISTORY',
      'fi': 'VIIKKOHISTORIA',
    },
    '9xi6lkn9': {
      'en': 'MONTHLY REPORTS',
      'fi': 'KUUKAUSIRAPORTIT',
    },
    'o37f8j0m': {
      'en': 'MOOD',
      'fi': 'FIILIS',
    },
    '156x6idy': {
      'en': '',
      'fi': '',
    },
    'y9a39422': {
      'en': 'CONFIDENCE',
      'fi': 'ITSETUNTO',
    },
    'eceeh1wq': {
      'en': 'STRENGTH',
      'fi': 'VOIMAVARAT',
    },
    'l3d79fjm': {
      'en': 'BELONGING',
      'fi': 'YHTEENKUULUVUUS',
    },
    'u6x62812': {
      'en': 'Weekly Summary',
      'fi': 'Viikoittainen yhteenveto',
    },
    'i6kfe1dp': {
      'en': '/',
      'fi': '/',
    },
    'j8ae7pez': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // WeeklyHistoryLists
  {
    'd5gcb10j': {
      'en': 'MID Weekly archives',
      'fi': 'MID Viikkoarkisto',
    },
    't2heef1b': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // weeklyKokoViesti
  {
    'zov3wel7': {
      'en': 'MID Weekly Archives',
      'fi': 'MID-viikkoarkisto',
    },
    '24w4esjb': {
      'en': 'Delete Summary',
      'fi': 'Poista yhteenveto',
    },
    '42iulcwd': {
      'en': 'Ok',
      'fi': 'Ok',
    },
    '7rhkm8bk': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // monthlyHistoryLists
  {
    'jdpd4xy8': {
      'en': '/ 2025',
      'fi': '/ 2025',
    },
    '5k0lqofo': {
      'en': 'MID Monthly Archives',
      'fi': 'MID-kuukausiarkisto',
    },
    'kfjzbu92': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // monthlyKokoViesti
  {
    'fc6z13th': {
      'en': 'MID Monthly archives',
      'fi': 'MID-kuukausiarkisto',
    },
    'w1xvusbe': {
      'en': '/ 2025',
      'fi': '/ 2025',
    },
    '5m6s9td7': {
      'en': 'Delete Summary',
      'fi': 'Poista yhteenveto',
    },
    '09ko1io5': {
      'en': 'Ok',
      'fi': 'Ok',
    },
    'd9i84ebf': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // MIDChatAICopy
  {
    'za55ar9v': {
      'en': 'Type here...',
      'fi': 'Kirjoita tähän...',
    },
    'dxy32g63': {
      'en': 'MID Chat',
      'fi': 'MID Chat',
    },
    'tktk5ew5': {
      'en': 'Chats',
      'fi': 'Chatit',
    },
  },
  // savedTest1
  {
    'c6paxqwb': {
      'en': 'Wiev',
      'fi': 'Wiev',
    },
    'rd3pbpre': {
      'en': 'MID Saved test',
      'fi': 'MID-tallennetut testit',
    },
    'fkjf42r3': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // MoodGrapNew
  {
    'syolyhon': {
      'en': 'MID Stats Mood',
      'fi': 'MID-mieliala',
    },
    'jz3mklbk': {
      'en': 'Mood',
      'fi': 'Mieliala',
    },
    'kg410nbt': {
      'en': 'Loading...',
      'fi': 'Ladataan...',
    },
    'ynkhohks': {
      'en': 'Mood this month',
      'fi': 'Fiilis tässä kuussa',
    },
    'jqygmu50': {
      'en': 'Today´s Mood Summary',
      'fi': 'Fiilis tänään',
    },
    'crrkkif0': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
 // introForchat1
{
  'dlk3pa5d': {
    'en': 'MID \nWellbeing Coach',
    'fi': 'MID\nCoach ',
  },
  'kw9n0u7z': {
    'en':
      'Reflect on your thoughts — like chatting with a wise friend.\nChat is a relaxed and empathetic companion, always ready to listen and support you on your wellbeing journey.',
  'fi':
      'Pohdi ajatuksiasi – aivan kuin juttelisit viisaan ystävän kanssa.\nChatti on rento ja empaattinen keskustelukumppani, joka on aina valmis kuuntelemaan ja tukemaan sinua hyvinvointimatkallasi.',
  },
  'icxakqfr': {
    'en': 'Start Conversation',
    'fi': 'Aloita keskustelu',
  },
  '3acs2xdk': {
    'en': 'MID Chat intro',
    'fi': 'MID Chat intro',
  },
  'o2ifcc0l': {
    'en': 'Home',
    'fi': 'Kotiin',
  },
},

  // introForTapping1
  {
    '5vpb3vrs': {
      'en': 'Tap Your Daily \n Mood ',
      'fi': 'Täppää päivittäinen \nmielialasi',
    },
    '3ahd43jc': {
      'en':
          'Check in with how you feel – mood, strenght, belonging and confidence.  A daily tap helps build your personal wellbeing path.\n',
      'fi':
          'Tarkastele vointiasi – mielialaasi, vahvuuttasi, yhteenkuuluvuuden tunnettasi ja itseluottamustasi. Päivittäinen täppäys auttaa sinua rakentamaan henkilökohtaista hyvinvointipolkuasi.',
    },
    'z066ilx0': {
      'en': 'Start to tap',
      'fi': 'Aloita täppääminen',
    },
    '35nf201i': {
      'en': 'MID Tap Intro',
      'fi': 'MID Tap intro',
    },
    'x81e1wie': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // introForchatInsights
  {
    'eg0batqo': {
      'en': 'Save your insights.',
      'fi': 'Tallenna chat \noivalluksia',
    },
    'ndilg76o': {
      'en':
          'Tap the heart in chat whenever a reply resonates with you. Each one is stored here, building your personal collection\n',
      'fi':
          'Napauta sydäntä chatissa aina, kun jokin vastaus resonoi kanssasi. Jokainen vastaus tallennetaan tänne, ja se rakentaa henkilökohtaista kokoelmaasi.',
    },
    'f7yesfqh': {
      'en': 'See My Insights',
      'fi': 'Katso oivallukset',
    },
    'ukhdfini': {
      'en': 'MID Insights Intro',
      'fi': 'MID oivallukset intro',
    },
    '34d7whb8': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // kontekstiConfidenceNew
  {
    'dmg0229a': {
      'en': 'What affected\nyour confidence today? ',
      'fi': 'Mikä vaikutti itseluottamukseesi tänään?',
    },
    'gzm2n43q': {
      'en': '🚴‍♀️ Exercise',
      'fi': '🚴‍♀️ Liikunta',
    },
    'fhm26m97': {
      'en': '🧠 Overthinking',
      'fi': '🧠 Ylianalysointi',
    },
    'mwh17xi2': {
      'en': '🎬  Social media',
      'fi': '🎬 Some',
    },
    'u2cm74ob': {
      'en': '😳 Self-criticism ',
      'fi': '😳 Itsekritiikki',
    },
    't7waue26': {
      'en': '📈 Progress',
      'fi': '📈 Edistyminen',
    },
    '036rgk2p': {
      'en': '⏰ Time pressure',
      'fi': '⏰ Aikapaine',
    },
    '6ozqsnip': {
      'en': '💬  Feedback',
      'fi': '💬 Palaute',
    },
    'etq8y8dd': {
      'en': '👂Being heard',
      'fi': '👂Tulin kuulluksi',
    },
    'q964c1vn': {
      'en': 'Type your own reason below',
      'fi': 'Kerro omin sanoin',
    },
    '28aijew4': {
      'en': 'Type here...',
      'fi': 'Kirjoita tähän...',
    },
    'mr910h03': {
      'en': 'Continue →',
      'fi': 'Jatka →',
    },
    'f90fcabl': {
      'en': 'MID Confidence context',
      'fi': 'MID-luottamuskonteksti',
    },
    '2juk345d': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // createAccount
  {
    'yzzqjn3p': {
      'en': 'Create an account',
      'fi': 'Luo tili',
    },
    'iu08rti8': {
      'en': 'Let\'s get started by filling out the form below.',
      'fi': 'Aloitetaan täyttämällä alla olevat kentät',
    },
    'iy2whyff': {
      'en': 'Name',
      'fi': 'Nimi',
    },
    'b9c7i5cq': {
      'en': 'Email',
      'fi': 'Sähköposti',
    },
    'dzrht57w': {
      'en': 'Password',
      'fi': 'Salasana',
    },
    'r6tmd8nw': {
      'en': 'Confirm Password',
      'fi': 'Vahvista salasana',
    },
    'io0dgycg': {
      'en': 'By continuing you accept our ',
      'fi': 'Jatkamalla hyväksyt meidän  ',
    },
    'bnhfujbb': {
      'en': 'Privacy Policy ',
      'fi': 'Tietosuojakäytäntömme ',
    },
    'r8emk8y4': {
      'en': 'and ',
      'fi': 'ja ',
    },
    '394ue6m0': {
      'en': 'Terms of Use',
      'fi': 'Käyttöehtomme',
    },
    'ixea70dv': {
      'en': '',
      'fi': '',
    },
    'tvkyxkgf': {
      'en': '',
      'fi': '',
    },
    '605nlqe1': {
      'en': '',
      'fi': '',
    },
    'x3pedd12': {
      'en': '',
      'fi': '',
    },
    'zwawa9oi': {
      'en': 'Create Account',
      'fi': 'Luo tili',
    },
    'tbu7v151': {
      'en': 'Already have an account?   ',
      'fi': 'Onko sinulla jo tili? ',
    },
    'za3qmqjy': {
      'en': 'Sign In here',
      'fi': 'Kirjaudu sisään tästä',
    },
    '9t951uch': {
      'en': 'MID ',
      'fi': 'MID',
    },
    '4vxlazt6': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // signInEmail
  {
    '5k1yn5xe': {
      'en': 'Sign In with email',
      'fi': 'Kirjaudu sisään sähköpostilla',
    },
    'txskginr': {
      'en': 'Filling out the form below.',
      'fi': 'Täytä alla olevat kentät',
    },
    '98v198qp': {
      'en': 'Email',
      'fi': 'Sähköposti',
    },
    'vwmpetiu': {
      'en': 'Password',
      'fi': 'Salasana',
    },
    'x74wo93q': {
      'en': 'By continuing you accept our ',
      'fi': 'Jatkamalla hyväksyt ',
    },
    'm9of4blx': {
      'en': 'Privacy Policy ',
      'fi': 'Tietosuojakäytäntömme',
    },
    'v5poc9qi': {
      'en': 'and ',
      'fi': 'ja ',
    },
    'vznp5xnl': {
      'en': 'Terms of Use',
      'fi': 'Käyttöehdot ',
    },
    'u9rzzrxi': {
      'en': 'Sign In',
      'fi': 'Kirjaudu sisään',
    },
    'jidm3nvj': {
      'en': 'MID  Wellbeing',
      'fi': 'MID Hyvinvointi',
    },
    '3u6624aj': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // settingsage
  {
    'rowvpi6s': {
      'en': 'Settings',
      'fi': 'Asetukset',
    },
    'zscz8mo7': {
      'en': 'Manage your experience',
      'fi': 'Hallitse kokemustasi',
    },
    'fiks811w': {
      'en': 'ViewProfile',
      'fi': 'Näytä profiili',
    },
    'aaw8fpf7': {
      'en': 'Account',
      'fi': 'Tili',
    },
    '1ejz7zhl': {
      'en': 'Switch to Dark Mode',
      'fi': 'Vaihda tummaan tilaan',
    },
    'ksinpna9': {
      'en': 'Switch to Light Mode',
      'fi': 'Vaihda vaaleaan tilaan',
    },
    'ppz5xbzy': {
      'en': 'Languages',
      'fi': 'Kielet',
    },
    'ty7rsssd': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    'r0z75pim': {
      'en': 'English  ı en',
      'fi': 'Englanti ı en',
    },
    'a27zm4e1': {
      'en': 'Suomi  | fi',
      'fi': 'Suomi | fi',
    },
    'i8nlvmeh': {
      'en': 'Log out',
      'fi': 'Kirjaudu ulos',
    },
    'uwfbllcd': {
      'en': 'Delete account',
      'fi': 'Poista tili',
    },
    'wzvt0j9n': {
      'en': 'General',
      'fi': 'Yleistä',
    },
    'qnrrtjx0': {
      'en': 'How Mid works',
      'fi': 'Miten Mid toimii',
    },
    'q18uik2e': {
      'en': 'Invite Friends',
      'fi': 'Kutsu ystäviä',
    },
    '184t1kji': {
      'en': 'Send Feedback',
      'fi': 'Lähetä palautetta',
    },
    'ox68iixd': {
      'en': 'Privacy Policy',
      'fi': 'Tietosuojakäytäntö',
    },
    'wg8lvoc4': {
      'en': 'Terms of Service',
      'fi': 'Käyttöehdot',
    },
    '5lw9glew': {
      'en': 'MID settings',
      'fi': 'MID-asetukset',
    },
    'fkd9fx8w': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // editProfile
  {
    'jn2yunef': {
      'en': 'Edit Profile',
      'fi': 'Muokkaa profiilia',
    },
    '15bjjt1h': {
      'en': 'Your Name',
      'fi': 'Sinun nimesi',
    },
    '9qvt944n': {
      'en': '',
      'fi': '',
    },
    'u0pgklnn': {
      'en': 'Select Country',
      'fi': 'Valitse maa',
    },
    '3sry2247': {
      'en': 'Finland',
      'fi': 'Suomi',
    },
    'u55ebezs': {
      'en': 'Sweden',
      'fi': 'Ruotsi',
    },
    '4mr3etg4': {
      'en': 'Norway',
      'fi': 'Norja',
    },
    'uag0eeoq': {
      'en': 'Denmark',
      'fi': 'Tanska',
    },
    'i21tkg17': {
      'en': 'Germany',
      'fi': 'Saksa',
    },
    'mfw725dm': {
      'en': 'France',
      'fi': 'Ranska',
    },
    'u5d8y537': {
      'en': 'Netherlands',
      'fi': 'Alankomaat',
    },
    '1xkyh1yu': {
      'en': 'Belgium',
      'fi': 'Belgia',
    },
    'ka95ibpg': {
      'en': 'Switzerland',
      'fi': 'Sveitsi',
    },
    '2tk30uz2': {
      'en': 'Austria',
      'fi': 'Itävalta',
    },
    'mlfiad9d': {
      'en': 'Spain',
      'fi': 'Espanja',
    },
    'br6vciou': {
      'en': 'Italy',
      'fi': 'Italia',
    },
    'm742tdsi': {
      'en': 'Portugal',
      'fi': 'Portugali',
    },
    '59k13g6r': {
      'en': 'Greece',
      'fi': 'Kreikka',
    },
    'czesg0id': {
      'en': 'United Kingdom',
      'fi': 'Yhdistynyt kuningaskunta',
    },
    '737ek4nz': {
      'en': 'Ireland',
      'fi': 'Irlanti',
    },
    'lkxfb6z7': {
      'en': 'Poland',
      'fi': 'Puola',
    },
    'th23i3sc': {
      'en': 'Czech Republic',
      'fi': 'Tšekin tasavalta',
    },
    '41vyl00d': {
      'en': 'Slovakia',
      'fi': 'Slovakia',
    },
    'lhfabo99': {
      'en': 'Hungary',
      'fi': 'Unkari',
    },
    'ehzafso2': {
      'en': 'Romania',
      'fi': 'Romania',
    },
    'd6zbmuqm': {
      'en': 'Bulgaria',
      'fi': 'Bulgaria',
    },
    '5clxo19h': {
      'en': 'China',
      'fi': 'Kiina',
    },
    'ji376krm': {
      'en': 'Japan',
      'fi': 'Japani',
    },
    '6nvx54hf': {
      'en': 'South Korea',
      'fi': 'Etelä-Korea',
    },
    'xk68yoab': {
      'en': 'India',
      'fi': 'Intia',
    },
    'ug3t3aje': {
      'en': 'Thailand',
      'fi': 'Thaimaa',
    },
    'w8htw0xk': {
      'en': 'USA',
      'fi': 'Yhdysvallat',
    },
    'r37hioc6': {
      'en': 'Canada',
      'fi': 'Kanada',
    },
    'upqhymus': {
      'en': 'Mexico',
      'fi': 'Meksiko',
    },
    'xctyp8cn': {
      'en': 'Brazil',
      'fi': 'Brasilia',
    },
    'qymjjyny': {
      'en': 'Argentina',
      'fi': 'Argentiina',
    },
    '1wqrlrjx': {
      'en': 'Chile',
      'fi': 'Chile',
    },
    'd2o3gtu4': {
      'en': 'South Africa',
      'fi': 'Etelä-Afrikka',
    },
    '6jhx2bqb': {
      'en': 'Nigeria',
      'fi': 'Nigeria',
    },
    '3hflumyl': {
      'en': 'Egypt',
      'fi': 'Egypti',
    },
    'gsr4uxpb': {
      'en': 'Australia',
      'fi': 'Australia',
    },
    'ixdueexb': {
      'en': 'New Zealand',
      'fi': 'Uusi-Seelanti',
    },
    '3wvn6mxh': {
      'en': 'Other',
      'fi': 'Muut',
    },
    'gpt3fsfp': {
      'en': 'Your City',
      'fi': 'Kaupunki ',
    },
    'p2dcatpz': {
      'en': 'Your bio',
      'fi': 'Sinusta',
    },
    'bsh0tvfp': {
      'en': 'Your bio',
      'fi': 'Esittely sinusta',
    },
    'djebyudm': {
      'en': 'Email',
      'fi': 'Sähköposti',
    },
    '81ho7wd9': {
      'en': '',
      'fi': '',
    },
    'fonsu6rw': {
      'en': '',
      'fi': '',
    },
    'vgdyjjlb': {
      'en': 'Save Changes',
      'fi': 'Tallenna muutokset',
    },
    '8ethu2dz': {
      'en': 'MID Edit profile',
      'fi': 'MID muokkaa profiilia',
    },
    '3ln5uovo': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // viewprofile
  {
    'hh8z3rgr': {
      'en': 'Your information',
      'fi': 'Sinun tietosi ',
    },
    '7q5ooeau': {
      'en': 'Edit Profile',
      'fi': 'Muokkaa Profiilia',
    },
    '2jqne7hh': {
      'en': 'MID Your profile',
      'fi': 'MID profiili',
    },
    'wny4k2zx': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // HowItWorks
  {
    '8t8nvhfn': {
      'en': 'How Mid Works',
      'fi': 'Miten Mid toimii',
    },
    'qvrg4qoo': {
      'en':
          'MID Wellbeing helps you put your thoughts into words, supports daily self-reflection, offers gentle feedback, and provides practical exercises.\nFollow your inner dialogue, gain insights, and deepen your understanding of yourself.\nEach part of the app supports your wellbeing from a different perspective.',
      'fi':
          'MID Wellbeing sanoittaa ajatuksiasi, tukee päivittäistä itsetutkiskelua, reflektoi ja tarjoaa harjoituksia.\nSeuraa sisäistä vuoropuheluasi, löydä oivalluksia ja syvennä ymmärrystäsi itsestäsi.\nSovelluksen eri osiot tukevat hyvinvointiasi eri näkökulmista.',
    },
    'slaybyns': {
      'en': 'Daily Check-ins',
      'fi': 'Päivittäiset tsekkaukset',
    },
    'a47am2hi': {
      'en':
          'Mark how you feel each day across four areas: Mood, Self-confidence, Strength, and Belonging.\nEach check-in saves a color dot on your calendar — small moments that tell your story.\nBased on your daily entries, MID creates short reflections that later form your weekly and monthly wellbeing reports.',
      'fi':
          'Merkitse päivittäin neljään osa-alueeseen, miltä sinusta tuntuu: Mieliala, Itseluottamus, Voima ja Yhteenkuuluvuus.\n\nJokainen merkintä tallentaa värillisen pisteen kalenteriisi – pieniä hetkiä, jotka kertovat tarinasi.\nPäivittäisten merkintöjesi perusteella MID luo lyhyitä pohdintoja, jotka myöhemmin muodostavat viikoittaiset ja kuukausittaiset hyvinvointiraporttisi.',
    },
    'yjoglo69': {
      'en': 'Personal Notes',
      'fi': 'Henkilökohtaisia ​​pohdintoja',
    },
    'rnu6h3un': {
      'en':
          'Write your own notes to capture thoughts, emotions, or realizations.\nYou can choose to explore them further in the chat, where insights evolve naturally through gentle conversation and perspective.\nYour AI coach can help you explore and understand them more deeply.',
      'fi':
          'Kirjoita omia muistiinpanojasi tallentaaksesi ajatuksiasi, tunteitasi tai oivalluksiasi.\nVoit halutessasi tutkia niitä tarkemmin chatissa, jossa oivallukset kehittyvät luonnollisesti lempeän keskustelun ja näkökulman kautta.\nTekoälyvalmentajasi voi auttaa sinua tutkimaan ja ymmärtämään niitä syvällisemmin.',
    },
    'j48s1of1': {
      'en': 'Insights',
      'fi': 'Oivallukset',
    },
    'bkgpfikj': {
      'en':
          'When your AI coach says something meaningful in chat, tap the ❤️ icon to save it here.\nYour saved insights form a collection of inspiring moments and personal discoveries —\na growing reflection of your inner journey.\nDiscover connections, track your growth, and keep your best thoughts close.',
      'fi':
          'Kun tekoälyvalmentajasi sanoo jotain merkityksellistä chatissa, napauta ❤️-kuvaketta tallentaaksesi sen oivalluksiin.\n\nTallennetut näkemyksesi muodostavat kokoelman inspiroivia hetkiä ja henkilökohtaisia ​​löytöjä – kasvavan heijastuksen sisäisestä matkastasi.\nLöydä yhteyksiä, seuraa kasvuasi ja pidä parhaat ajatuksesi lähelläsi.',
    },
    'hcz8v3v7': {
      'en': 'Wellbeing Coach & Tests',
      'fi': 'Hyvinvointivalmentaja ja testit',
    },
    'q482u0st': {
      'en':
          'Take personalized self-tests to understand your emotions, strengths, and motivation.\nEach test includes around 10 questions rated from 1 (“doesn’t describe me”) to 5 (“describes me well”).\nReceive a unique personality analysis with practical insights that deepen your self-awareness and support your wellbeing.',
      'fi':
          'Tee henkilökohtaisia ​​testejä ymmärtääksesi tunteitasi, vahvuuksiasi ja motivaatiotasi.\nJokainen testi sisältää noin 10 kysymystä, jotka arvioidaan asteikolla 1 (\"ei kuvaa minua\") - 5 (\"kuvaa minua hyvin\").\nSaat ainutlaatuisen persoonallisuusanalyysin, joka sisältää käytännönläheisiä näkemyksiä, jotka syventävät itsetuntemustasi ja tukevat hyvinvointiasi.',
    },
    'bj43cot1': {
      'en': 'Chat ',
      'fi': 'Chat',
    },
    '3jszq0gl': {
      'en':
          'Chat with your AI wellbeing coach — a supportive companion who listens, encourages, and helps you find clarity.\nYou can talk about anything related to your wellbeing: emotions, motivation, relationships, routines, exercise, nutrition, sleep, or self-development.\nThe chat is always open for reflection, inspiration, or just a moment of calm guidance.',
      'fi':
          'Keskustele tekoälyhyvinvointivalmentajasi kanssa  – kumppani, joka kuuntelee, kannustaa ja auttaa sinua löytämään selkeyttä.\n\nVoit puhua mistä tahansa hyvinvointiisi liittyvästä: tunteista, motivaatiosta, ihmissuhteista, rutiineista, liikunnasta, ravinnosta, unesta tai itsensä kehittämisestä.\nChat on aina avoinna – oivalluksille, inspiraatiolle tai vain pienelle hengähdykselle ja ohjaukselle.',
    },
    'hoqs6ven': {
      'en': 'MID – My Inner Dialogue\n',
      'fi': 'MID – My Inner Dialogue\n',
    },
    'ktow9hhl': {
      'en': '\n',
      'fi': '',
    },
    'ieijss97': {
      'en': 'Your daily compass for self-understanding and growth.',
      'fi': 'Päivittäinen kompassisi itsetuntemukseen ja kasvuun.',
    },
    'ahti2cbj': {
      'en': 'MID instructions',
      'fi': 'MID-ohjeet',
    },
  },
  // NotesKokoViesti
  {
    'gluzoluh': {
      'en': 'Original:  ',
      'fi': 'Alkuperäinen: ',
    },
    'suf65101': {
      'en': 'MID saved Notes',
      'fi': 'Tallennetut muistiinapnot',
    },
    'm2tie78o': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // pageLittle
  {
    '0gi4uydq': {
      'en': 'A Little Act 💫',
      'fi': 'Pieni teko💫',
    },
    'gu9l9q5f': {
      'en': 'Thoughts for Today',
      'fi': 'Ajatuksia tähän hetkeen',
    },
    'mg9h30y0': {
      'en': 'Back to Menu',
      'fi': 'Takaisin valikkoon',
    },
    'zugyct04': {
      'en': 'MID ',
      'fi': 'MID-testi',
    },
  },
  // pageReflectionss
  {
    'rsvq0hlv': {
      'en': 'Daily Reflections ☘️',
      'fi': 'Päivittäisiä pohdintoja ☘️',
    },
    'c5t4e1ch': {
      'en': 'A Moment for You. Click card.',
      'fi': 'Hetki sinulle. Klikkaa korttia.',
    },
    'b1cywm76': {
      'en': 'Back to Menu',
      'fi': 'Takaisin valikkoon',
    },
    'fubw35m4': {
      'en': 'MID ',
      'fi': 'MID-testi',
    },
  },
  // NotesKokoViestiCopy
  {
    'opwjvzft': {
      'en': 'Delete Note',
      'fi': 'Poista muistiinpano',
    },
    '2aizrxev': {
      'en': 'Ok',
      'fi': 'Ok',
    },
    '2fb8w2c2': {
      'en': 'MID saved Notes',
      'fi': 'Tallennetut muistiinapnot',
    },
    'j5gp9y39': {
      'en': 'Home',
      'fi': 'Kotiin',
    },
  },
  // dialogNotification
  {
    'mrncpxrz': {
      'en': 'Thank You',
      'fi': 'Kiitos',
    },
    'ma0u472y': {
      'en': 'No test  hirstory yet',
      'fi': 'Ei vielä testi historiaa',
    },
  },
  // dropDownKomponentti
  {
    '9n3nwvc9': {
      'en': 'Select...',
      'fi': 'Valitse...',
    },
    'bti3gs98': {
      'en': 'Search...',
      'fi': 'Haku...',
    },
    'an0vg5ty': {
      'en': 'Option 1',
      'fi': 'Vaihtoehto 1',
    },
    'qfvr5d36': {
      'en': 'Option 2',
      'fi': 'Vaihtoehto 2',
    },
    '5foeyt5m': {
      'en': 'Option 3',
      'fi': 'Vaihtoehto 3',
    },
  },
  // ConfirmDeleteDialog
  {
    '4tlb3p18': {
      'en': 'Delete this item?',
      'fi': 'Poista tämä kohde?',
    },
    'pr4tsv63': {
      'en': 'Are you sure you want to delete?\nThis action cannot be undone.',
      'fi': 'Haluatko varmasti poistaa?\nTätä toimintoa ei voi perua.',
    },
    'x26tnt7r': {
      'en': 'Cancel',
      'fi': 'Peruuta',
    },
    'dqnz1nqv': {
      'en': 'Delete',
      'fi': 'Poista',
    },
  },
  // modalCalender
  {
    '479kffjh': {
      'en': 'Saved \nSummary  🎯',
      'fi': 'Tallennettu Yhteenveto 🎯',
    },
    'coofo3ls': {
      'en': 'Delete Summary',
      'fi': 'Poista yhteenveto',
    },
    'mfmb7lzl': {
      'en': 'Ok',
      'fi': 'Ok',
    },
  },
  // savedTest
  {
    'e7s7aro9': {
      'en': 'Saved Test 2025  📈',
      'fi': 'Tallennettu testi 2025 📈',
    },
    'el3ljekp': {
      'en': 'Delete',
      'fi': 'Poista',
    },
    '9l9maqdq': {
      'en': 'Ok',
      'fi': 'Ok',
    },
  },
  // MyNotesBottomSheet
  {
    'qrhfupk8': {
      'en': 'Create Note',
      'fi': 'Luo muistiinpano',
    },
    'sp2spwlq': {
      'en': 'write your thoughts',
      'fi': 'kirjoita ajatuksesi',
    },
    'iphfcedw': {
      'en': 'Enter your note here...',
      'fi': 'Kirjoita muistiinpanosi tähän...',
    },
    'l4fuyrz7': {
      'en': '',
      'fi': '',
    },
    '8e17i010': {
      'en': 'Save Note',
      'fi': 'Tallenna muistiinpano',
    },
  },
  // coaching
  {
    'lkbkd6j8': {
      'en': 'Daily reflection',
      'fi': 'Päivittäinen pohdinta',
    },
    't4m0bgno': {
      'en': 'Ok',
      'fi': 'Ok',
    },
  },
  // Miscellaneous
  {
    'yq9w5au5': {
      'en': '',
      'fi': '',
    },
    '91dz3ru2': {
      'en': '',
      'fi': '',
    },
    'ddlrknhj': {
      'en': 'MID is asking permission for microphone',
      'fi': '',
    },
    '3hww9thk': {
      'en': '',
      'fi': '',
    },
    '5njv3ttd': {
      'en': '',
      'fi': '',
    },
    'igviekz4': {
      'en': '',
      'fi': '',
    },
    '44300l0b': {
      'en': '',
      'fi': '',
    },
    'ota8rrri': {
      'en': '',
      'fi': '',
    },
    'bkfdi6gs': {
      'en': '',
      'fi': '',
    },
    'b4fy8ed1': {
      'en': '',
      'fi': '',
    },
    '82hh1hxk': {
      'en': '',
      'fi': '',
    },
    'ra713ba5': {
      'en': '',
      'fi': '',
    },
    'u66tkylk': {
      'en': '',
      'fi': '',
    },
    's4v4yc8p': {
      'en': '',
      'fi': '',
    },
    'sp95r96k': {
      'en': '',
      'fi': '',
    },
    '0ipqm0f4': {
      'en': '',
      'fi': '',
    },
    'aqq81zpd': {
      'en': '',
      'fi': '',
    },
    '4a92yq1s': {
      'en': '',
      'fi': '',
    },
    'o1347sg6': {
      'en': '',
      'fi': '',
    },
    'jib7thef': {
      'en': '',
      'fi': '',
    },
    '79k3rt3y': {
      'en': '',
      'fi': '',
    },
    '8cqi1klc': {
      'en': '',
      'fi': '',
    },
    'o5y8l0or': {
      'en': '',
      'fi': '',
    },
    'fkb0kdp7': {
      'en': '',
      'fi': '',
    },
    'o58blwk1': {
      'en': '',
      'fi': '',
    },
    '31rwn0tr': {
      'en': '',
      'fi': '',
    },
    'wdbhacqs': {
      'en': '',
      'fi': '',
    },
    'ls3dfej0': {
      'en': '',
      'fi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
