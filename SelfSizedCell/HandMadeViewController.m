//
//  HandMadeViewController.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "HandMadeViewController.h"

@interface HandMadeViewController ()

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

    
}

@end
