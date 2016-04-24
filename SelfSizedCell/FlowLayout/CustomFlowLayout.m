//
//  CustomFlowLayout.m
//  SelfSizedCell
//
//  Created by Qing-Cheng Li on 2016/4/24.
//  Copyright © 2016年 QCLS. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (void)prepareLayout
{
    // 1. Use the prepareLayout method to perform the up-front calculations needed to provide layout information

    // The prepareLayout method is your opportunity to perform whatever calculations are needed to determine the position of the cells and views in the layout. At a minimum, you should compute enough information in this method to be able to return the overall size of the content area, which you return to the collection view in step 2.
    NSLog(@"CustomFlowLayout - prepareLayout");
    [super prepareLayout];
}

- (CGSize)collectionViewContentSize
{
    // 2. Use the collectionViewContentSize method to return the overall size of the entire content area based on your inital calculation
    CGSize size = [super collectionViewContentSize];
    NSLog(@"CustomFlowLayout - collectionViewContentSize (%f, %f)", size.width, size.height);
//    return CGSizeMake(320.0f, 100.0f);
    return size;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 3. Use the layoutAttributesForElementsInRect: method to return the attributes for cells and views that are in the specified rectangle.
    NSLog(@"CustomFlowLayout - layoutAttributesForElementsInRect - rect (%f %f), (%f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    NSArray<UICollectionViewLayoutAttributes *> *attributes = [super layoutAttributesForElementsInRect:rect];

    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"    =attribute - %@", obj);
        // just a try to change attribute;
        /*
        CGRect frame = obj.frame;
        frame.size.height = 30.0f;
        obj.frame = frame;
        */
    }];
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"CustomFlowLayout - layoutAttributesForItemAtIndexPath - %d - %d", indexPath.section, indexPath.row);
    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    NSLog(@"    ~attribute - %@", attribute);
    return attribute;
}

@end
