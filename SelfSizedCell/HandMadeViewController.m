//
//  HandMadeViewController.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "HandMadeViewController.h"
#import "HandMadeOneLabelCell.h"
#import "JustOneLabelCell.h"
#import "CustomFlowLayout.h"

@interface HandMadeViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HandMadeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    self.title = @"純手工";
    self.view.backgroundColor = [UIColor redColor];

//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CustomFlowLayout *flowLayout = [[CustomFlowLayout alloc] init];
    
    // If it didn't implement UICollectionViewFlowLayoutDelegate, cell size will be itemSize
    flowLayout.itemSize = CGSizeMake(100.0f, 50.0f);

    // If given estimatedItemSize, then cell with nib will use nib file's size,
    //flowLayout.estimatedItemSize = CGSizeMake(200.0f, 100.0f);

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;

    // register cells
    UINib *cellNib = [UINib nibWithNibName:@"JustOneLabelCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"JustOneLabelCell"];
    
    [self.collectionView registerClass:[HandMadeOneLabelCell class] forCellWithReuseIdentifier:@"HandMadeOneLabelCell"];

    self.collectionView.dataSource = self;
    
    
    [self.view addSubview:self.collectionView];

    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
   
    [NSLayoutConstraint activateConstraints:@[leading, top, bottom, trailing]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"numberOfSectionsInCollectionView");
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"numberOfItemsInSection");
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForItemAtIndexPath - %d - %d", indexPath.section, indexPath.row);
    NSString *identifier = @"JustOneLabelCell";
    switch (indexPath.section) {
        case 0:
            identifier = @"HandMadeOneLabelCell";
            break;
            
        default:
            break;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    if ([cell isKindOfClass:[JustOneLabelCell class]]) {
        JustOneLabelCell *item = (JustOneLabelCell *)cell;
        item.titleLabel.text = @"With .nib";
    } else if ([cell isKindOfClass:[HandMadeOneLabelCell class]]) {
        HandMadeOneLabelCell *item = (HandMadeOneLabelCell *)cell;
        item.titleLabel.text = @"Hand made!";
    }
    return cell;
}

@end
