//
//  MySubModel.m
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "MySubModel.h"

@implementation MySubModel
- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail
{
    if (self = [super init]) {
        self.title = title;
        self.detail = detail;
    }
    return self;
}
@end
