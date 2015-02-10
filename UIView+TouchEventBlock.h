//
//  UIView+TouchEventBlock.h
//
//  Created by Doluvor on 15/2/10.
//  Copyright (c) 2015年 Doluvor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchesBeganBlock)(NSSet *touches, UIEvent *event);
typedef void (^TouchesOutsideBlock)(CGPoint point, UIEvent *event);

@interface UIView (TouchEventBlock)

@property (nonatomic, copy) TouchesBeganBlock touchesBeganBlock;
@property (nonatomic, copy) TouchesOutsideBlock touchesOutsideBlock;

@end
