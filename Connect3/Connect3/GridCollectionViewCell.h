//
//  GridCollectionViewCell.h
//  Connect3
//
//  Created by Melanie Lislie Hsu on 2/1/16.
//  Copyright © 2016 Melanie Lislie Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

- (void)setCellImageByState:(int) state;

@end
