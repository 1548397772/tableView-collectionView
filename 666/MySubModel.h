//
//  MySubModel.h
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySubModel : NSObject
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *detail;
- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail;
@end
