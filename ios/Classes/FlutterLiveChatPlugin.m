#import "FlutterLiveChatPlugin.h"
#if __has_include(<flutter_live_chat_plugin/flutter_live_chat_plugin-Swift.h>)
#import <flutter_live_chat_plugin/flutter_live_chat_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_live_chat_plugin-Swift.h"
#endif

@implementation FlutterLiveChatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLiveChatPlugin registerWithRegistrar:registrar];
}
@end
