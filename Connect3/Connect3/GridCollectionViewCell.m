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
        [UIImage imageNamed:@"Pokeball.imageset"];
        [self.cellImage setImage:image];
    } else if (state == 1) {
        [UIImage imageNamed:@"Squirtle.imageset"];
        [self.cellImage setImage:image];
    } else {
        [UIImage imageNamed:@"Charmander.imageset"];
        [self.cellImage setImage:image];
    }
}

@end
