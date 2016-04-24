//
//  JustOneLabelCell.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "JustOneLabelCell.h"

@implementation JustOneLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    UICollectionViewLayoutAttributes *attribute = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    NSLog(@"prefered (with nib) called, %@", attribute);

    // make a change
    CGRect frame = attribute.frame;
    frame.size.width = 170.0f;
    frame.size.height = 220.0f;
    attribute.frame = frame;
   
    // 70 x 120 --> nothing
    // 70 x 220 --> boom (at iphone 4 scree)
    // 170 x 220 --> 3rd cell will change position (at iphone 6 screen)
    return attribute;
}

@end
