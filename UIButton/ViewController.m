//
//  ViewController.m
//  UIButton
//
//  Created by xinshiyun on 2017/5/19.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ViewController.h"
#import "ZFButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZFButton *btn = [[ZFButton alloc]initWithFrame:CGRectMake(50, 100, 240, 50)];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
 
    [btn addTarget:self action:@selector(logonAction:event:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)logonAction:(ZFButton *)button event:(UIEvent *)event{
    [button startAnimation:button event:event];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
