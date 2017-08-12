//
//  MyModel.h
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MySubModel.h"
@interface MyModel : NSObject
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSArray *mySubModels;
- (instancetype)initWithName:(NSString *)name mySubModels:(NSArray *)mySubModels;
@end
