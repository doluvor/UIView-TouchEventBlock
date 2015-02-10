//
//  UIView+TouchEventBlock.m
//
//  Created by Doluvor on 15/2/10.
//  Copyright (c) 2015年 Doluvor. All rights reserved.
//

#import "UIView+TouchEventBlock.h"
#import <objc/runtime.h>

static const void *TouchesBeganBlockKey = &TouchesBeganBlockKey;
static const void *TouchesOutsideBlockKey = &TouchesOutsideBlockKey;

@implementation UIView (TouchEventBlock)

@dynamic touchesBeganBlock;
@dynamic touchesOutsideBlock;

- (void)setTouchesBeganBlock:(TouchesBeganBlock)touchesBeganBlock {
    objc_setAssociatedObject(self, TouchesBeganBlockKey, touchesBeganBlock, OBJC_ASSOCIATION_COPY);
}

- (TouchesBeganBlock)touchesBeganBlock {
    return objc_getAssociatedObject(self, TouchesBeganBlockKey);
}

- (void)setTouchesOutsideBlock:(TouchesOutsideBlock)touchesOutsideBlock {
    objc_setAssociatedObject(self, TouchesOutsideBlockKey, touchesOutsideBlock, OBJC_ASSOCIATION_COPY);
}

- (TouchesOutsideBlock)touchesOutsideBlock {
    return objc_getAssociatedObject(self, TouchesOutsideBlockKey);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    TouchesBeganBlock block = self.touchesBeganBlock;
    
    if (block != NULL)
        block(touches, event);
}

@end
