//
//  ballLoad.m
//  GPload
//
//  Created by wangweiyi on 15/12/18.
//  Copyright © 2015年 wangweiyi. All rights reserved.
//

#import "ballLoad.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kKeyWindow [UIApplication sharedApplication].keyWindow


@interface ballLoad()


@property (nonatomic) CGFloat progress;
@property (nonatomic) CGFloat animationProgress;
@property (nonatomic,strong)CADisplayLink *displayLink;
@property (nonatomic,strong)NSArray *startArr;
@property (nonatomic,strong)NSArray *endArr;
@property (nonatomic,strong)NSArray *shakeOptionArr;

@end

@implementation ballLoad


+ (ballLoad *)shareBall{
    static dispatch_once_t pre;
    static ballLoad * shareInstance;
    dispatch_once(&pre, ^{
        shareInstance = [[ballLoad alloc]initWithFrame:CGRectMake(0, 350, 300, 200)];
    });

    return shareInstance;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.center = kKeyWindow.center;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        _progress = 0;
        _animationProgress = 0;
    }
    return self;
}

- (void)start{
    
    self.displayLink.paused = NO;
}

- (void)stop{
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = nil;
    _progress = 0;
    _animationProgress = 0;
    [self setNeedsDisplay];
}

- (void)startAnimation {
    if (_progress>=1) {
        _animationProgress += 0.02;
        if (_animationProgress>=1) {
            _animationProgress = 0;
        }
    }else{
        _progress += 0.04;
    }

    [self setNeedsDisplay];
}

- (void)setStartPointArr:(NSArray<NSString *> *)linesArr {
    self.startArr = [NSArray arrayWithArray:linesArr];
}

- (void)setEndPointArr:(NSArray<NSString *> *)linesArr {
    self.endArr = [NSArray arrayWithArray:linesArr];
}

- (void)setShakeLineOption:(NSArray<NSNumber *> *)shakeArr {
    self.shakeOptionArr = [NSArray arrayWithArray:shakeArr];
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    [self drawWithContext:myContext];
}

- (void)drawWithContext:(CGContextRef)context{

    CGContextRotateCTM(context, M_PI);
    CGContextScaleCTM(context, -1, 1);
    CGContextTranslateCTM(context,100, -150);

    [[UIColor redColor] setStroke];

    for (int i = 0; i < self.startArr.count ; i ++) {
        id startObject = self.startArr[i];
        id endObject = self.endArr[i];
        id shakeOption = [NSNumber numberWithInt:0];
        if (i < self.shakeOptionArr.count) {
            shakeOption = self.shakeOptionArr[i];
        }
        if ([startObject isKindOfClass:[NSString class]]&&[endObject isKindOfClass:[NSString class]]) {
            CGPoint startP = CGPointFromString(startObject);
            CGPoint endP = CGPointFromString(endObject);
            CGPoint point1 = [loadViewConfig getPointWithPointOne:startP
                                                         pointTwo:endP
                                                  valueOfprogress:_progress];
            CGPoint controll1 = [loadViewConfig getAnchorWithPointOne:startP
                                                             pointTwo:endP
                                                     valueOfTprogress:_animationProgress
                                                          shakeOption:shakeOption];

            UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
            bezierPath1.lineWidth = _progress?3:0;
            bezierPath1.lineCapStyle = kCGLineCapRound;
            [bezierPath1 moveToPoint:startP];
            [bezierPath1 addCurveToPoint:point1
                           controlPoint1:!_animationProgress?point1:controll1
                           controlPoint2:!_animationProgress?point1:controll1];
            [bezierPath1 stroke];
        }
    }



}


- (NSArray *)startArr {
    if (!_startArr) {
        _startArr = @[];
    }
    return _startArr;
}

- (NSArray *)endArr {
    if (!_endArr) {
        _endArr = @[];
    }
    return _endArr;
}

- (NSArray *)shakeOptionArr {
    if (!_shakeOptionArr) {
        _shakeOptionArr = @[];
    }
    return _shakeOptionArr;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startAnimation)];
        _displayLink.paused = YES;
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

@end
