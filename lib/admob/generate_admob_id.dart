import 'dart:math';

import 'package:flutter/material.dart';

///
///admob id 生成器
///create by fengwenhua at 2019-10-21 14:44:52
///
class GenerateAdmobId {
  ///存放appIds(android/ios)
  final List<String> appIdList;

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
      {@required this.appIdList,
      this.androidBannerIdList,
      this.iosBannerIdList,
      this.androidInterstitialIdList,
      this.iosInterstitialIdList,
      this.androidRewardBasedVideoIdList,
      this.iosRewardBasedVideoIdList}):assert(null!=appIdList);

  ///返回随机Id
  String getRandomIds(List<String> list){
    String result = "";
    if(null!=list&&list.isNotEmpty){
      int size = list.length;
      int seed = Random().nextInt(size);
      result = list[seed];
    }
    return result;
  }
}
