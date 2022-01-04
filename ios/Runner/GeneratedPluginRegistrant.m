//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_native_image/FlutterNativeImagePlugin.h>)
#import <flutter_native_image/FlutterNativeImagePlugin.h>
#else
@import flutter_native_image;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterNativeImagePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNativeImagePlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
}

@end
