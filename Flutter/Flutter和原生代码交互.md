# Flutter 和原生代码交互

使用 Flutter 框架提供的 `MethodChannel` 来进行交互

1. 在 Flutter 代码中的实现

    新建一个 MethodChannel 通道，传入通道名称，以便识别

    ```dart
    // com.app.demo 是这个通道的名称
    const plantform = const MethodChannel("com.app.demo");
    ```

    调用方法，如果方法名称叫 getUserInfo
    
    ```dart
    Future<String?> getUserInfo() async {
        // 这里仅仅只做 iOS 部分
        if (Platform.isIOS) {
            // 调用原生方法
            return await plantform.invokeMethod('getUserInfo');
        }

        return Future.value(null);
    }
    ```

2. iOS 代码中的实现

    打开 iOS 项目，新建一个 FlutterNativePlugin.swift 的文件，创建一个 FlutterNativePlugin 类，遵守 `FlutterPlugin` 协议，实现协议方法

    ```swift
    class FlutterNativePlugin : NSObject, FlutterPlugin {
        
        static func register(with registrar: FlutterPluginRegistrar) {
            // 在这里注册 channel , com.app.demo 就是 flutter 代码中 channel 名称
            let channel = FlutterMethodChannel(name: "com.app.demo", binaryMessenger: registrar.messenger())
            registrar.addMethodCallDelegate(FlutterNativePlugin(), channel: channel)
        }
        
        // 这里是 flutter 代码调用的方法
        func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
            if call.method == "getUserInfo" {
                // 返回值的传回方式
                result("name=tom")
            }
        }
    
    }
    ```

    然后在 AppDelegate.swift 文件中，在 didiFinishLuanching 方法中注册上面创建的类

    ```swift
    override func application( _ application: UIApplication, didFinishLaunchingWithOptions  launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        // 在这里注册
        FlutterNativePlugin.register(with: registrar(forPlugin: "FlutterNativePlugin")!)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    ```

3. 在 flutter 代码中就可以调用了，如下所示

    ```dart
    func() async {
        final text = await getUserInfo();
        print('和原生交互的结果: $text');
    }

    func();
    ```

其他平台原理和 iOS 类似，请在官网自行查询 <https://flutter.cn/docs/development/platform-integration/platform-channels?tab=ios-channel-swift-tab>