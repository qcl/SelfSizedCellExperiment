//
//  ViewController.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "ViewController.h"

#import "JustOneLabelCell.h"
#import "HandMadeOneLabelCell.h"
#import "CustomFlowLayout.h"
#import "HandMadeViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    self.title = @"Self Sized Cell";
    self.collectionView.backgroundColor = [UIColor whiteColor];

    CustomFlowLayout *flowLayout = [[CustomFlowLayout alloc] init];
    
    // register cells
    UINib *cellNib = [UINib nibWithNibName:@"JustOneLabelCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"JustOneLabelCell"];

    [self.collectionView registerClass:[HandMadeOneLabelCell class] forCellWithReuseIdentifier:@"HandMadeOneLabelCell"];

    // use customed flow layout
    self.collectionView.collectionViewLayout = flowLayout;
    
    // setup collection view
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"numberOfSectionsInCollectionView");
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"numberOfItemsInSection");
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForItemAtIndexPath - %d - %d", indexPath.section, indexPath.row);
    NSString *identifier = @"JustOneLabelCell";
    switch (indexPath.row) {
        case 2:
            identifier = @"HandMadeOneLabelCell";
            break;
            
        default:
            break;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    cell.backgroundColor = [UIColor grayColor];
    
    if ([cell isKindOfClass:[JustOneLabelCell class]]) {
        JustOneLabelCell *item = (JustOneLabelCell *)cell;
        switch (indexPath.row) {
            case 0:
                item.titleLabel.text = @"View controller without nib";
                break;
            case 1:
                item.titleLabel.text = @"View conroller with nib";
                break;
            default:
                break;
        }
    } else if ([cell isKindOfClass:[HandMadeOneLabelCell class]]) {
        HandMadeOneLabelCell *item = (HandMadeOneLabelCell *)cell;
        item.titleLabel.text = @"Hand made!";
    }
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"sizeForItemAtIndexPath - %d - %d", indexPath.section, indexPath.row);
    return CGSizeMake(collectionView.frame.size.width, 50.0f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            break;
        }
        case 1: {
            break;
        }
        case 2: {
            HandMadeViewController *hmvc = [[HandMadeViewController alloc] init];
            [self.navigationController pushViewController:hmvc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
