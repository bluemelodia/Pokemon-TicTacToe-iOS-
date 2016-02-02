//
//  ViewController.h
//  Connect3
//
//  Created by Melanie Lislie Hsu on 2/1/16.
//  Copyright © 2016 Melanie Lislie Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

enum tileStates {
    Empty = 0,
    Squirtle = 1,
    Charmander = 2
};

static int squirtleScore = 0;
static int charmanderScore = 0;
static int turn = 0;
static int gameOver = 0;

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *squirtleScore;
@property (weak, nonatomic) IBOutlet UILabel *charmanderScore;
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;
@property (weak, nonatomic) IBOutlet UIImageView *gridImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *you;
@property (weak, nonatomic) IBOutlet UILabel *whoseTurn;

@end

