import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

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
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onBoarding
  {
    'kaaaep2h': {
      'ru': 'Добро пожаловать!',
      'en': 'WELCOME',
    },
    'lcfus07o': {
      'ru':
          'В пространство многомерности и осознанности, объединяющее людей по всему миру',
      'en':
          'To the space of multidimensionality and mindfulness, uniting people around the world',
    },
    '9o8hcdjf': {
      'ru': 'Добро пожаловать!',
      'en': 'WELCOME',
    },
    'y6iumx22': {
      'ru':
          'В пространство многомерности и осознанности, объединяющее людей по всему миру',
      'en':
          'To the space of multidimensionality and mindfulness, uniting people around the world',
    },
    '7hc85270': {
      'ru': 'Добро пожаловать!',
      'en': 'WELCOME',
    },
    'hdiv7k81': {
      'ru':
          'В пространство многомерности и осознанности, объединяющее людей по всему миру',
      'en':
          'To the space of multidimensionality and mindfulness, uniting people around the world',
    },
    'v8ofl9gm': {
      'ru': 'Добро пожаловать!',
      'en': 'WELCOME',
    },
    'q1mse5hv': {
      'ru':
          'В пространство многомерности и осознанности, объединяющее людей по всему миру',
      'en':
          'To the space of multidimensionality and mindfulness, uniting people around the world',
    },
    'kwp7xmkk': {
      'ru': 'Зарегистрироваться',
      'en': 'Sign Up',
    },
    'usof6ixi': {
      'ru': 'Войти',
      'en': 'Log In',
    },
    'jfcfy2fz': {
      'ru': 'EN',
      'en': '',
    },
    'ey1rnj4c': {
      'ru': 'RU',
      'en': '',
    },
    'l8w3a3f1': {
      'ru': 'EN',
      'en': '',
    },
    'ci201uh8': {
      'ru': 'RU',
      'en': '',
    },
    '633u8h5q': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // DebugPage
  {
    'oeuohdto': {
      'ru': 'Удалить покупки',
      'en': '',
    },
    '3hcfqhfp': {
      'ru': 'Удалить все треки',
      'en': '',
    },
    '29zd174a': {
      'ru': 'DEBUG PAGE',
      'en': '',
    },
    '0lkrb0sc': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // signUpPage
  {
    '2ls9dy4w': {
      'ru': 'Есть аккаунт?',
      'en': 'Already have an account?',
    },
    'vao99jhi': {
      'ru': 'Шаг №1 из 3',
      'en': 'Step №1 from 3',
    },
    'a29d8kon': {
      'ru': 'Регистрация',
      'en': 'Create account',
    },
    'z4ur154g': {
      'ru': 'Email',
      'en': 'Email',
    },
    'w0jko964': {
      'ru': 'Поле не заполнено',
      'en': 'Field is required',
    },
    'wig6i5ol': {
      'ru': 'Придумайте пароль',
      'en': 'Create password',
    },
    'npgm2tfr': {
      'ru': 'Минимум 6 символов ',
      'en': 'Minimum 6 characters',
    },
    'dw40rg6m': {
      'ru': 'Подтвердите пароль',
      'en': 'Confirm Password',
    },
    'cb64r48o': {
      'ru': 'Минимум 6 символов',
      'en': 'Minimum 6 characters',
    },
    'dxdipov4': {
      'ru': 'Пароли не совпадают',
      'en': 'Passwords don\'t match',
    },
    'cm2aww30': {
      'ru': 'Зарегистрироваться',
      'en': 'Create account',
    },
    'm872kyq1': {
      'ru': 'Шаг №2 из 3',
      'en': 'Step №2 from 3',
    },
    'gfu7laa4': {
      'ru': 'Давай знакомиться',
      'en': 'Tell us about yourself',
    },
    'jbstkkoi': {
      'ru': 'Это поможет подстроить приложение под тебя',
      'en': '',
    },
    '2o2yaouw': {
      'ru': 'Имя',
      'en': 'First Name',
    },
    '4820xm03': {
      'ru': 'Поле не заполнено',
      'en': 'Field is required',
    },
    'pv7nzke4': {
      'ru': 'Фамилия',
      'en': 'Last Name',
    },
    'vu7m3huf': {
      'ru': 'Поле не заполнено',
      'en': 'Field is required',
    },
    'o190g5el': {
      'ru': 'Телефон',
      'en': 'Phone number',
    },
    'q41nmuj2': {
      'ru': 'Поле не заполнено',
      'en': 'Field is requred',
    },
    'tcrhjrv9': {
      'ru': 'Далее',
      'en': 'Next',
    },
    '0apbqllj': {
      'ru': 'Шаг №3 из 3',
      'en': 'Step №3',
    },
    'bpew0i3k': {
      'ru': 'Вы почти у цели!',
      'en': 'You\'re almost there!',
    },
    'zr7hsquf': {
      'ru': 'Добавьте фото',
      'en': 'Add photo',
    },
    'q5okcufk': {
      'ru': 'Добавить фото',
      'en': 'Add photo',
    },
    'qvydele0': {
      'ru': 'Пропустить',
      'en': 'Skip',
    },
    'mjf8bgjf': {
      'ru': 'Далее',
      'en': 'Next',
    },
    '5gz31vkj': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // signInPage
  {
    '2ubqsx6h': {
      'ru': 'Нет аккаунта?',
      'en': 'Don\'t have an account?',
    },
    'd84hva83': {
      'ru': 'Вход',
      'en': 'Sign In',
    },
    'jt0fm1wh': {
      'ru': 'Введите email и пароль указанные при регистрации в приложении',
      'en':
          'Enter the email and password specified when registering in the application',
    },
    'ee70g2fx': {
      'ru': 'Email',
      'en': 'Email',
    },
    'senye59q': {
      'ru': 'Поле не заполнено',
      'en': 'Field is required',
    },
    'wgta6hza': {
      'ru': 'Пароль',
      'en': 'Password',
    },
    'm4g6vdrg': {
      'ru': 'Минимум 6 символов',
      'en': 'Minimum 6 characters',
    },
    'zbvxdgs9': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
    },
    'pluoll38': {
      'ru': 'Войти',
      'en': 'Sign In',
    },
    'jznog0fj': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // forgotPassword
  {
    'r7o6rqe7': {
      'ru': 'Нет аккаунта?',
      'en': 'Don\'t have an account?',
    },
    'ga93nrz6': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot password?',
    },
    '3vsel261': {
      'ru': 'Отправим ссылку для восстановления на ваш email',
      'en': 'We will send a recovery link to your email.',
    },
    '5otb3ne5': {
      'ru': 'Email',
      'en': 'Email',
    },
    '9fb9v5ag': {
      'ru': 'Поле не заполнено',
      'en': 'Field is required',
    },
    'sxipism8': {
      'ru': 'Восстановить пароль',
      'en': 'Reset password',
    },
    'm5hktdx6': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // profileCabinet
  {
    '87r6bjyr': {
      'ru': 'Подтвердите email',
      'en': 'Confirm your email',
    },
    'zn198xg4': {
      'ru': 'Подтвержден',
      'en': 'Confirmed',
    },
    'hwhd0k82': {
      'ru': 'Изменить профиль',
      'en': 'Edit profile',
    },
    '57j7skci': {
      'ru': 'Сменить язык',
      'en': 'Change Language',
    },
    'qp57yist': {
      'ru': 'Поддержка',
      'en': 'Support',
    },
    'axa6feaj': {
      'ru': 'Оценить приложение',
      'en': 'Rate the app',
    },
    '35gw7woq': {
      'ru': 'О приложении',
      'en': 'About the app',
    },
    'sy3bs2sk': {
      'ru': 'Отладка',
      'en': 'Debugging',
    },
    '6j51rwq2': {
      'ru': 'Восстановить покупки',
      'en': 'Restore purchases',
    },
    'nnhmhlas': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // aboutPage
  {
    'ojyfolpr': {
      'ru': 'О приложении',
      'en': 'About the application',
    },
    '4vcle0tt': {
      'ru': 'Версия',
      'en': 'Version',
    },
    'i1ceobyt': {
      'ru': '1.0.0',
      'en': '1.0.0',
    },
    '09oc1el4': {
      'ru': 'Размер',
      'en': 'Size',
    },
    '67zdaxpv': {
      'ru': '70 Мб',
      'en': '70 MB',
    },
    'paz43no6': {
      'ru': 'Разработка',
      'en': 'Development',
    },
    'jybwvcwc': {
      'ru': 'Пользовательское соглашение',
      'en': 'Terms of use',
    },
    '0a6t6vxx': {
      'ru': 'Политика обработки персональных данных',
      'en': 'Personal data processing policy',
    },
    'vpw9j3q3': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // editProfile
  {
    '30fimlrh': {
      'ru': 'Изменить профиль',
      'en': 'Edit profile',
    },
    '8qafq7an': {
      'ru': 'Добавить фото',
      'en': 'Add photo',
    },
    'fjhfuyy7': {
      'ru': 'Имя',
      'en': 'First Name',
    },
    '7zskc5m5': {
      'ru': 'Фамилия',
      'en': 'Last Name',
    },
    '9c4wz64o': {
      'ru': 'Номер телефона',
      'en': 'Name',
    },
    'muo9s8yx': {
      'ru': 'Email',
      'en': '',
    },
    'y79yrq61': {
      'ru': 'Подтвердить',
      'en': '',
    },
    'kjzekphk': {
      'ru': 'Email не подтвержден',
      'en': '',
    },
    'bu2xr0l3': {
      'ru': 'Применить',
      'en': 'Confirm',
    },
    'eqtbr2kl': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // Affirmation
  {
    'hv1mr1ys': {
      'ru': 'Что бы вы хотели послушать?',
      'en': 'What would you like to listen to?',
    },
    '294z7kpt': {
      'ru': 'Home',
      'en': '',
    },
  },
  // HomePage
  {
    'hx9gmzsn': {
      'ru': 'Добро пожаловать!',
      'en': 'Welcome!',
    },
    'wzo7tihb': {
      'ru': 'Поиск',
      'en': 'Search',
    },
    'x2dzs6sp': {
      'ru': 'Что нового?',
      'en': 'What\'s new?',
    },
    'frx0mzd2': {
      'ru': 'Послание дня',
      'en': 'Message of the day',
    },
    'bl74ak1h': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // Stories
  {
    's9i0wakv': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // buyPack
  {
    '1mqgvry8': {
      'ru': 'Покупка пака',
      'en': 'Secure your pack',
    },
    'z5n995ut': {
      'ru': 'Сумма',
      'en': 'Sum',
    },
    'wj08bxya': {
      'ru': 'Далее',
      'en': 'Next',
    },
    '990emita': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // paymentMethod
  {
    'nrs5rjh1': {
      'ru': 'Выберите способ оплаты',
      'en': 'Select a Payment Method',
    },
    'ruu3s2a2': {
      'ru': 'Оплата на сайте',
      'en': 'Pay via website',
    },
    'fz15lfxl': {
      'ru': 'Оплата в приложении',
      'en': 'In - app purchase',
    },
    'shvjkfc8': {
      'ru': 'Сумма',
      'en': 'Sum',
    },
    'u2j4xhii': {
      'ru': 'Перейти к оплате',
      'en': 'Proceed to payment',
    },
    'avei39bj': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // cardDetails
  {
    'mhc5jm2i': {
      'ru': 'Введите данные карты',
      'en': 'Enter card details',
    },
    '2junazsi': {
      'ru': 'Номер карты',
      'en': 'Card number',
    },
    'a20uhjw9': {
      'ru': 'Поле должно содержать 16 символов',
      'en': 'The field must contain 16 characters',
    },
    'ucaza66x': {
      'ru': 'Дата окончания',
      'en': 'expiration date',
    },
    '8n86293r': {
      'ru': 'Неверная дата',
      'en': 'Invalid date',
    },
    'jt97zzal': {
      'ru': 'CVC/CVV',
      'en': 'CVC/CVV',
    },
    '6249a6x8': {
      'ru': 'Неверный CVC',
      'en': 'Invalid CVC',
    },
    'dtzghv4i': {
      'ru': 'Сумма',
      'en': 'Sum',
    },
    'iv8rypsd': {
      'ru': 'Оплатить',
      'en': 'Pay',
    },
    'r7u7eycn': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // searchPage
  {
    'clkbqe0o': {
      'ru': 'Что бы вы хотели послушать?',
      'en': '',
    },
    'fajpr0yk': {
      'ru': 'История поиска',
      'en': 'Search history',
    },
    '48mjxk32': {
      'ru': 'Очистить',
      'en': 'Clear',
    },
    'movysj9c': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // playerPage
  {
    'rj969l7a': {
      'ru': 'Описание',
      'en': '',
    },
    'w0mnvo2e': {
      'ru': 'Home',
      'en': '',
    },
  },
  // changeLanguage
  {
    'qfv3pjkl': {
      'ru': 'Выберите язык',
      'en': 'Choose language',
    },
    'huirtpyo': {
      'ru': 'EN',
      'en': 'EN',
    },
    '6xur946n': {
      'ru': 'RU',
      'en': 'RU',
    },
    'vb8egbmt': {
      'ru': 'EN',
      'en': 'EN',
    },
    'jai6j02z': {
      'ru': 'RU',
      'en': 'RU',
    },
    'koshnam7': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // offlinePlayerPage
  {
    'se89q2o3': {
      'ru': 'Home',
      'en': '',
    },
  },
  // paymentPage
  {
    '4r5zif6e': {
      'ru': 'Home',
      'en': '',
    },
  },
  // testQueryCache
  {
    '4gbrahh3': {
      'ru': 'Что нового?',
      'en': '',
    },
    's8ks71e8': {
      'ru': 'Home',
      'en': '',
    },
  },
  // confirmEmail
  {
    'lzq43swc': {
      'ru': 'Написать в поддержку',
      'en': 'Write to support',
    },
    '2nqv20ap': {
      'ru': 'Подтвердите email',
      'en': '',
    },
    'o86v7otv': {
      'ru': 'Отправить код еще раз через',
      'en': '',
    },
    '1dd2r518': {
      'ru': 'Отправить код еще раз',
      'en': '',
    },
    '3jbddo0n': {
      'ru': 'Пропустить',
      'en': '',
    },
    '58i4w14h': {
      'ru': 'Home',
      'en': '',
    },
  },
  // confirmEmailProfile
  {
    'crrgc7f3': {
      'ru': 'Написать в поддержку',
      'en': '',
    },
    'yl8kmbu3': {
      'ru': 'Подтвердите email',
      'en': 'Confirm your email',
    },
    'x3fb3rnp': {
      'ru': 'Отправить код еще раз через',
      'en': 'Send the code again via',
    },
    'n9p18jdy': {
      'ru': 'Отправить код еще раз',
      'en': '',
    },
    'bbc0tz24': {
      'ru': 'Home',
      'en': '',
    },
  },
  // meditationInfoNew
  {
    'vvpwce3u': {
      'ru': 'eщё',
      'en': '',
    },
    'apyldrf3': {
      'ru': 'свернуть',
      'en': '',
    },
    '7uzcrwxd': {
      'ru': 'Узнать больше и купить',
      'en': '',
    },
    'pt4kxvdz': {
      'ru': 'Home',
      'en': '',
    },
  },
  // confirmed
  {
    '9oilinzf': {
      'ru': 'Перейди по ссылке\nв письме',
      'en': 'Follow the link\nin a letter',
    },
    'mteqd617': {
      'ru': 'Отлично!',
      'en': 'Great!',
    },
  },
  // affirmationComp
  {
    'cau5xidz': {
      'ru': 'Спасибо',
      'en': 'Thank you',
    },
  },
  // logOutConfirm
  {
    '9tvydygk': {
      'ru': 'Вы уверены, что хотите выйти из аккаунта?',
      'en': 'Are you sure you want to log out?',
    },
    'rqylxh34': {
      'ru': 'Вам придется заново ввести email и пароль, чтобы войти в аккаунт',
      'en':
          'You\'ll need to log in again with your email and password to access your account',
    },
    '479jqr0t': {
      'ru': 'Выйти из аккаунта',
      'en': 'Log out ',
    },
    'whzbj9qp': {
      'ru': 'Отмена',
      'en': 'Cancel',
    },
  },
  // deleteAccountConfirm
  {
    'ksov762s': {
      'ru': 'Вы уверены, что хотите удалить аккаунт?',
      'en': 'Are you sure you want to delete your account?',
    },
    'q0genu6c': {
      'ru': 'Вы потеряете доступ ко всем покупкам навсегда',
      'en': 'You will lose access to all purchases forever',
    },
    'hneg8fw6': {
      'ru': 'Удалить аккаунт навсегда',
      'en': 'Delete account forever',
    },
    '3x43byeq': {
      'ru': 'Отмена',
      'en': 'Cancel',
    },
  },
  // rateTheApp
  {
    '64f4icxa': {
      'ru': 'Как тебе наше приложение',
      'en': 'Do you enjoy our app?',
    },
    'wy6mbk2b': {
      'ru': 'Вам придется заново ввести email и пароль, чтобы войти в аккаунт',
      'en':
          'You\'ll need to log in again with your email and password to access your account',
    },
    'cxlhpoc6': {
      'ru': 'Нравится',
      'en': 'Like',
    },
    'g1h64prq': {
      'ru': 'Не нравится',
      'en': 'Dislike',
    },
    '4gmoqzn4': {
      'ru': 'Закрыть',
      'en': 'Close',
    },
  },
  // feedbackComp
  {
    '48k4wst9': {
      'ru': 'Напишите, что не нравится',
      'en': 'Tell us how we can improve your experience',
    },
    '62p8lzo3': {
      'ru':
          'Мы прислушиваемся к каждому отзыву, ведь они помогают нам становиться лучше',
      'en': 'We value every piece of feedback as it helps us get better',
    },
    'mc1vs16p': {
      'ru': 'Ваш отзыв',
      'en': 'Your feedback',
    },
    'zxvth5hs': {
      'ru': 'Отправить отзыв',
      'en': 'Send feedback',
    },
  },
  // confirmedFeedback
  {
    'nw3ab5fb': {
      'ru': 'Отзыв отправлен',
      'en': 'Feedback sent',
    },
  },
  // checkPurchases
  {
    'arzmor82': {
      'ru': 'Покупки восстановлены',
      'en': 'Purchases restored',
    },
  },
  // dailyAdviceComp
  {
    'xos9ms57': {
      'ru': 'Совет дня',
      'en': '',
    },
    '02vja42i': {
      'ru':
          'Сегодня займись собой. Это действительно важно, уделить на это время',
      'en': '',
    },
    '6ocxw9gx': {
      'ru': 'Спасибо',
      'en': '',
    },
  },
  // meditationComp
  {
    'c0orjo43': {
      'ru': 'КУПЛЕНО',
      'en': 'PURCHASED',
    },
    '0ko1m2ax': {
      'ru': 'СКОРО',
      'en': 'SOON',
    },
  },
  // thanksForBuying
  {
    'l1euzcsg': {
      'ru': 'Спасибо за покупку',
      'en': 'Thank you for your purchase',
    },
    '7tg1x2jk': {
      'ru': 'Ваш платеж пока обрабатывается',
      'en': 'Your payment is still being processed',
    },
    '647mfzjl': {
      'ru': 'На главную',
      'en': 'Home',
    },
  },
  // offlineMode
  {
    'ms40mrix': {
      'ru': 'Офлайн - режим',
      'en': 'Offline Mode',
    },
    '1894hy5w': {
      'ru':
          'Тут пока пусто, потому что вы так и не купили ни одного пака с медитациями',
      'en':
          'Your meditation packs will appear here once you\'ve purchased them',
    },
  },
  // isDownloadedAll
  {
    'e3c7s2iw': {
      'ru': 'Медитации загружены',
      'en': 'Meditations are loaded',
    },
    '636d8lxn': {
      'ru': 'Все медитации успешно загружены!',
      'en': 'All meditations have been successfully downloaded!',
    },
    'ywixy9f9': {
      'ru': 'Хорошо',
      'en': 'Fine',
    },
  },
  // isDownloadedOnce
  {
    'v05k2h0x': {
      'ru': 'Медитация загружена',
      'en': 'Meditation loaded',
    },
    'vgp08p6k': {
      'ru': 'Медитация успешно загружена!',
      'en': 'Meditation successfully loaded!',
    },
    'uwbu1gpd': {
      'ru': 'Хорошо',
      'en': 'Fine',
    },
  },
  // isDeleted
  {
    'vs0509ee': {
      'ru': 'Медитации удалены',
      'en': 'Meditations removed',
    },
    '8gtx9mft': {
      'ru': 'Все медитации успешно удалены',
      'en': 'All meditations have been successfully deleted',
    },
    '1i4xluc2': {
      'ru': 'Хорошо',
      'en': 'Fine',
    },
  },
  // docExists
  {
    'rumazj5a': {
      'ru': 'Ошибка',
      'en': 'Error',
    },
    'fnng8w98': {
      'ru': 'Аккаунт с данной почтой уже создан',
      'en': 'An account with this email has already been created',
    },
    'alkqv996': {
      'ru': 'Хорошо',
      'en': 'Ok',
    },
  },
  // isNotDownloaded
  {
    'cv88anl1': {
      'ru': 'Медитация не загружена',
      'en': '',
    },
    'zbt927dh': {
      'ru': 'Медитация не загружена! Произошла ошибка',
      'en': '',
    },
    'oje46arq': {
      'ru': 'Хорошо',
      'en': 'Ok',
    },
  },
  // isDeletedOnce
  {
    '7ugqefbh': {
      'ru': 'Медитация удалена',
      'en': 'Meditation removed',
    },
    'ihhr8q4z': {
      'ru': 'Медитация успешно удалена',
      'en': 'Meditation successfully deleted',
    },
    'mg682744': {
      'ru': 'Хорошо',
      'en': 'Fine',
    },
  },
  // matchPass
  {
    'n3uhrxfw': {
      'ru': 'Ошибка!',
      'en': 'Error!',
    },
    'wtr7kc8i': {
      'ru': 'Пароли не совпадают',
      'en': 'Password mismatch',
    },
    'fgl6lqiy': {
      'ru': 'Хорошо',
      'en': 'Fine',
    },
  },
  // passCheck
  {
    'pp07sxaa': {
      'ru': 'Внимание!',
      'en': 'Attention!',
    },
    'uf4d6gjr': {
      'ru':
          'Длина не менее 8 символов, одна заглавная буква, одна строчная буква, одна цифра и специальный символ.',
      'en':
          'At least 8 characters long, one uppercase letter, one lowercase letter, one number and a special character.',
    },
    '7qfk66t3': {
      'ru': 'Хорошо',
      'en': '',
    },
  },
  // meditationPlayerInfo
  {
    'gt5fm4k8': {
      'ru': 'Понятно!',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '9dizm1py': {
      'ru': 'Button',
      'en': '',
    },
    'jaclrfb8': {
      'ru': 'Label here...',
      'en': '',
    },
    'dez1lqf5': {
      'ru': 'asdasdasd',
      'en': '',
    },
    'ydjzxfze': {
      'ru':
          'Нам необходим доступ к вашей камере, чтобы вы смогли загрузить свой аватар.',
      'en': 'This is necessary to add a photo to your profile.',
    },
    '91mty1cr': {
      'ru':
          'Нам необходим доступ к вашей галерее, чтобы вы смогли загрузить свой аватар.',
      'en': 'This is necessary to add a photo to your profile.',
    },
    'd3c7gcrs': {
      'ru':
          'Разрешите присылать вам уведомления о новых событиях и медитациях в приложении.',
      'en':
          'Allow to send you notifications about new events and meditations in the application.',
    },
    'gehtb41l': {
      'ru': 'Ошибка: [error]',
      'en': 'Error: [error]',
    },
    'gat8isbv': {
      'ru': 'Ссылка на сборс пароля отправлена на вашу почту',
      'en': 'A link to collect your password has been sent to your email.',
    },
    'fjtjhyxd': {
      'ru': 'Почта не заполнена',
      'en': 'Mail is required!',
    },
    'swmb2ak2': {
      'ru': 'Номер телефона не заполнен и должен начинаться с +',
      'en': 'The phone number is required and must begin with +',
    },
    'a9ptdanj': {
      'ru': 'Пароли не совпадают',
      'en': 'Passwords don\'t match',
    },
    '7q7ork6q': {
      'ru': 'Введите код подтверждения',
      'en': 'Enter confirmation code',
    },
    'nw46wuul': {
      'ru':
          'Прошло много времени с последнего входа. Зайдите еще раз, чтобы удалить аккаунт',
      'en':
          'It\'s been a long time since the last login. Login again to delete your account',
    },
    '1ysbd3ll': {
      'ru':
          'Прошло много времени с последнего входа. Зайдите еще раз, чтобы обновить почту',
      'en':
          'It\'s been a long time since the last login. Login again to update your email',
    },
    'gvby8q1k': {
      'ru': 'Ссылка на подтверждение почты отправлена',
      'en': 'Email confirmation link sent',
    },
    '45b0pzp0': {
      'ru': 'Эта почта уже использовалась при создании аккаунта',
      'en': 'This email has already been used',
    },
    'zplip8a9': {
      'ru':
          'Предоставленные учетные данные для авторизации неверны, введены неправильно или срок их действия истек',
      'en':
          'The supplied auth credential is incorrect,malformed or has expired',
    },
    'prqwaa0o': {
      'ru': 'Неверный формат',
      'en': 'Invalid format',
    },
    'lc5m8b8r': {
      'ru': 'Загрузка фото',
      'en': 'Loading photo',
    },
    'jb7evkbp': {
      'ru': 'Готово!',
      'en': 'Success!',
    },
    'vnw9exr8': {
      'ru': 'Ошибка при загрузке фотографии',
      'en': 'Error uploading photo',
    },
    'l8ggcolj': {
      'ru': '',
      'en': '',
    },
    '3cgb0d6n': {
      'ru': 'Выберите источник',
      'en': 'Choose source',
    },
    'rdeqblb2': {
      'ru': 'Галерея',
      'en': 'Gallery',
    },
    '1oyhxv5w': {
      'ru': 'Гелерея (Фото)',
      'en': 'Gallery (Photo)',
    },
    'x9sqijqb': {
      'ru': 'Гелерея (Видео)',
      'en': 'Gallery (Video)',
    },
    '7t4hit1e': {
      'ru': 'Камера',
      'en': 'Camera',
    },
    '8irdogoh': {
      'ru': '',
      'en': '',
    },
    '0ja1fnyx': {
      'ru': '',
      'en': '',
    },
    '6ykkbpej': {
      'ru': '',
      'en': '',
    },
    '0nssmj3i': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
