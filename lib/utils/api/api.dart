import 'dart:convert';
import 'package:vendingapp/utils/snack.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  static const String url = 'http://127.0.0.1:7700/';
  static const String socketURL = 'ws://127.0.0.1:7700/';
  // static const String mediaUrl = 'http://media.gnmcargo.com/';

  // static const String url = 'http://127.0.0.1:4100/';
  // static const String url = 'http://192.168.0.102:4100/';
  // static const String docURL = 'http://192.168.0.102:3006/';

  static const String mediaUrl = 'http://media.gnmcargo.com/';

  var token = '';

  Future<String?> _getNormalToken(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var localToken = sharedPreferences.getString('token');
    if (localToken != null) {
      token = 'Token $localToken';
      return token;
    }
    // await _navigateHome(context: context);
    return null;
  }

  http.Response evaluateResponseData(http.Response res, context,
      {login = false}) {
    if (res.statusCode == 200) {
      return res;
    } else if (res.statusCode == 500) {
      //--- Push to a page with 500 status, and code for troubleshoot
      // showSnack(context, AppLocalizations.of(context)!.unauthorized);
      return res;
    } else if (res.statusCode == 400) {
      //--- Push to a page with 500 status, and code for troubleshoot
      // scafold(context, 'Record Not Found');
      showSnack(context, 'Invalid request arguments');
      return res;
    } else if (res.statusCode == 401) {
      if (login) {
        // showSnack(context, AppLocalizations.of(context)!.otp_error);
        showSnack(context, 'Unauthorized request');
        // TODO: navigate to login page
      } else {
        // _navigateHome(context: context);
      }
      return res;
    } else {
      // scafold(context, res.body);
      return res;
    }
  }

  authenticatedPostRequest(data, apiUrl, {BuildContext? context}) async {
    var fullUrl = url + apiUrl;
    await _getNormalToken(context);
    try {
      var res = await http.post(
          Uri.parse(
            fullUrl,
          ),
          body: jsonEncode(data),
          headers: _setHeaders());
      return evaluateResponseData(res, context);
    } catch (e) {
      // showSnack(context, AppLocalizations.of(context)!.no_netwrok);
      return null;
    }
  }

  Future<http.Response?> authenticatedGetRequest(apiUrl,
      {BuildContext? context}) async {
    await _getNormalToken(context);
    var fullUrl = url + apiUrl;
    try {
      var res = await http.get(Uri.parse(fullUrl), headers: _setHeaders());
      return evaluateResponseData(res, context);
    } catch (e) {
      // debugPrint(e.toString());
      // showSnack(context, AppLocalizations.of(context)!.no_netwrok);
      return null;
    }
  }

  Future<http.Response?> authenticatedPutRequest(apiUrl,
      {context = null}) async {
    await _getNormalToken(context);
    var fullUrl = url + apiUrl;
    try {
      var res = await http.put(Uri.parse(fullUrl), headers: _setHeaders());
      return evaluateResponseData(res, context);
    } catch (e) {
      // showSnack(context, AppLocalizations.of(context)!.no_netwrok);
      return null;
    }
  }

  Future<http.Response?> postRequest(data, apiUrl,
      {BuildContext? context, login = false, evaluate = true}) async {
    var fullUrl = url + apiUrl;
    try {
      var res = await http.post(
          Uri.parse(
            fullUrl,
          ),
          body: jsonEncode(data),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (evaluate) {
        return evaluateResponseData(res, context, login: login);
      }
      return res;
    } catch (e) {
      // showSnack(context, AppLocalizations.of(context)!.no_netwrok);
      return null;
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token
      };

  static nextUrlFormat(String url) {
    return url.replaceFirst(CallApi.url, '');
  }
}
