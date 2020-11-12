// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Meet Now`
  String get title {
    return Intl.message(
      'Meet Now',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `new`
  String get newest {
    return Intl.message(
      'new',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `channels`
  String get channels {
    return Intl.message(
      'channels',
      name: 'channels',
      desc: '',
      args: [],
    );
  }

  /// `bookmarks`
  String get bookmarks {
    return Intl.message(
      'bookmarks',
      name: 'bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `overview`
  String get overview {
    return Intl.message(
      'overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `calendar`
  String get calendar {
    return Intl.message(
      'calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `timeline`
  String get timeline {
    return Intl.message(
      'timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `widget`
  String get widget {
    return Intl.message(
      'widget',
      name: 'widget',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get setting {
    return Intl.message(
      'setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `log out`
  String get logout {
    return Intl.message(
      'log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `log in`
  String get login {
    return Intl.message(
      'log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get confirmLogin {
    return Intl.message(
      'Get Started',
      name: 'confirmLogin',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Need Help?`
  String get needHelp {
    return Intl.message(
      'Need Help?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get registerAndContinue {
    return Intl.message(
      'Continue',
      name: 'registerAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndCondition {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Followed`
  String get followed {
    return Intl.message(
      'Followed',
      name: 'followed',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get week {
    return Intl.message(
      'week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get month {
    return Intl.message(
      'month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message(
      'year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `What you are reading the most?`
  String get theMost {
    return Intl.message(
      'What you are reading the most?',
      name: 'theMost',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}