#import "CustomCalendarTablePlugin.h"
#if __has_include(<custom_calendar_table/custom_calendar_table-Swift.h>)
#import <custom_calendar_table/custom_calendar_table-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_calendar_table-Swift.h"
#endif

@implementation CustomCalendarTablePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomCalendarTablePlugin registerWithRegistrar:registrar];
}
@end
