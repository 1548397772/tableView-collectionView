//
//  MyTableViewCell.m
//  666
//
//  Created by yuanhc on 2017/8/12.
//  Copyright © 2017年 萤火照星空. All rights reserved.
//

#import "MyTableViewCell.h"
#import "ListCollectionViewCell.h"

@interface MyTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)NSArray *categorys;
@end
static NSString *ListCollectionViewCellID = @"ListCollectionViewCellID";
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.myBtn setTitle:self.name forState:UIControlStateNormal];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ListCollectionViewCellID];
}

- (void)setName:(NSString *)name
{
    if (_name != name) {
        _name = name;
        [_myBtn setTitle:_name forState:UIControlStateNormal];
        [self layoutSubviews];
    }
}

- (void)setModel:(MyModel *)model
{
    if (_model != model) {
        _model = model;
        _categorys = model.mySubModels;
        [self.collectionView reloadData];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"ccc %lu",(unsigned long)self.categorys.count);
    return self.categorys.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width, 44);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ListCollectionViewCellID forIndexPath:indexPath];
    NSLog(@"xxx %ld",(long)indexPath.item);
    MySubModel *subModel = self.categorys[indexPath.item];
    cell.myLabel.text = subModel.title;
    cell.myLabel1.text = subModel.detail;
//    cell.myLabel.text = self.categorys[indexPath.item];
    return cell;
}

- (IBAction)tapBtn:(UIButton *)sender {
    
     _isStretch = (_isStretch && ( _model.name != _name)) ?_isStretch : !_isStretch;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellNotice" object:nil userInfo:@{@"indexPath":self.indexPath,@"isStretch":@(_isStretch)}];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.hidden = !self.isStretch;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
