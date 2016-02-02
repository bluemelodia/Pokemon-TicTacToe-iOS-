//
//  GridCollectionViewCell.m
//  Connect3
//
//  Created by Melanie Lislie Hsu on 2/1/16.
//  Copyright © 2016 Melanie Lislie Hsu. All rights reserved.
//

#import "GridCollectionViewCell.h"

@implementation GridCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCellImageByState:(int) state {
    UIImage *image;
    if (state == 0) {
        image = [UIImage imageNamed:@"Pokeball.imageset"];
        [self.cellImage setImage:image];
        [self.cellImage setAlpha:0.2];
        self.userInteractionEnabled = YES;
    } else if (state == 1) {
        image = [UIImage imageNamed:@"Squirtle.imageset"];
        [self.cellImage setImage:image];
        [self.cellImage setAlpha:1];
        self.userInteractionEnabled = NO;
    } else {
        image = [UIImage imageNamed:@"Charmander.imageset"];
        [self.cellImage setImage:image];
        [self.cellImage setAlpha:1];
        self.userInteractionEnabled = NO;
    }
}

@end
