//
//  ballLoad.h
//  GPload
//
//  Created by wangweiyi on 15/12/18.
//  Copyright © 2015年 wangweiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "loadViewConfig.h"

@interface ballLoad : UIView


+ (ballLoad *)shareBall;

- (void)start;
- (void)stop;

/**
 *  all start point of lines in this array ,user NSStringFromPoint(CGPoint) change
 *  the CGPoint to NSString , then put them in this array in order
 *
 *  @param linesArr start point array
 */
- (void)setStartPointArr:(NSArray<NSString *> *)linesArr;


/**
 *  all end point of lines in this array ,user NSStringFromPoint(CGPoint) change
 *  the CGPoint to NSString , then put them in this array in order
 *
 *  @param linesArr end point array
 */
- (void)setEndPointArr:(NSArray<NSString *> *)linesArr;

/**
 *  set the option at the opposite position in shake array
 *  1  : shake nomal
 *  -1 : shake reversed
 *  0  : do not shake
 *  @param shakeArr NSNumber in this array 
 */
- (void)setShakeLineOption:(NSArray<NSNumber *> *)shakeArr;

@end
