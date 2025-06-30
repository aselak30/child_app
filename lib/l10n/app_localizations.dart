import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_si.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('si'),
    Locale('ta')
  ];

  /// No description provided for @search_here.
  ///
  /// In en, this message translates to:
  /// **'Search here'**
  String get search_here;

  /// No description provided for @see_more.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get see_more;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_email;

  /// No description provided for @enter_registered_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your registered Email'**
  String get enter_registered_email;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email_address;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get successful;

  /// No description provided for @successful_register.
  ///
  /// In en, this message translates to:
  /// **'You have successfully registered to the system. Please login to the system to explore'**
  String get successful_register;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @log_in.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get log_in;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @create_new_account.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get create_new_account;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @splash_one.
  ///
  /// In en, this message translates to:
  /// **'The best place for children to get'**
  String get splash_one;

  /// No description provided for @splash_two.
  ///
  /// In en, this message translates to:
  /// **'advice and solutions'**
  String get splash_two;

  /// No description provided for @login_to_continue.
  ///
  /// In en, this message translates to:
  /// **'Log in to continue your account'**
  String get login_to_continue;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forget_password;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get username;

  /// No description provided for @create_password.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get create_password;

  /// No description provided for @please_create_password.
  ///
  /// In en, this message translates to:
  /// **'Please create a new password for your account'**
  String get please_create_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @password_must_be.
  ///
  /// In en, this message translates to:
  /// **'Password must be'**
  String get password_must_be;

  /// No description provided for @eight_characters.
  ///
  /// In en, this message translates to:
  /// **'8 characters long'**
  String get eight_characters;

  /// No description provided for @one_uppercase_letter.
  ///
  /// In en, this message translates to:
  /// **'One uppercase letter'**
  String get one_uppercase_letter;

  /// No description provided for @one_special_character.
  ///
  /// In en, this message translates to:
  /// **'1 special character'**
  String get one_special_character;

  /// No description provided for @one_number.
  ///
  /// In en, this message translates to:
  /// **'1 number'**
  String get one_number;

  /// No description provided for @no_spaces.
  ///
  /// In en, this message translates to:
  /// **'No spaces'**
  String get no_spaces;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @chat_now.
  ///
  /// In en, this message translates to:
  /// **'Chat now'**
  String get chat_now;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @help_support.
  ///
  /// In en, this message translates to:
  /// **'Help & support'**
  String get help_support;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get next;

  /// No description provided for @password_not_match.
  ///
  /// In en, this message translates to:
  /// **'Password do not match'**
  String get password_not_match;

  /// No description provided for @password_seq.
  ///
  /// In en, this message translates to:
  /// **'The password you have entered does not meet the minimum security requirements'**
  String get password_seq;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @faq_school_q.
  ///
  /// In en, this message translates to:
  /// **'How long should I study in school?'**
  String get faq_school_q;

  /// No description provided for @faq_school_a.
  ///
  /// In en, this message translates to:
  /// **'In Sri Lanka, the mandatory age for education is between 5 and 16 years. Parents are legally required to ensure that their children attend school during this period. But it’s always better to finish school at the correct age (after A/Ls).'**
  String get faq_school_a;

  /// No description provided for @faq_report_violation_q.
  ///
  /// In en, this message translates to:
  /// **'How can I report a violation?'**
  String get faq_report_violation_q;

  /// No description provided for @faq_report_violation_a.
  ///
  /// In en, this message translates to:
  /// **'Re-direct to the – Reporting numbers + departments/ Orgs'**
  String get faq_report_violation_a;

  /// No description provided for @faq_vote_q.
  ///
  /// In en, this message translates to:
  /// **'Can I vote/ Do I have a right to vote?'**
  String get faq_vote_q;

  /// No description provided for @faq_vote_a.
  ///
  /// In en, this message translates to:
  /// **'No, to vote you have to be above 18 years old.'**
  String get faq_vote_a;

  /// No description provided for @faq_safe_online_q.
  ///
  /// In en, this message translates to:
  /// **'Do I have a right to be safe online?'**
  String get faq_safe_online_q;

  /// No description provided for @faq_safe_online_a.
  ///
  /// In en, this message translates to:
  /// **'Yes, children in Sri Lanka have the right to be safe online.'**
  String get faq_safe_online_a;

  /// No description provided for @faq_drive_q.
  ///
  /// In en, this message translates to:
  /// **'Can I drive/ How old should I be able to drive?'**
  String get faq_drive_q;

  /// No description provided for @faq_drive_a.
  ///
  /// In en, this message translates to:
  /// **'To be able to drive you should be 18 years or above.'**
  String get faq_drive_a;

  /// No description provided for @faq_rights_age_q.
  ///
  /// In en, this message translates to:
  /// **'How old should I be to get these/my rights?'**
  String get faq_rights_age_q;

  /// No description provided for @faq_rights_age_a.
  ///
  /// In en, this message translates to:
  /// **'It is your Birth right.'**
  String get faq_rights_age_a;

  /// No description provided for @faq_sue_q.
  ///
  /// In en, this message translates to:
  /// **'Can a child sue a person or an organisation in courts?'**
  String get faq_sue_q;

  /// No description provided for @faq_sue_a.
  ///
  /// In en, this message translates to:
  /// **'Yes, under Sri Lankan law, children have certain legal rights and protections.'**
  String get faq_sue_a;

  /// No description provided for @faq_convict_q.
  ///
  /// In en, this message translates to:
  /// **'Can a child be convicted of a crime?'**
  String get faq_convict_q;

  /// No description provided for @faq_convict_a.
  ///
  /// In en, this message translates to:
  /// **'The Children and Young Persons Ordinance in Sri Lanka provides guidelines for dealing with children who are involved in criminal activities.'**
  String get faq_convict_a;

  /// No description provided for @faq_work_q.
  ///
  /// In en, this message translates to:
  /// **'Can a child engage in economic activities?'**
  String get faq_work_q;

  /// No description provided for @faq_work_a.
  ///
  /// In en, this message translates to:
  /// **'Yes, above 16. but any child could help their parents in their respective economic activities/engagements (Agri)'**
  String get faq_work_a;

  /// No description provided for @faq_who_is_child_q.
  ///
  /// In en, this message translates to:
  /// **'Who is a child?'**
  String get faq_who_is_child_q;

  /// No description provided for @faq_who_is_child_a.
  ///
  /// In en, this message translates to:
  /// **'Any person under the age of 18 is seen as a child.'**
  String get faq_who_is_child_a;

  /// No description provided for @faq_parents_rights_q.
  ///
  /// In en, this message translates to:
  /// **'Does my mother/father have these rights?'**
  String get faq_parents_rights_q;

  /// No description provided for @faq_parents_rights_a.
  ///
  /// In en, this message translates to:
  /// **'Yes, It’s called human rights.'**
  String get faq_parents_rights_a;

  /// No description provided for @faq_rights_not_respected_q.
  ///
  /// In en, this message translates to:
  /// **'What happens if my rights are not respected?'**
  String get faq_rights_not_respected_q;

  /// No description provided for @faq_rights_not_respected_a.
  ///
  /// In en, this message translates to:
  /// **'If you feel like your rights are not being respected, it’s important to tell a trusted grown-up.'**
  String get faq_rights_not_respected_a;

  /// No description provided for @faq_family_move_q.
  ///
  /// In en, this message translates to:
  /// **'What happens if my family moves to a different country?'**
  String get faq_family_move_q;

  /// No description provided for @faq_family_move_a.
  ///
  /// In en, this message translates to:
  /// **'Even if you move to a different country, you still have the same rights.'**
  String get faq_family_move_a;

  /// No description provided for @faq_rights_violated_by_known_q.
  ///
  /// In en, this message translates to:
  /// **'What if my rights are violated by someone I know?'**
  String get faq_rights_violated_by_known_q;

  /// No description provided for @faq_rights_violated_by_known_a.
  ///
  /// In en, this message translates to:
  /// **'You can also report it by calling 1929, which is the Childline of the National Child Protection Authority.'**
  String get faq_rights_violated_by_known_a;

  /// No description provided for @faq_boys_girls_rights_q.
  ///
  /// In en, this message translates to:
  /// **'Are there different rights for boys and girls?'**
  String get faq_boys_girls_rights_q;

  /// No description provided for @faq_boys_girls_rights_a.
  ///
  /// In en, this message translates to:
  /// **'No, boys and girls have the same rights.'**
  String get faq_boys_girls_rights_a;

  /// No description provided for @faq_lose_rights_q.
  ///
  /// In en, this message translates to:
  /// **'Can I lose my rights?'**
  String get faq_lose_rights_q;

  /// No description provided for @faq_lose_rights_a.
  ///
  /// In en, this message translates to:
  /// **'No, you can’t lose your rights. Your rights are yours from the moment you’re born.'**
  String get faq_lose_rights_a;

  /// No description provided for @faq_promote_rights_q.
  ///
  /// In en, this message translates to:
  /// **'How can I help promote child rights?'**
  String get faq_promote_rights_q;

  /// No description provided for @faq_promote_rights_a.
  ///
  /// In en, this message translates to:
  /// **'You can help promote child rights by learning about your rights and sharing that knowledge with others.'**
  String get faq_promote_rights_a;

  /// No description provided for @faq_see_rights_ignored_q.
  ///
  /// In en, this message translates to:
  /// **'What can I do if I see my friend’s or my rights being ignored?'**
  String get faq_see_rights_ignored_q;

  /// No description provided for @faq_see_rights_ignored_a.
  ///
  /// In en, this message translates to:
  /// **'You can speak up and tell a grown-up you trust, like a teacher or a parent.'**
  String get faq_see_rights_ignored_a;

  /// No description provided for @faq_who_made_rules_q.
  ///
  /// In en, this message translates to:
  /// **'Who made the rules for child rights?'**
  String get faq_who_made_rules_q;

  /// No description provided for @faq_who_made_rules_a.
  ///
  /// In en, this message translates to:
  /// **'The rules were made by grown-ups from different countries to protect all children.'**
  String get faq_who_made_rules_a;

  /// No description provided for @faq_examples_q.
  ///
  /// In en, this message translates to:
  /// **'What are some examples of child rights?'**
  String get faq_examples_q;

  /// No description provided for @faq_examples_a.
  ///
  /// In en, this message translates to:
  /// **'Some examples include the right to go to school, be safe, play, eat, and express your opinions.'**
  String get faq_examples_a;

  /// No description provided for @faq_different_rights_q.
  ///
  /// In en, this message translates to:
  /// **'Can children have different rights?'**
  String get faq_different_rights_q;

  /// No description provided for @faq_different_rights_a.
  ///
  /// In en, this message translates to:
  /// **'No matter where you live or what you look like, all children have the same basic rights.'**
  String get faq_different_rights_a;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'si', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'si':
      return AppLocalizationsSi();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
