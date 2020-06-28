import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let methodChannelName = "mandarin_to_latin"

  private var flutterViewController: FlutterViewController {
    return self.window.rootViewController as! FlutterViewController
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: flutterViewController.binaryMessenger)

    methodChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in

      if call.method == "mandarinToLatin" {
        let chineseText = call.arguments as! String;
        if let transform = chineseText.applyingTransform(.mandarinToLatin, reverse: false) {
          result(transform)
        } else {
          result("")
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
