//
//  ViewController.m
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "MyModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *lastStretchRow;
    NSIndexPath *stretchRow;
    BOOL isStretch;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *data;
@end
static NSString *MyTableViewCellID = @"MyTableViewCellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotice:) name:@"cellNotice" object:nil];
    
    MySubModel *subModel1 = [[MySubModel alloc]initWithTitle:@"title1" detail:@"detail1"];
    MySubModel *subModel2 = [[MySubModel alloc]initWithTitle:@"title2" detail:@"detail2"];
    MySubModel *subModel3 = [[MySubModel alloc]initWithTitle:@"title3" detail:@"detail3"];
    MySubModel *subModel4 = [[MySubModel alloc]initWithTitle:@"title4" detail:@"detail4"];
    MySubModel *subModel5 = [[MySubModel alloc]initWithTitle:@"title5" detail:@"detail5"];
    
    MyModel *model1 = [[MyModel alloc]initWithName:@"section0" mySubModels:@[subModel1,subModel2,subModel3]];
    MyModel *model2 = [[MyModel alloc]initWithName:@"section1" mySubModels:@[subModel2,subModel3,subModel4,subModel5]];
    
    self.data = @[model1,model2];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:MyTableViewCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCellID];
    MyModel *model = self.data[indexPath.section];
    cell.name = model.name;
    cell.indexPath = indexPath;
    if (stretchRow != nil && indexPath.section == stretchRow.section && indexPath.row == stretchRow.row && isStretch) {
        cell.model = model;
        cell.isStretch = YES;
    }else {
        cell.isStretch = NO;
    }
    
    
    return cell;
}

- (void)receiveNotice:(NSNotification *)notice
{
    stretchRow = [notice.userInfo objectForKey:@"indexPath"];
    isStretch = [[notice.userInfo objectForKey:@"isStretch"] boolValue];
    NSArray *indexPaths = (lastStretchRow == nil || (lastStretchRow.section == stretchRow.section && lastStretchRow.row == stretchRow.row)) ? @[stretchRow] : @[lastStretchRow, stretchRow];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    lastStretchRow = stretchRow;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (stretchRow != nil && indexPath.section == stretchRow.section && indexPath.row == stretchRow.row && isStretch) {
       MyModel *model = self.data[indexPath.section];
        return model.mySubModels.count * 44 + 44;
    }else{
        return 44;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
