import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_admob/admob/ad_type_enum.dart';
import 'package:flutter_lib_admob/admob/generate_admob_id.dart';

///
/// 工具类汇总
/// create by fengwenhua at 2019-10-21 17:22:11
///
class AdmobUtils {
  static GenerateAdmobId _generateAdmobId;
  static AdmobInterstitial interstitialAd;
  static AdmobReward rewardAd;

  ///初始化id
  static void initAdmobIds({
    List<String> appIdList,
    List<String> androidBannerIdList,
    List<String> iosBannerIdList,
    List<String> androidInterstitialIdList,
    List<String> iosInterstitialIdList,
    List<String> androidRewardBasedVideoIdList,
    List<String> iosRewardBasedVideoIdList}) {
    _generateAdmobId = GenerateAdmobId(appIdList: appIdList,
        androidBannerIdList: androidBannerIdList,
        iosBannerIdList: iosBannerIdList,
        androidInterstitialIdList: androidInterstitialIdList,
        iosInterstitialIdList: iosInterstitialIdList,
        androidRewardBasedVideoIdList: androidRewardBasedVideoIdList,
        iosRewardBasedVideoIdList: iosRewardBasedVideoIdList);
  }

  static GenerateAdmobId getAdmobIdFactory(){
    return _generateAdmobId;
  }


  ///回调处理
  static void initData(EventCallback callback) {
    interstitialAd = AdmobInterstitial(
      adUnitId: _generateAdmobId.getInterstitialRandomId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        callback(event, args, AdTypeEnum.Interstitial);
      },
    );

    rewardAd = AdmobReward(
        adUnitId: _generateAdmobId.getRewardRandomId(),
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) rewardAd.load();
          callback(event, args, AdTypeEnum.Reward);
        });

    interstitialAd.load();
    rewardAd.load();
  }

  static void showInterstitialAd() {
    interstitialAd?.show();
  }

  static void showRewardAd() {
    rewardAd?.show();
  }

  static Widget showBannerAd({AdmobBannerSize bannerSize:AdmobBannerSize.BANNER,EventCallback callback}) {
    return AdmobBanner(
      adUnitId: _generateAdmobId.getBannerRandomId(),
      adSize: bannerSize,
      listener:(AdmobAdEvent event, Map<String, dynamic> args) {
        callback(event, args, AdTypeEnum.Reward);
      },
    );
  }

  static void disposeInterstitialAd() {
    interstitialAd?.show();
  }

  static void disposeRewardAd() {
    rewardAd?.show();
  }


  ///测试用方法
  static void initTestData(EventCallback callback) {
    _generateAdmobId = GenerateAdmobId()
      ..initTestIds();

    interstitialAd = AdmobInterstitial(
      adUnitId: _generateAdmobId.getInterstitialRandomId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        callback(event, args, AdTypeEnum.Interstitial);
      },
    );

    rewardAd = AdmobReward(
        adUnitId: _generateAdmobId.getRewardRandomId(),
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) rewardAd.load();
          callback(event, args, AdTypeEnum.Reward);
        });

    interstitialAd.load();
    rewardAd.load();
  }
}

typedef void EventCallback(AdmobAdEvent event, Map<String, dynamic> args,
    AdTypeEnum adType);
