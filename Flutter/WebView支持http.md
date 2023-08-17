# 安卓 WebView 支持 HTTP 请求

最新的flutter2版本中，flutter官方已经成功填坑，现在我们只需要在AndroidManifest.xml里配置好usesCleartextTraffic和network_security_config即可！

具体操作就是在flutter项目下创建/android/app/src/main/res/xml/network_security_config.xml文件，填上配置内容：

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system" />
            <certificates src="user" />
        </trust-anchors>
    </base-config>
</network-security-config>
```

然后修改/android/app/src/main/AndroidManifest.xml文件，在 `application` 节点加入以下两个属性即可：

```xml
<application
  android:usesCleartextTraffic="true"
  android:networkSecurityConfig="@xml/network_security_config"
/>
```