import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? nameSurnameFirstLetters(
  String? name,
  String? surname,
) {
  if (name == null || surname == null) {
    return null;
  }
  final firstLetterOfName = name.isNotEmpty ? name[0] : '';
  final firstLetterOfSurname = surname.isNotEmpty ? surname[0] : '';
  return '$firstLetterOfName$firstLetterOfSurname'.toUpperCase();
}

bool? cvvCheck(int? numbers) {
  // You need to check whether there are more than three characters or not, return a boolean
  if (numbers != null && numbers.toString().length > 3) {
    return true;
  } else {
    return false;
  }
}

bool? passCheck(String? text) {
  if (text == null) {
    return null;
  }
  return text.length >= 6;
}

String? formatMilliseconds(int? milliseconds) {
  if (milliseconds == null) return '0:00';

  int secondsTotal = milliseconds ~/ 1000;
  int minutes = secondsTotal ~/ 60;
  int seconds = secondsTotal % 60;

  String minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
  String secondsStr = seconds < 10 ? '0$seconds' : '$seconds';

  return "$minutesStr:$secondsStr";
}

bool? cardNumberCheck(String? text) {
  if (text == null) {
    return null;
  }
  return text.length >= 16;
}

bool cardDateEndCheck(
  String cardDate,
  DateTime currentDate,
) {
  final List<String> dateParts = cardDate.split('/');
  final int month = int.tryParse(dateParts[0]) ?? 0;
  final int year = int.tryParse(dateParts[1]) ?? 0;
  final DateTime cardDateTime = DateTime(year, month);
  return cardDateTime.isAfter(currentDate) || cardDateTime == currentDate;
}

MeditationAudioStruct? findTrackById(
  String id,
  List<MeditationAudioStruct> tracks,
) {
  for (var track in tracks) {
    if (track.id == id) {
      return track;
    }
  }
  return null;
}

String? createCloudPaymentsWebView(
  String? orderId,
  String? email,
  String? accountId,
  String? description,
  double? amount,
  String? publicId,
  String? currency,
  String? language,
) {
  String content = ''' 
<script src="https://widget.cloudpayments.ru/bundles/paymentblocks.js"></script>
<div id="element"></div>
<script>
var blocksApp = new cp.PaymentBlocks({
    publicId: '$publicId',
    description: '$description',
    amount: $amount,
    currency: '$currency',
    invoiceId: '$orderId',
    accountId: '$accountId',
    email: '$email',
    requireEmail: false,
    language: '$language',
    applePaySupport: true,
    googlePaySupport: true,
    yandexPaySupport: false,
    // Передача кастомных параметров
    // data: {
    //     customParam: xxx,
    // },
}, {
    appearance: {
      colors: {
        primaryButtonColor: "#39D2C0",
        primaryButtonTextColor: "#FFFFFF",
        primaryHoverButtonColor: "#39D2C0",
        primaryButtonHoverTextColor: "#FFFFFF",
        activeInputColor: "#0B1E46",
        inputBackground: "#ffffff",
        inputColor: "#8C949F",
        inputBorderColor: "#E2E8EF",
        errorColor: "#EB5757"
      },
      borders: {
        radius: "8px"
      }
    },
    components: {
      paymentButton: {
        fontSize: "16px",
        // text: "Оплатить",
      },
      paymentForm: {
        labelFontSize: "16px",
        activeLabelFontSize: "12px",
        fontSize: "16px"
      }
    }
});


blocksApp.mount(document.getElementById("element"));

blocksApp.on("destroy", () => {
    console.log("destroy");
});
blocksApp.on("success", (result) => {
    console.log("success", result);
});
blocksApp.on("fail", (result) => {
    console.log("fail", result);
});
</script>
''';

  return content;
}

List<MeditationsRecord> addMeditationDocumentToList(
    MeditationsRecord meditation) {
  List<MeditationsRecord> list = [];
  list.add(meditation);
  return list;
}

String? emailLowerWords(String? email) {
  if (email == null) return null;
  return email.toLowerCase().replaceAll(' ', '');
}

bool checkPassword(String? password) {
  if (password != null &&
      password.length >= 8 &&
      password.contains(RegExp(r'[A-Z]')) &&
      password.contains(RegExp(r'[a-z]')) &&
      password.contains(RegExp(r'[0-9]')) &&
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return true;
  } else {
    return false;
  }
}

double? passCheckupProgress(String? pass) {
  if (pass == null || pass == '') return 0;
  int count = 0;
  if (pass.length >= 8) count = 1;
  if (RegExp(r'[a-z]').hasMatch(pass)) count++;
  if (RegExp(r'[A-Z]').hasMatch(pass)) count++;
  if (RegExp(r'[0-9]').hasMatch(pass)) count++;
  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pass)) count++;
  return (count * 20) / 100;
}

bool isLessonAvailable(
  DateTime currentDate,
  DateTime openDate,
  int lessonIndex,
) {
  // Создаем пустой список lessonDates для хранения дат уроков
  List<DateTime> lessonDates = [];

  // Начинаем с openDate и ищем все следующие вторники и четверги, добавляя соответствующие lessonIndex в список
  DateTime currentDateIter = openDate;
  while (lessonDates.length <= (lessonIndex)) {
    if (currentDateIter.weekday == DateTime.tuesday ||
        currentDateIter.weekday == DateTime.thursday) {
      // Обнуляем время у текущей даты перед добавлением в список
      lessonDates.add(DateTime(
          currentDateIter.year, currentDateIter.month, currentDateIter.day));
    }
    currentDateIter = currentDateIter.add(Duration(days: 1));
  }

  // Проверяем, если список lessonDates пустой
  if (lessonDates.isEmpty) {
    return false; // Нет доступных уроков
  }

  // Получаем последнюю дату в списке lessonDates
  DateTime lastLessonDate = lessonDates.last;

  // Проверяем, если currentDate позже или равно последней дате урока
  bool isAvailable = lastLessonDate.isBefore(currentDate);

  return isAvailable;
}

BooksPagesRecord listShuffleBooks(List<BooksPagesRecord> books) {
  books.shuffle(math.Random());
  return books[0];
}

double? progress(
  double? fact,
  double? plan,
) {
  if (plan == null || plan.isNaN || fact == null || fact.isNaN) {
    return 0;
  }

  double result = fact / plan;

  // Проверяем, является ли результат NaN
  if (result.isNaN) {
    return 0;
  }

  if (result > 1) {
    return 1 * 100;
  }

  return result * 100;
}

double? progressFull(
  double? fact,
  double? plan,
) {
  if (plan == null || plan.isNaN || fact == null || fact.isNaN) {
    return 0;
  }

  double result = fact / plan;

  // Проверяем, является ли результат NaN
  if (result.isNaN) {
    return 0;
  }

  if (result > 1) {
    return 1;
  }

  return result;
}

int viewedAndAllLessons(
  List<String>? viewedLessons,
  List<String>? allLessons,
) {
  // Напиши функцию которая найдет совпадения между списками и вернет их количество
  int count = 0;
  if (viewedLessons == null || allLessons == null) {
    return count;
  }
  for (final lesson in allLessons) {
    if (viewedLessons.contains(lesson)) {
      count++;
    }
  }
  return count;
}
