//
//  ZFButton.m
//  UIButton
//
//  Created by xinshiyun on 2017/5/19.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFButton.h"
#import <math.h>
@interface ZFButton(){
    NSTimer *timer;
    CGFloat radius;
    UIColor *animationColor;
    int countNum;
}
@property(assign,nonatomic)CGFloat circleCenterX;
@property(assign,nonatomic)CGFloat circleCenterY;
@end

@implementation ZFButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        countNum = 0;
        animationColor = [UIColor colorWithRed:216/255.0 green:114/255.0 blue:213 / 255.0 alpha:1];
    }
    return self;
}

-(void)startAnimation:(UIButton *)btn event:(UIEvent *)event{
    self.userInteractionEnabled = NO;

//    UIView *button = (UIView *)btn.superview;
    //获取event 事件在 btn 的事件集
    NSSet *set = [event touchesForView:btn];
    //获取点击所有点击事件对象
    NSArray *touchArr = set.allObjects;
    //获取第一个点击事件对象
    UITouch *touch = touchArr[0];
    //获取点击在btn 上的point
    CGPoint point = [touch locationInView:btn];
    self.circleCenterX = point.x;
    self.circleCenterY = point.y;
    
    //开启定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    
    //开启runloop 定时器更加准确
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)timeAction{
    countNum += 1;
    //可以加延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        radius += 5;
        [self setNeedsDisplay];
    });
    //增加半径 没有算最大半径就给听50
    if (radius > 50) {
        countNum = 0;
        radius = 0;
        [timer invalidate]; //定时器停止
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            radius = 0;
            [self setNeedsDisplay];
        });
        //按钮可以点击
        self.userInteractionEnabled = YES;
    }
}


-(void)drawRect:(CGRect)rect{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //画圆
    CGContextAddArc(ctx, self.circleCenterX, self.circleCenterY, radius, 0,M_PI * 2, 0);
    [animationColor setStroke];
    [animationColor setFill];
    CGContextFillPath(ctx);

}


@end
