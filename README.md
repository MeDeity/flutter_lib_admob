# flutter_lib_admob

a flutter lib utils for admob.

## How To Use
#### Android 配置:
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

#### IOS配置
在Info.plist中加入以下内容
```
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
```

在启动页中加入:

```
在需要使用Admob的Widget上mixin AdmobUtils
```dart

```
