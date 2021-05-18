#import "YcFlutterPlugin.h"
#if __has_include(<yc_flutter_plugin/yc_flutter_plugin-Swift.h>)
#import <yc_flutter_plugin/yc_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "yc_flutter_plugin-Swift.h"
#endif

@implementation YcFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYcFlutterPlugin registerWithRegistrar:registrar];
}
@end
