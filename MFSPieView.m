//
//  MFSPieView.m
//  智齿
//
//  Created by PanYard on 16/6/15.
//  Copyright © 2016年 PanYard. All rights reserved.
//

#import "MFSPieView.h"


#define radius 60

#define CenterX     self.center.x
#define CenterY     self.center.y

static inline float radians(double degrees) {
    return degrees * M_PI / 180.0;
}

static inline void drawArc(CGContextRef ctx, CGPoint point, float angle_start, float angle_end, UIColor* color) {
    [color set];
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextAddArc(ctx, point.x, point.y, radius,  angle_start, angle_end, 0);
    CGContextFillPath(ctx);
}

@implementation MFSPieView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawPieView:ctx];
}

- (void)drawPieView:(CGContextRef)ctx{
    float angle_start = radians(0.0);
    float angle_end = radians(30.0);
    drawArc(ctx, self.center, angle_start, angle_end, RGBCOLOR(74, 107, 201));
    
    double angle = angle_end/2;
    if (angle_end - angle_start > 0) {
        [self drawLine:ctx angle:angle text:@"查看成绩"];
    }
    
    
    angle_start = angle_end;
    angle_end = radians(300);
    drawArc(ctx, self.center, angle_start, angle_end, RGBCOLOR(117, 151, 182));
    
    angle = (angle_end + angle_start)/2;
    if (angle_end - angle_start > 0) {
        [self drawLine:ctx angle:angle text:@"查看通知"];
    }
    
    
    angle_start = angle_end;
    angle_end = radians(320);
    drawArc(ctx, self.center, angle_start, angle_end, RGBCOLOR(51, 128, 170));
    
    angle = (angle_end + angle_start)/2;
    if (angle_end - angle_start > 0) {
        [self drawLine:ctx angle:angle text:@"查看作业"];
    }
    
    
    angle_start = angle_end;
    angle_end = radians(340);
    drawArc(ctx, self.center, angle_start, angle_end, RGBCOLOR(250, 133, 98));
    
    angle = (angle_end + angle_start)/2;
    if (angle_end - angle_start > 0) {
        [self drawLine:ctx angle:angle text:@"每日登录"];
    }
    
    
    angle_start = angle_end;
    angle_end = radians(360);
    drawArc(ctx, self.center, angle_start, angle_end, RGBCOLOR(98, 204, 86));
    
    angle = (angle_end + angle_start)/2;
    if (angle_end - angle_start > 0) {
        [self drawLine:ctx angle:angle text:@"分享"];
    }
}

- (void)drawLine:(CGContextRef)ctx angle:(float)angle text:(NSString *)text{
    CGFloat textW = 40;
    CGFloat textH = 11;
    
    CGFloat diagonal = 10; //diagonal 斜线
    CGFloat straightLint = 50; //straight line 直线
    
    if (angle <= M_PI/2 && angle > 0) {
        CGPoint p = CGPointMake(CenterX + radius*cos(angle), CenterY + radius*sin(angle));
        CGPoint p1 = CGPointMake(p.x + diagonal, p.y + diagonal);
        CGPoint p2 = CGPointMake(p1.x + straightLint, p1.y);
        CGPoint points[] = {p, p1, p2};
        CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
        [HEXCOLOR(0xdd3561) set];
        CGContextDrawPath(ctx, kCGPathStroke);
        [self drawText:text context:ctx rect:CGRectMake(p2.x-textW, p2.y-12, textW, textH)];
    }else if (angle > M_PI/2 && angle <= M_PI){
        CGPoint p = CGPointMake(CenterX + radius*cos(angle), CenterY + radius*sin(angle));
        CGPoint p1 = CGPointMake(p.x - diagonal, p.y + diagonal);
        CGPoint p2 = CGPointMake(p1.x - straightLint, p1.y);
        CGPoint points[] = {p,p1,p2};
        CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
        [HEXCOLOR(0xdd3561) set];
        CGContextDrawPath(ctx, kCGPathStroke);
        [self drawText:text context:ctx rect:CGRectMake(p2.x, p2.y-12, textW, textH)];
    }else if (angle > M_PI && angle <= M_PI*3/2){
        CGPoint p = CGPointMake(CenterX + radius*cos(angle), CenterY + radius*sin(angle));
        CGPoint p1 = CGPointMake(p.x - diagonal, p.y - diagonal);
        CGPoint p2 = CGPointMake(p1.x - straightLint, p1.y);
        CGPoint points[] = {p,p1,p2};
        CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
        [HEXCOLOR(0xdd3561) set];
        CGContextDrawPath(ctx, kCGPathStroke);
        [self drawText:text context:ctx rect:CGRectMake(p2.x, p2.y-12, textW, textH)];
    }else{
        CGPoint p = CGPointMake(CenterX + radius*cos(angle), CenterY + radius*sin(angle));
        CGPoint p1 = CGPointMake(p.x + diagonal, p.y - diagonal);
        CGPoint p2 = CGPointMake(p1.x + straightLint, p1.y);
        CGPoint points[] = {p,p1,p2};
        CGContextAddLines(ctx, points, sizeof(points)/sizeof(CGPoint));
        [HEXCOLOR(0xdd3561) set];
        CGContextDrawPath(ctx, kCGPathStroke);
        [self drawText:text context:ctx rect:CGRectMake(p2.x-textW, p2.y-12, textW, textH)];
    }
}

- (void)drawText:(NSString *)text context:(CGContextRef)ctx rect:(CGRect)rect{
    [[UIColor whiteColor] set];
    UIRectFill(rect);
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentCenter;
    
    [text drawInRect:rect withAttributes:@{
                                           NSFontAttributeName:[UIFont systemFontOfSize:10],
                                           NSForegroundColorAttributeName:HEXCOLOR(0x181818),
                                           NSParagraphStyleAttributeName:style
                                           }];
}


@end
