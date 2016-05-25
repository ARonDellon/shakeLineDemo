//
//  loadViewConfig.m
//  GPload
//
//  Created by wangweiyi on 16/5/25.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "loadViewConfig.h"

@implementation loadViewConfig


+ (CGPoint)getPointWithPointOne:(CGPoint)pointOne
                   pointTwo:(CGPoint)pointTwo
            valueOfprogress:(CGFloat)progress {
    CGFloat nowX;
    CGFloat nowY;
    if (fabs(pointOne.x-pointTwo.x)) {
        CGFloat distanceX = pointTwo.x-pointOne.x;
        nowX = distanceX*progress+pointOne.x;
        nowY = [self getYwithPointOne:pointOne pointTwo:pointTwo x:nowX];
    }else {
        CGFloat distanceY = pointTwo.y-pointOne.y;
        nowX = pointOne.x;
        nowY = distanceY*progress+pointOne.y;
    }


    return CGPointMake(nowX, nowY);
}


+ (CGPoint)getAnchorWithPointOne:(CGPoint)pointOne
                        pointTwo:(CGPoint)pointTwo
                valueOfTprogress:(CGFloat)progress
                     shakeOption:(NSNumber *)option{

    CGFloat e = (exp(-5*progress)*cos(100*progress));
    CGFloat distancPow = pow(e, 2);
    CGPoint center = CGPointMake((pointOne.x+pointTwo.x)/2, (pointTwo.y+pointOne.y)/2);
    CGFloat fator = 1;
    switch (option.integerValue) {
        case 0:{
            return center;
        }break;
        case -1:{
            fator = -1;
        }break;
        case 1:{
            fator = 1;
        }break;

        default:
            break;
    }

    if (progress == 0) {
        e = 0;
        distancPow = 0;
    }

    if (fabs(pointOne.y-pointTwo.y)){
        CGFloat k = -(pointOne.x-pointTwo.x)/(pointOne.y-pointTwo.y);
        CGFloat m = center.y - k*center.x;
//        CGFloat b = m - center.y;
//        CGFloat p = k*b - center.x;
//        CGFloat s = distancPow*100 - pow(b, 2) - pow(center.x, 2);
//        CGFloat t = 1+pow(k, 2);
//        CGFloat w = s + pow(p, 2)/t;
        CGFloat cosD = 1/sqrt(1+pow(k, 2));

        CGFloat nowX = center.x+fator*cosD*10*sqrt(distancPow);
        CGFloat nowY = k * nowX + m;
        
        return CGPointMake(nowX, nowY);
    }



    CGFloat nowX = center.x;
    CGFloat nowY = center.y+7*e*fator;



    return CGPointMake(nowX, nowY);
}





+ (CGFloat)getYwithPointOne:(CGPoint)pointOne pointTwo:(CGPoint)pointTwo x:(CGFloat)x{
    CGFloat y ;
    CGFloat k ;

    k = (pointOne.y-pointTwo.y)/(pointOne.x-pointTwo.x);

    y = (x-pointOne.x)*k+pointOne.y;
    return y;
}



@end
