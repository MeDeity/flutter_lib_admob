import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

///
///admob id 生成器
///create by fengwenhua at 2019-10-21 14:44:52
///
class GenerateAdmobId {
  ///存放appIds(android/ios)
  List<String> appIdList;

  ///存放bannerIds(android/ios) --Banner
  List<String> androidBannerIdList = List();
  List<String> iosBannerIdList = List();

  ///存放interstitialIds(android/ios)-插页式
  List<String> androidInterstitialIdList = List();
  List<String> iosInterstitialIdList = List();

  ///存放RewardBasedVideoIds(android/ios)- 奖励式Video
  List<String> androidRewardBasedVideoIdList = List();
  List<String> iosRewardBasedVideoIdList = List();

  GenerateAdmobId(
      {this.appIdList,
      this.androidBannerIdList,
      this.iosBannerIdList,
      this.androidInterstitialIdList,
      this.iosInterstitialIdList,
      this.androidRewardBasedVideoIdList,
      this.iosRewardBasedVideoIdList});

  ///返回随机Id
  String getRandomIds(List<String> list) {
    String result = "";
    if (null != list && list.isNotEmpty) {
      int size = list.length;
      int seed = Random().nextInt(size);
      result = list[seed];
    }
    return result;
  }

  ///返回app id
  String getAppId(){
    String result = "";
    int size = appIdList?.length??0;
    if(Platform.isAndroid){
      if(size>=1){
        result = appIdList[0];
      }
    }else if(Platform.isIOS){
      if(size>=2){
        result = appIdList[1];
      }
    }
    return result;
  }

  ///返回banner id
  String getBannerRandomId(){
    String result = "";
    if(Platform.isAndroid){
      result = getRandomIds(androidBannerIdList);
    }else if(Platform.isIOS){
      result = getRandomIds(iosBannerIdList);
    }
    return result;
  }


  ///返回Interstitial id
  String getInterstitialRandomId(){
    String result = "";
    if(Platform.isAndroid){
      result = getRandomIds(androidInterstitialIdList);
    }else if(Platform.isIOS){
      result = getRandomIds(iosInterstitialIdList);
    }
    return result;
  }

  ///返回Reward id
  String getRewardRandomId(){
    String result = "";
    if(Platform.isAndroid){
      result = getRandomIds(androidRewardBasedVideoIdList);
    }else if(Platform.isIOS){
      result = getRandomIds(iosRewardBasedVideoIdList);
    }
    return result;
  }

  //
  //Test Id's from: 测试用的ID值
  //https://developers.google.com/admob/ios/banner
  //https://developers.google.com/admob/android/banner
  //
  //App Id
  //Android: ca-app-pub-3940256099942544~3347511713
  //iOS: ca-app-pub-3940256099942544~1458002511
  //
  //Banner
  //Android: ca-app-pub-3940256099942544/6300978111
  //iOS: ca-app-pub-3940256099942544/2934735716
  //
  //Interstitial
  //Android: ca-app-pub-3940256099942544/1033173712
  //iOS: ca-app-pub-3940256099942544/4411468910
  //
  //Reward Video
  //Android: ca-app-pub-3940256099942544/5224354917
  //iOS: ca-app-pub-3940256099942544/1712485313
  //
  void initTestIds() {
    this.appIdList = [
      "ca-app-pub-3940256099942544~3347511713",
      "ca-app-pub-3940256099942544~1458002511"
    ];

    ///android+ios app id;
    this.androidBannerIdList = ["ca-app-pub-3940256099942544/6300978111"];

    ///android banner id
    this.iosBannerIdList = ["ca-app-pub-3940256099942544/2934735716"];

    ///Interstitial id
    this.androidInterstitialIdList = ["ca-app-pub-3940256099942544/1033173712"];
    this.iosInterstitialIdList = ["ca-app-pub-3940256099942544/4411468910"];

    ///Reward Video
    this.androidRewardBasedVideoIdList = [
      "ca-app-pub-3940256099942544/5224354917"
    ];
    this.iosRewardBasedVideoIdList = ["ca-app-pub-3940256099942544/1712485313"];
  }
}
