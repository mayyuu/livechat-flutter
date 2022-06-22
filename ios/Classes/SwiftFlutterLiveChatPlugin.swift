import Flutter
import UIKit
import LiveChatFlutterNew

public class SwiftFlutterLiveChatPlugin: NSObject, FlutterPlugin {
 public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "livechatt", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterLiveChatPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
    switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "beginChat":
            let arguments = call.arguments as! [String:Any]

            let licenseNo = (arguments["licenseNo"] as? String)
            let groupId = (arguments["groupId"] as? String)
            let visitorName = (arguments["visitorName"] as? String)
            let visitorEmail = (arguments["visitorEmail"] as? String)
            let customParams = (arguments["customParams"] as? [String:String])

            if (licenseNo == ""){
                result(FlutterError(code: "", message: "LICENSE NUMBER EMPTY", details: nil))
            }else if (visitorName == ""){
                result(FlutterError(code: "", message: "VISITOR NAME EMPTY", details: nil))
            }else if (visitorEmail == ""){
                 result(FlutterError(code: "", message: "VISITOR EMAIL EMPTY", details: nil))
            }else{
                LiveChat.licenseId = licenseNo // Set your licence number here
                LiveChat.groupId = groupId // Optionally, You can route your customers to specific group of agents by providing groupId
                LiveChat.name = visitorName // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey:
                LiveChat.email = visitorEmail // You can provide customer name or email if they are known, so a customer will not need to fill out the pre-chat survey:
                LiveChat.customVariables = customParams
                LiveChat.presentChat()
                result(nil)
            }
        case "clearSession":
               LiveChat.clearSession()
               result(nil)
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
