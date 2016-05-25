//
//  ViewController.m
//  GPload
//
//  Created by wangweiyi on 15/12/18.
//  Copyright © 2015年 wangweiyi. All rights reserved.
//

#import "ViewController.h"
#import "ballLoad.h"

@interface ViewController ()

@property (nonatomic,strong)ballLoad *ball;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *startP1 = NSStringFromCGPoint(CGPointMake(0, 37));
    NSString *endP1 = NSStringFromCGPoint(CGPointMake(32, 58));
    NSNumber *option1 = [NSNumber numberWithInt:-1];

    NSString *startP2 = NSStringFromCGPoint(CGPointMake(32, 58));
    NSString *endP2 = NSStringFromCGPoint(CGPointMake(64, 37));
    NSNumber *option2 = [NSNumber numberWithInt:1];

    NSString *startP3 = NSStringFromCGPoint(CGPointMake(8, 40));
    NSString *endP3 = NSStringFromCGPoint(CGPointMake(8, 0));
    NSNumber *option3 = [NSNumber numberWithInt:-1];

    NSString *startP4 = NSStringFromCGPoint(CGPointMake(20, 28));
    NSString *endP4 = NSStringFromCGPoint(CGPointMake(33, 28));
    NSNumber *option4 = [NSNumber numberWithInt:0];

    NSString *startP5 = NSStringFromCGPoint(CGPointMake(40, 28));
    NSString *endP5 = NSStringFromCGPoint(CGPointMake(56, 28));
    NSNumber *option5 = [NSNumber numberWithInt:0];

    NSString *startP6 = NSStringFromCGPoint(CGPointMake(38, 43));
    NSString *endP6 = NSStringFromCGPoint(CGPointMake(38, 0));
    NSNumber *option6 = [NSNumber numberWithInt:0];

    NSString *startP7 = NSStringFromCGPoint(CGPointMake(15, 0));
    NSString *endP7 = NSStringFromCGPoint(CGPointMake(58, 0));
    NSNumber *option7 = [NSNumber numberWithInt:1];

    NSArray *startArr = @[startP1,startP2,startP3,startP4,startP5,startP6,startP7];
    NSArray *endArr = @[endP1,endP2,endP3,endP4,endP5,endP6,endP7];
    NSArray *optionArr = @[option1,option2,option3,option4,option5,option6,option7];

    [self.ball setStartPointArr:startArr];
    [self.ball setEndPointArr:endArr];
    [self.ball setShakeLineOption:optionArr];
    [self.view addSubview:self.ball];


        // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(UIButton *)sender {
    [_ball start];

}

- (IBAction)stop:(id)sender{
    [_ball stop];
}


- (ballLoad *)ball {
    if (!_ball) {
        _ball = [ballLoad shareBall];
    }
    return _ball;
}

@end
