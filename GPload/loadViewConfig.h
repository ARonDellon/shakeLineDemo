//
//  loadViewConfig.h
//  GPload
//
//  Created by wangweiyi on 16/5/25.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface loadViewConfig : NSObject

+ (CGPoint)getPointWithPointOne:(CGPoint)pointOne
                   pointTwo:(CGPoint)pointTwo
            valueOfprogress:(CGFloat)progress;


+ (CGPoint)getAnchorWithPointOne:(CGPoint)pointOne
                        pointTwo:(CGPoint)pointTwo
                valueOfTprogress:(CGFloat)progress
                     shakeOption:(NSNumber *)option;

@end
