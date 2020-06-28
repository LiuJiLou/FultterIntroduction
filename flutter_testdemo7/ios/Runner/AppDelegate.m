#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate ()
@property (nonatomic, strong) FlutterMethodChannel * methodChannel;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  
    FlutterViewController * vc = (FlutterViewController *)self.window.rootViewController;
    
//    拿到Flutter Channel
    NSLog(@"%@",self.window.rootViewController);
    
//    显示线程
//    这里的name 要和Flutter里面的一模一样不要写错了
    self.methodChannel = [FlutterMethodChannel methodChannelWithName:@"choose_picture_page" binaryMessenger:vc];
    UIImagePickerController * imageVC = [[UIImagePickerController alloc] init];
    imageVC.delegate = self;
    
//    监听Flutter的消息
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//        这里要判断一下收到的消息
        if ([call.method isEqualToString:@"picture"]) {

            [vc presentViewController:imageVC animated:YES completion:nil];
        }
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%@",info);
        NSString * imagePath = [NSString stringWithFormat:@"%@",info[@"UIImagePickerControllerImageURL"]];
        [self.methodChannel invokeMethod:@"imagePath" arguments:imagePath];
    }];
}

@end
