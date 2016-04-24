//
//  HandMadeOnelLabelCell.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "HandMadeOneLabelCell.h"

@implementation HandMadeOneLabelCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"HnadMadeOneLabelCell initWithCoder called, %@", self);
        [self setupComponents];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"HnadMadeOneLabelCell initWithFrame called, %@", self);
        [self setupComponents];
    }
    return self;
}

- (void)dealloc
{
    self.titleLabel = nil;
}

- (void)setupComponents
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"test";
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];

    NSLayoutConstraint *leftMarginConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20.0f];

    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];

    [NSLayoutConstraint activateConstraints:@[leftMarginConstraint, centerYConstraint]];
}

@end
