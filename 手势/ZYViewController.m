//
//  ZYViewController.m
//  手势
//
//  Created by lixing.wang on 15/4/23.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ZYViewController.h"

@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)viewDidLoad {
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 120, 120)];
    view.backgroundColor =[UIColor redColor];
    [self.view addSubview:view];
    [view release];
    
    
    //手势类，为我们封装了几种常见的手势识别
    //UIGestureRecognizer，是一个抽象类，是所有手势的父类，我使用它的子类进行手势识别操作。
    //UITapGestureRecognizer，点击（点击屏幕）
    //UIPanGestureRecognizer，滑动（点击屏幕，手指移动）
    //UISwipeGestureRecognizer，轻扫（快速的划过屏幕）
    //UIPinchGestureRecognizer，捏合（两个手指的缩放）
    //UIRotationGestureRecognizer，旋转（两个手指旋转）
    //UILongPressGestureRecognizer，长按（点击屏幕不松手）
    //UIScreenEdgePanGestureRecognizer，iOS 7 新增的，在屏幕的边缘滑动
    
    //1.创建手势对象，指定回调对象和方法。
    //2.把手势绑定到需要识别这个手势的 view 上，只要在这个 view 的边界内触摸屏幕，如果操作符合手势的识别，那么就会调用手势的回调方法。
    
    //回调方法有一个参数，手势对象
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //点击的次数，默认是 1
//    tap.numberOfTapsRequired = 2;
    //手指的个数，默认是 1
    tap.numberOfTouchesRequired = 2;
    
    //把手势绑定到 view 上，一个 view 可以有多个手势，但是一个手势对象只能对应一个 view。
    [view addGestureRecognizer:tap];
    
    [tap release];
    
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    //minimumNumberOfTouches，maximumNumberOfTouches，最少最多的手指数
//    [view addGestureRecognizer:pan];
    [pan release];
    
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //手指轻扫的方向，最多支持两个，最好每一个方向单独一个轻扫手势，因为在回调方法中不能获得轻扫的方向。
    //如果想支持四个，最好设置四个 swipe 手势。
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    
//    [self.view addGestureRecognizer:swipe];
    
    [swipe release];
    
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [view addGestureRecognizer:pinch];
    [pinch release];
    
    UIRotationGestureRecognizer* rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [view addGestureRecognizer:rotation];
    [rotation release];
    
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    //长按的最短时间，默认 0.5
    longPress.minimumPressDuration = 1.0f;
    //按下以后手指的移动距离，默认是 10
    longPress.allowableMovement = 0.0f;
    
//    [view addGestureRecognizer:longPress];
    [longPress release];
    
    //轻扫
    UIScreenEdgePanGestureRecognizer* screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePan:)];
    //触发手势的屏幕范围
    screenEdgePan.edges = UIRectEdgeLeft;
    
    [self.view addGestureRecognizer:screenEdgePan];
    
    [screenEdgePan release];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [view addGestureRecognizer:doubleTap];
    [doubleTap release];
    
    //单击手势的识别成功，必须等到双击手势的识别失败
    //我们点击一次屏幕，并不会立即出发单击手势，而是等到双击手势识别失败，那么才确定单击手势识别成功，去触发单击手势。
    [tap requireGestureRecognizerToFail:doubleTap];
}

- (void)doubleTap:(UITapGestureRecognizer* )gesture {
    NSLog(@"+++++++++++++");
}

//回调方法
//- (void)tap:(UITapGestureRecognizer* )gesture {
//    NSLog(@"-----------------");
//    
//    //获得手指在 view 上的坐标
//    CGPoint point = [gesture locationInView:gesture.view];
//    
//    NSLog(@"%@", NSStringFromCGPoint(point));
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//            
//
//
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//            
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//        }
//            break;
//        default:
//            break;
//    }
//}

//- (void)pan:(UIPanGestureRecognizer* )gesture {
////    NSLog(@"-----------------");
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//            NSLog(@"开始");
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//            NSLog(@"移动");
//            
//            //view，获得手势绑定的 view
//            CGPoint point = [gesture translationInView:gesture.view];
//            
//            //NSStringFromCGPoint，把 CGPoint 转换为 NSString
//            //CGPointFromString，把 NSString 转换为 CGPoint
//            NSLog(@"%@", NSStringFromCGPoint(point));
//            
//            //以按下的初始点为原点，向右，向下为正，其余为负
//            //x，y 分别表示移动了多少距离，x，y 也是累加的
//            
//            //重置移动的距离，重置为 0，0，那么下次得到的 point，就是两次移动之间的距离。
//            [gesture setTranslation:CGPointZero inView:gesture.view];
//            
//            //移动 view
//            //原始坐标 ＋ 偏移量
////            gesture.view.center = CGPointMake(gesture.view.center.x + point.x, gesture.view.center.y + point.y);
//            
//            //CGRectOffset，对一个 CGRect 做偏移，返回一个新的 CGRect
//            gesture.view.frame = CGRectOffset(gesture.view.frame, point.x, point.y);
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//            NSLog(@"结束");
//        }
//            break;
//        default:
//            break;
//    }
//}

//- (void)swipe:(UISwipeGestureRecognizer* )gesture {
////    NSLog(@"-----------------");
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//        }
//            break;
//        default:
//            break;
//    }
//}

- (void)pinch:(UIPinchGestureRecognizer* )gesture {
//    NSLog(@"-----------------");
    
    //判断一下手势的状态，通常使用的有三个
    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            //开始
        }
            break;
        case UIGestureRecognizerStateChanged:{
            //移动
            NSLog(@"-----%f", gesture.scale);
            
            //transform，view 的一些 3d 变换的属性。
            
            //缩放到多少
            //在第一个参数的基础上放大缩小
            //CGAffineTransformIdentity，矩阵的原始值
//            gesture.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, gesture.scale, gesture.scale);
            
            //在原始的基础上缩放到多少倍
            gesture.view.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
            
            //CGAffineTransformRotate
            //CGAffineTransformMakeRotation，用来做旋转
            
            //CGAffineTransformTranslation
            //CGAffineTransformMakeTranslation，用来做平移
            
//            NSLog(@"%@", NSStringFromCGRect(gesture.view.frame));
        }
            break;
        case UIGestureRecognizerStateEnded:{
            //完成
        }
            break;
        default:
            break;
    }
}

//- (void)rotation:(UIRotationGestureRecognizer* )gesture {
////    NSLog(@"-----------------");
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//            
//            //旋转的弧度， PI
//            NSLog(@"----%f", gesture.rotation);
//            
//            gesture.view.transform = CGAffineTransformMakeRotation(gesture.rotation);
//            
//            //CGAffineTransformRotate
//            //CGAffineTransformMakeRotation，用来做旋转
//            
//            //CGAffineTransformTranslation
//            //CGAffineTransformMakeTranslation，用来做平移
//            
//            //            NSLog(@"%@", NSStringFromCGRect(gesture.view.frame));
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//        }
//            break;
//        default:
//            break;
//    }
//}

//- (void)longPress:(UILongPressGestureRecognizer* )gesture {
//    NSLog(@"-----------------");
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//        }
//            break;
//        default:
//            break;
//    }
//}

//- (void)screenEdgePan:(UIScreenEdgePanGestureRecognizer* )gesture {
//    NSLog(@"-----------------");
//    
//    //判断一下手势的状态，通常使用的有三个
//    //手势的每一个状态都会调用这个回调方法，所以我们需要判断一下，在不同的状态下，做不同的操作
//    switch (gesture.state) {
//        case UIGestureRecognizerStateBegan:{
//            //开始
//        }
//            break;
//        case UIGestureRecognizerStateChanged:{
//            //移动
//        }
//            break;
//        case UIGestureRecognizerStateEnded:{
//            //完成
//        }
//            break;
//        default:
//            break;
//    }
//}


//UIGestureRecognizerDelegate
//是否同时触发两个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
