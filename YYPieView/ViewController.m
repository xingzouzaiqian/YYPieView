//
//  ViewController.m
//  YYPieView
//
//  Created by PanYard on 16/10/31.
//  Copyright © 2016年 PanYard. All rights reserved.
//

#import "ViewController.h"
#import "MFSPieView.h"

#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
    view.backgroundColor = [UIColor whiteColor];
    
    CGFloat angle = 20;
    NSMutableArray *angleArr = [NSMutableArray array];
    
    [angleArr addObject:@(angle)];
    angle = angle + 50;
    [angleArr addObject:@(angle)];
    angle = angle + 80;
    [angleArr addObject:@(angle)];
    angle = angle + 100;
    [angleArr addObject:@(angle)];
    angle = angle + 30;
    [angleArr addObject:@(angle)];
    
    MFSPieView *pie = [[MFSPieView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    pie.angles = angleArr;
    [view addSubview:pie];
    
    UIView *pieDetailView = [[NSBundle mainBundle] loadNibNamed:@"MFSPieDetailView" owner:nil options:nil].lastObject;
    pieDetailView.frame = CGRectMake((SCREEN_WIDTH - 160)/2, 180, 160, 70);
    [view addSubview:pieDetailView];
}



@end
