import Flutter
import UIKit

public class SwiftMandarinToLatinPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mandarin_to_latin", binaryMessenger: registrar.messenger())
    let instance = SwiftMandarinToLatinPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
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
  }
}
