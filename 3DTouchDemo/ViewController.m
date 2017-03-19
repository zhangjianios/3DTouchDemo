//
//  ViewController.m
//  3DTouchDemo
//
//  Created by 张建 on 2017/3/19.
//  Copyright © 2017年 张建. All rights reserved.
//

#import "ViewController.h"
#import "ZJViewController.h"
@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *zjLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self set3dTouchView];
    
    [self creatShortCutItem];
    
}

#pragma mark 在对应的视图上添加3DTouch
- (void)set3dTouchView{
    //首先，要判断设备是不是支持3dTouch'功能
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:self sourceView:_mainView];// 必须用控制器注册对应的触发的View视图,并且实现代理方法,
            }
        }
    }
}

#pragma mark -实现PreviewingDelegate代理的方法
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0){
    
    ZJViewController *zjVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ZJVC"];
    
    return zjVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0){
    
    
}

#pragma mark - 创建点击了每一个Item之后的操作
- (void)creatShortCutItem{
    //创建对应的Icon图标（这里用系统的，当然也可以自定义的）
    UIApplicationShortcutIcon *itemWithSearch = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutIcon *itemWithNavigation=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation];
    UIApplicationShortcutIcon *itemWithPlay=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    
    
    UIApplicationShortcutItem *searchItem = [[UIApplicationShortcutItem alloc]initWithType:@"com.zj.Search" localizedTitle:@"搜索" localizedSubtitle:@"🔐搜索啊🔍，喜欢😍-王者" icon:itemWithSearch userInfo:nil];
    
    UIApplicationShortcutItem *navicateItem = [[UIApplicationShortcutItem alloc]initWithType:@"com.zj.Navigation" localizedTitle:@"导航" localizedSubtitle:@"🔐导航啊🔍，喜欢😍-王" icon:itemWithNavigation userInfo:nil];
    
    UIApplicationShortcutItem *playItem = [[UIApplicationShortcutItem alloc]initWithType:@"com.zj.Play" localizedTitle:@"播放" localizedSubtitle:@"🔐播放啊🔍，喜欢😍-王" icon:itemWithPlay userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[searchItem, navicateItem, playItem];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
