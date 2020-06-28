#import "MandarinToLatinPlugin.h"
#if __has_include(<mandarin_to_latin/mandarin_to_latin-Swift.h>)
#import <mandarin_to_latin/mandarin_to_latin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mandarin_to_latin-Swift.h"
#endif

@implementation MandarinToLatinPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMandarinToLatinPlugin registerWithRegistrar:registrar];
}
@end
