//
//  ViewController.m
//  Connect3
//
//  Created by Melanie Lislie Hsu on 2/1/16.
//  Copyright © 2016 Melanie Lislie Hsu. All rights reserved.
//

#import "ViewController.h"
#import "GridCollectionViewCell.h"

@interface ViewController () 

@end

@implementation ViewController {
    int tiles[9];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialize the tile states to empty
    for (int i = 0; i < 9; i++) {
        tiles[i] = Empty;
    }

    // change the transparency and tint to more closely match the Android version
    [self.backgroundImage setAlpha:0.5];
    self.gridImage.image = [self.gridImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.gridImage setTintColor:[UIColor whiteColor]];

    // prepare the collection view flow layout
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(100, 100);
    
    [self.gridView setCollectionViewLayout:flow];
    [self.gridView setBackgroundColor:[UIColor clearColor]];

    UINib *nib = [UINib nibWithNibName:@"GridCollectionViewCell" bundle:nil];
    [self.gridView registerNib:nib forCellWithReuseIdentifier:@"GridCollectionViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridCollectionViewCell *cell = [self.gridView dequeueReusableCellWithReuseIdentifier:@"GridCollectionViewCell" forIndexPath:indexPath];
    int state = tiles[indexPath.row];
    [cell setCellImageByState:state];
    if (state != 0) {
        cell.userInteractionEnabled = NO;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Click");
    GridCollectionViewCell *cell = (GridCollectionViewCell *) [self.gridView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@", indexPath);
    // turn 0 = Squirtle, turn 1 = Charmander
    if (turn == 0) { // squirtle's turn
        [cell setCellImageByState:1];
        tiles[indexPath.row] = Squirtle;
    } else { // charmander's turn
        [cell setCellImageByState:2];
        tiles[indexPath.row] = Charmander;
    }
    if (![self didWin]) {
        [self checkTurn];
    }
}

- (void)checkTurn {
    if (turn == 0) {
        turn = 1;
        [self.you setText:@"You are Charmander."];
        [self.whoseTurn setText:@"It is Charmander's turn."];
    } else {
        turn = 0;
        [self.you setText:@"You are Squirtle."];
        [self.whoseTurn setText:@"It is Squirtle's turn."];
    }
}

- (BOOL)didWin {
    /*
        Board layout:
        0 1 2
        3 4 5
        6 7 8
     */
    int winner = -1;
    if (tiles[0] == tiles[1] && tiles[1] == tiles[2] && tiles[0] != 0) {
        winner = tiles[0];
    } else if (tiles[3] == tiles[4] && tiles[4] == tiles[5] && tiles[3] != 0) {
        winner = tiles[3];
    } else if (tiles[6] == tiles[7] && tiles[7] == tiles[8] && tiles[6] != 0) {
        winner = tiles[6];
    } else if (tiles[0] == tiles[3] && tiles[3] == tiles[6] && tiles[0] != 0) {
        winner = tiles[0];
    } else if (tiles[1] == tiles[4] && tiles[4] == tiles[7] && tiles[1] != 0) {
        winner = tiles[1];
    } else if (tiles[2] == tiles[5] && tiles[5] == tiles[8] && tiles[2] != 0) {
        winner = tiles[2];
    } else if (tiles[0] == tiles[4] && tiles[4] == tiles[8] && tiles[0] != 0) {
        winner = tiles[0];
    } else if (tiles[2] == tiles[4] && tiles[4] == tiles[6] && tiles[2] != 0) {
        winner = tiles[2];
    }
    
    if (winner == 1) {
        NSLog(@"SQUIRTLE WINS");
        sScore++;
        NSString *squirtle = [NSString stringWithFormat:@"Squirtle: %d", sScore];
        [self.squirtleScore setText:squirtle];
        self.gridView.userInteractionEnabled = NO;
        return true;
    } else if (winner == 2) {
        NSLog(@"CHARMANDER WINS");
        cScore++;
        NSString *charmander = [NSString stringWithFormat:@"Charmander: %d", cScore];
        [self.charmanderScore setText:charmander];
        self.gridView.userInteractionEnabled = NO;
        return true;
    }
    
    // check if all positions filled
    BOOL hasZeroes = false;
    for (int i = 0; i < 9; i++) {
        if (tiles[i] == Empty) {
            hasZeroes = true;
        }
    }
    if (!hasZeroes) {
        NSLog(@"Tie!");
        return true;
    }
    
    return false;
}

- (IBAction)resetClicked:(id)sender {
    // erase the board
    NSArray *cells = [self.gridView visibleCells];
    for (GridCollectionViewCell *cell in cells) {
        [cell setCellImageByState:0];
    }
    for (int i = 0; i < 9; i++) {
        tiles[i] = Empty;
    }
    self.gridView.userInteractionEnabled = YES;
}

@end
