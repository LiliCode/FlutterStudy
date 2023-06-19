# Flutter 项目编译问题

## 1. Flutter 3.0 调试安卓平台卡住问题

一直卡在 `Running Gradle task 'assembleDebug'...` 这里，可能是因为网络问题，比如国家防火墙干扰。

使用修改地址的方式解决问题:

1. 打开当前项目目录的 `./android/build.gradle` 文件，使用下面代码替换掉 `google()` 和 `mavenCentral()`，这里有两处，分别在 `buildscript` 和 `allprojects` 下面

    ```java
    maven {
        allowInsecureProtocol = true
        url 'https://maven.aliyun.com/repository/google'
    }
    maven {
        allowInsecureProtocol = true
        url 'https://maven.aliyun.com/repository/jcenter'
    }
    maven { 
        allowInsecureProtocol = true 
        url 'http://maven.aliyun.com/nexus/content/groups/public'
    }
    ```

2. 打开 Flutter SDK 下的 `~/flutter/packages/flutter_tools/gradle/flutter.gradle` 文件修改两处代码
    - 在 `buildscript` 中使用第1步的代码替换掉 `google()` 和 `mavenCentral()`
    - 找到 `FlutterPlugin` 类中的 `DEFAULT_MAVEN_HOST` 静态变量，使用下面的地址替换掉。
        ```java
        // 原地址
        // private static final String DEFAULT_MAVEN_HOST = "https://storage.googleapis.com";
        // 替换后的地址
        private static final String DEFAULT_MAVEN_HOST = "https://storage.flutter-io.cn";
        ```

参考资料地址: <https://www.bilibili.com/read/cv22572083>

## Unable to find bundled Java version 解决方法

如果运行 flutter doctor 发现 Android Studio 有一处错误 Unable to find bundled Java version，解决办法如下：

- 如果是 macOS 系统，在 jbr 同目录下创建一个jre目录，然后将 jbr 目录内的全部文件复制一份到 jre 目录下即可。
- 如果是 Windows 系统，jre目录是存在的，不过里面几乎没东西，可以直接将 jbr 目录内的全部文件复制一份到 jr e目录下即可。

然后在终端运行 flutter doctor 查看是否还会报错
