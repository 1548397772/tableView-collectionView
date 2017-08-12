//
//  MyModel.m
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel


- (instancetype)initWithName:(NSString *)name mySubModels:(NSArray *)mySubModels
{
    if (self = [super init]) {
        self.name = name;
        self.mySubModels = mySubModels;
    }
    return self;
}

@end
