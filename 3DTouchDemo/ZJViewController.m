//
//  ZJViewController.m
//  3DTouchDemo
//
//  Created by 张建 on 2017/3/19.
//  Copyright © 2017年 张建. All rights reserved.
//

#import "ZJViewController.h"

@interface ZJViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation ZJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWebView];
}

- (void)loadWebView{
    NSString *webStr = @"https://www.baidu.com/";
    self.mainWebView.scalesPageToFit = YES;
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webStr]]];
    self.mainWebView.layer.cornerRadius = 150;
    self.mainWebView.layer.masksToBounds = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
