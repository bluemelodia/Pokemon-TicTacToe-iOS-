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
    NSLog(@"Ever come here");
    
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
    //    UITableViewCell *cell = [self.mutArray objectAtIndex:indexPath.row];
    
    GridCollectionViewCell *cell = (GridCollectionViewCell *) [self.gridView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@", indexPath);
    // turn 0 = Squirtle, turn 1 = Charmander
    if (turn == 0) { // squirtle's turn
        [cell setCellImageByState:1];
        NSLog(@"SQUIRTLE");
        turn = 1;
    } else { // charmander's turn
        [cell setCellImageByState:2];
        NSLog(@"CHARMANDER");
        turn = 0;
    }
}

- (IBAction)resetClicked:(id)sender {
    NSLog(@"HERE");
}

@end
