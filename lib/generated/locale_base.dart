import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  late Localeapp _app;
  Localeapp get app => _app;
  late LocaleformAndAction _formAndAction;
  LocaleformAndAction get formAndAction => _formAndAction;
  late Localemain _main;
  Localemain get main => _main;
  late Localemsg _msg;
  Localemsg get msg => _msg;
  late LocaleappMsg _appMsg;
  LocaleappMsg get appMsg => _appMsg;
  late LocaledateTime _dateTime;
  LocaledateTime get dateTime => _dateTime;
  late Localepayment _payment;
  Localepayment get payment => _payment;

  void initAll() {
    _app = Localeapp(Map<String, String>.from(_data['app']));
    _formAndAction = LocaleformAndAction(Map<String, String>.from(_data['formAndAction']));
    _main = Localemain(Map<String, String>.from(_data['main']));
    _msg = Localemsg(Map<String, String>.from(_data['msg']));
    _appMsg = LocaleappMsg(Map<String, String>.from(_data['appMsg']));
    _dateTime = LocaledateTime(Map<String, String>.from(_data['dateTime']));
    _payment = Localepayment(Map<String, String>.from(_data['payment']));
  }
}

class Localeapp {
  late final Map<String, String> _data;
  Localeapp(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  
}

class LocaleformAndAction {
  late final Map<String, String> _data;
  LocaleformAndAction(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get logIn => _data["logIn"]!;
  String get signup => _data["signup"]!;
  String get username => _data["username"]!;
  String get email => _data["email"]!;
  String get password => _data["password"]!;
  String get phone => _data["phone"]!;
  String get logout => _data["logout"]!;
  String get changePassword => _data["changePassword"]!;
  String get save => _data["save"]!;
  String get oldPassword => _data["oldPassword"]!;
  String get newPassword => _data["newPassword"]!;
  String get update => _data["update"]!;
  String get title => _data["title"]!;
  String get theMessage => _data["theMessage"]!;
  String get send => _data["send"]!;
  String get name => _data["name"]!;
  String get skip => _data["skip"]!;
  String get registerMsg => _data["registerMsg"]!;
  String get orLoginBy => _data["orLoginBy"]!;
  String get googleLogin => _data["googleLogin"]!;
  String get facebookLogin => _data["facebookLogin"]!;
  String get alreadyHaveAnAccount => _data["alreadyHaveAnAccount"]!;
  String get fullName => _data["fullName"]!;
  String get confirmPassword => _data["confirmPassword"]!;
  String get forgetPassword => _data["forgetPassword"]!;
  String get resetPassword => _data["resetPassword"]!;
  String get emailOrPhone => _data["emailOrPhone"]!;
  String get code => _data["code"]!;
  String get confirmEmail => _data["confirmEmail"]!;
  String get confirmEmailSuccessMsg => _data["confirmEmailSuccessMsg"]!;
  String get resendCode => _data["resendCode"]!;
  String get appleLogin => _data["appleLogin"]!;
  String get loginUsing => _data["loginUsing"]!;
  String get address => _data["address"]!;
  String get loginPhone => _data["loginPhone"]!;
}

class Localemain {
  late final Map<String, String> _data;
  Localemain(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get lang => _data["lang"]!;
  String get setting => _data["setting"]!;
  String get changeLanguage => _data["changeLanguage"]!;
  String get faqs => _data["faqs"]!;
  String get howToUse => _data["howToUse"]!;
  String get english => _data["english"]!;
  String get arabic => _data["arabic"]!;
  String get home => _data["home"]!;
  String get privacyPolicy => _data["privacyPolicy"]!;
  String get termOfUse => _data["termOfUse"]!;
  String get search => _data["search"]!;
  String get more => _data["more"]!;
  String get less => _data["less"]!;
  String get contactUs => _data["contactUs"]!;
  String get image => _data["image"]!;
  String get report => _data["report"]!;
  String get block => _data["block"]!;
  String get clear => _data["clear"]!;
  String get delete => _data["delete"]!;
  String get clearChat => _data["clearChat"]!;
  String get enterMsg => _data["enterMsg"]!;
  String get chats => _data["chats"]!;
  String get cancel => _data["cancel"]!;
  String get retry => _data["retry"]!;
  String get appName => _data["appName"]!;
  String get camera => _data["camera"]!;
  String get gallery => _data["gallery"]!;
  String get addCaption => _data["addCaption"]!;
  String get welcom => _data["welcom"]!;
  String get active => _data["active"]!;
  String get myAccount => _data["myAccount"]!;
  String get all => _data["all"]!;
  String get images => _data["images"]!;
  String get next => _data["next"]!;
  String get ok => _data["ok"]!;
  String get seeAll => _data["seeAll"]!;
  String get map => _data["map"]!;
  String get edit => _data["edit"]!;
  String get yes => _data["yes"]!;
  String get no => _data["no"]!;
  String get later => _data["later"]!;
  String get unBLock => _data["unBLock"]!;
  String get add => _data["add"]!;
  String get category => _data["category"]!;
  String get about => _data["about"]!;
  String get termsAndConditions => _data["termsAndConditions"]!;
  String get showMore => _data["showMore"]!;
  String get showLess => _data["showLess"]!;
  String get chooseLocation => _data["chooseLocation"]!;
  String get close => _data["close"]!;
  String get countries => _data["countries"]!;
  String get cities => _data["cities"]!;
  String get users => _data["users"]!;
  String get categories => _data["categories"]!;
  String get follow => _data["follow"]!;
  String get favorite => _data["favorite"]!;
  String get myFriends => _data["myFriends"]!;
  String get unFollow => _data["unFollow"]!;
  String get followers => _data["followers"]!;
  String get following => _data["following"]!;
  String get notification => _data["notification"]!;
  String get profile => _data["profile"]!;
  String get account => _data["account"]!;
  String get personalAccount => _data["personalAccount"]!;
  String get thePersonalAccount => _data["thePersonalAccount"]!;
  String get address => _data["address"]!;
  String get personalInfo => _data["personalInfo"]!;
  String get comunicateWithUs => _data["comunicateWithUs"]!;
  String get or => _data["or"]!;
  String get male => _data["male"]!;
  String get female => _data["female"]!;
  String get age => _data["age"]!;
  String get ascending => _data["ascending"]!;
  String get descending => _data["descending"]!;
  String get price => _data["price"]!;
  String get moreDetails => _data["moreDetails"]!;
  String get lessDetails => _data["lessDetails"]!;
  String get updatePersonalAccount => _data["updatePersonalAccount"]!;
  String get gender => _data["gender"]!;
  String get myInfo => _data["myInfo"]!;
  String get theDetails => _data["theDetails"]!;
  String get onotherDetails => _data["onotherDetails"]!;
  String get custom => _data["custom"]!;
  String get agreeTermsAndConditions => _data["agreeTermsAndConditions"]!;
  String get iAccept => _data["iAccept"]!;
}

class Localemsg {
  late final Map<String, String> _data;
  Localemsg(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get errorOccurred => _data["errorOccurred"]!;
  String get shareMsg => _data["shareMsg"]!;
  String get noInternet => _data["noInternet"]!;
  String get updateSucceeded => _data["updateSucceeded"]!;
  String get sendingFailed => _data["sendingFailed"]!;
  String get sendingDone => _data["sendingDone"]!;
  String get sentSuccesfully => _data["sentSuccesfully"]!;
  String get wrongUsernameOrPassword => _data["wrongUsernameOrPassword"]!;
  String get errConnectionServer => _data["errConnectionServer"]!;
  String get errorPageRouting => _data["errorPageRouting"]!;
  String get loginError => _data["loginError"]!;
  String get invalidUsername => _data["invalidUsername"]!;
  String get loginFaild => _data["loginFaild"]!;
  String get loginLater => _data["loginLater"]!;
  String get invalidEmail => _data["invalidEmail"]!;
  String get passwordShort => _data["passwordShort"]!;
  String get invalidPhone => _data["invalidPhone"]!;
  String get invalidTitle => _data["invalidTitle"]!;
  String get invalidName => _data["invalidName"]!;
  String get loginFirst => _data["loginFirst"]!;
  String get confirmPasswordIncorrect => _data["confirmPasswordIncorrect"]!;
  String get logininToContinue => _data["logininToContinue"]!;
  String get createAccuont => _data["createAccuont"]!;
  String get fillField => _data["fillField"]!;
  String get pleaseAddImage => _data["pleaseAddImage"]!;
  String get fillFieldNumber => _data["fillFieldNumber"]!;
  String get fillFieldInt => _data["fillFieldInt"]!;
  String get logoutConfirm => _data["logoutConfirm"]!;
  String get exitConfirmation => _data["exitConfirmation"]!;
  String get imageNotSaved => _data["imageNotSaved"]!;
  String get noMessagesAvailable => _data["noMessagesAvailable"]!;
  String get deleteConfermation => _data["deleteConfermation"]!;
  String get noDataAvailable => _data["noDataAvailable"]!;
  String get saveSucceeded => _data["saveSucceeded"]!;
  String get errorDateFormat => _data["errorDateFormat"]!;
  String get noNotificationsAvailable => _data["noNotificationsAvailable"]!;
  String get enterEmail => _data["enterEmail"]!;
  String get enterPhone => _data["enterPhone"]!;
  String get activationCodeSendToEmail => _data["activationCodeSendToEmail"]!;
  String get resetPasswordSucess => _data["resetPasswordSucess"]!;
  String get activationCodeSendTophone => _data["activationCodeSendTophone"]!;
  String get resendSmsCodeSucceeded => _data["resendSmsCodeSucceeded"]!;
  String get confirmPhoneMsg => _data["confirmPhoneMsg"]!;
  String get confirmationSucceeded => _data["confirmationSucceeded"]!;
  String get smsSendTo => _data["smsSendTo"]!;
  String get emailNotConfirmedMsg => _data["emailNotConfirmedMsg"]!;
  String get activationLinkSendToEmail => _data["activationLinkSendToEmail"]!;
  String get searchFaild => _data["searchFaild"]!;
  String get pleaseAddFullName => _data["pleaseAddFullName"]!;
  String get pleaseChooseCategory => _data["pleaseChooseCategory"]!;
  String get loading => _data["loading"]!;
  String get deleteSuccessfully => _data["deleteSuccessfully"]!;
  String get invalidPhoneNumber => _data["invalidPhoneNumber"]!;
  String get smsCodeSend => _data["smsCodeSend"]!;
  String get enterPassword => _data["enterPassword"]!;
  String get enterCodeSended => _data["enterCodeSended"]!;
}

class LocaleappMsg {
  late final Map<String, String> _data;
  LocaleappMsg(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get addedToDailyMeals => _data["addedToDailyMeals"]!;
  String get sessionBookedSuccessfully => _data["sessionBookedSuccessfully"]!;
  String get noAvailableTimes => _data["noAvailableTimes"]!;
}

class LocaledateTime {
  late final Map<String, String> _data;
  LocaledateTime(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get saturday => _data["saturday"]!;
  String get sunday => _data["sunday"]!;
  String get monday => _data["monday"]!;
  String get tuesday => _data["tuesday"]!;
  String get wednesday => _data["wednesday"]!;
  String get thursday => _data["thursday"]!;
  String get friday => _data["friday"]!;
  String get year => _data["year"]!;
  String get month => _data["month"]!;
  String get months => _data["months"]!;
  String get minute => _data["minute"]!;
  String get minutes => _data["minutes"]!;
  String get minutesShortcut => _data["minutesShortcut"]!;
  String get theYear => _data["theYear"]!;
  String get theMonth => _data["theMonth"]!;
  String get hourShortcut => _data["hourShortcut"]!;
  String get january => _data["january"]!;
  String get february => _data["february"]!;
  String get march => _data["march"]!;
  String get april => _data["april"]!;
  String get may => _data["may"]!;
  String get june => _data["june"]!;
  String get july => _data["july"]!;
  String get august => _data["august"]!;
  String get september => _data["september"]!;
  String get october => _data["october"]!;
  String get november => _data["november"]!;
  String get december => _data["december"]!;
}

class Localepayment {
  late final Map<String, String> _data;
  Localepayment(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get creditCardNumber => _data["creditCardNumber"]!;
  String get ccv => _data["ccv"]!;
  String get nameOnCard => _data["nameOnCard"]!;
}

