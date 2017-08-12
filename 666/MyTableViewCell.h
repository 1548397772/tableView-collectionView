//
//  MyTableViewCell.h
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(strong,nonatomic)MyModel *model;
@property(strong,nonatomic)NSString *name;

@property(strong,nonatomic)NSIndexPath *indexPath;
@property(nonatomic,assign)BOOL isStretch;
@end
