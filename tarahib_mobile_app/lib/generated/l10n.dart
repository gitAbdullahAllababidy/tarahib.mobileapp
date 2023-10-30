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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Accepted`
  String get accpetedStaus {
    return Intl.message(
      'Accepted',
      name: 'accpetedStaus',
      desc: '',
      args: [],
    );
  }

  /// `  `
  String get addNew {
    return Intl.message(
      '  ',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get addToGroup {
    return Intl.message(
      ' ',
      name: 'addToGroup',
      desc: '',
      args: [],
    );
  }

  /// `Sent invitations`
  String get alreadySentInvitations {
    return Intl.message(
      'Sent invitations',
      name: 'alreadySentInvitations',
      desc: '',
      args: [],
    );
  }

  /// `Audience`
  String get audience {
    return Intl.message(
      'Audience',
      name: 'audience',
      desc: '',
      args: [],
    );
  }

  /// `Companions count`
  String get companionsCount {
    return Intl.message(
      'Companions count',
      name: 'companionsCount',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get details {
    return Intl.message(
      ' ',
      name: 'details',
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

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get internetConnectionMsg {
    return Intl.message(
      'No internet connection',
      name: 'internetConnectionMsg',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get invitationName {
    return Intl.message(
      ' ',
      name: 'invitationName',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get invitationType {
    return Intl.message(
      ' ',
      name: 'invitationType',
      desc: '',
      args: [],
    );
  }

  /// `Invitations settings`
  String get invitationsSettings {
    return Intl.message(
      'Invitations settings',
      name: 'invitationsSettings',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get location {
    return Intl.message(
      ' ',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `NA`
  String get login_and_planing {
    return Intl.message(
      'NA',
      name: 'login_and_planing',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout alert`
  String get logoutAlertTitle {
    return Intl.message(
      'Logout alert',
      name: 'logoutAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `By you submotting logout, all your data will be erased`
  String get logoutMessage {
    return Intl.message(
      'By you submotting logout, all your data will be erased',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Need answer`
  String get needAnswerStatus {
    return Intl.message(
      'Need answer',
      name: 'needAnswerStatus',
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

  /// `Procedures `
  String get procedures {
    return Intl.message(
      'Procedures ',
      name: 'procedures',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qrCode {
    return Intl.message(
      'QR',
      name: 'qrCode',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejectSatus {
    return Intl.message(
      'Rejected',
      name: 'rejectSatus',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled invitations`
  String get scheduledInvitations {
    return Intl.message(
      'Scheduled invitations',
      name: 'scheduledInvitations',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get secretNum {
    return Intl.message(
      ' ',
      name: 'secretNum',
      desc: '',
      args: [],
    );
  }

  /// `Send Count`
  String get sendCount {
    return Intl.message(
      'Send Count',
      name: 'sendCount',
      desc: '',
      args: [],
    );
  }

  /// `Send Invitations`
  String get sendInvitations {
    return Intl.message(
      'Send Invitations',
      name: 'sendInvitations',
      desc: '',
      args: [],
    );
  }

  /// `sendReminder`
  String get sendReminder {
    return Intl.message(
      'sendReminder',
      name: 'sendReminder',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message(
      'Surname',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Taraheeb`
  String get taraheeb {
    return Intl.message(
      'Taraheeb',
      name: 'taraheeb',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get withBarcode {
    return Intl.message(
      ' ',
      name: 'withBarcode',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
