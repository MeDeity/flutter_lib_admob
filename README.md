# flutter_lib_admob

a flutter lib utils for admob.

## How To Use

### 示例Demo
你可以在这里看到示例Demo:[admob_demo](https://github.com/MeDeity/admob_demo)


### 平台相关
#### 一、Android 配置:
在AndroidManifest.xml中配置AppId(以下以官方测试用ID为例):
```
<application>
...
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-3940256099942544~3347511713"/>
...
</application>
```

#### 二、IOS配置
在Info.plist中加入以下内容
```
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
```

#### 三、初始化
```
AdmobUtils.initAdmobIds(
      appIdList: [
        "ca-app-pub-3940256099942544~3347511713",
        "ca-app-pub-3940256099942544~1458002511"
      ],
      androidBannerIdList:["ca-app-pub-3940256099942544/6300978111"],
      iosBannerIdList:["ca-app-pub-3940256099942544/2934735716"],
      androidInterstitialIdList:["ca-app-pub-3940256099942544/1033173712"],
      iosInterstitialIdList:["ca-app-pub-3940256099942544/4411468910"],
      androidRewardBasedVideoIdList:["ca-app-pub-3940256099942544/5224354917"],
      iosRewardBasedVideoIdList:["ca-app-pub-3940256099942544/1712485313"]
    );
///add init and listener callback    
AdmobUtils.initData((AdmobAdEvent event, Map<String, dynamic> args, AdTypeEnum adType) {
      print("${adType.index}");
    });    
///init admob config    
GenerateAdmobId factory = AdmobUtils.getAdmobIdFactory();
Admob.initialize(factory.getAppId());
```

#### 四、展示广告

```dart
///展示插页式AD
AdmobUtils.showInterstitialAd();
///展示奖励式AD
AdmobUtils.showRewardAd();
///retrun a widget
Widget banner = AdmobUtils.showBannerAd(
    callback: (AdmobAdEvent event, Map<String, dynamic> args,AdTypeEnum adType) {
    ///do something
}),
```


