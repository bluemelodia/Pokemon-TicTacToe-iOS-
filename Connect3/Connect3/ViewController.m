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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Ever come here");
    
    // change the transparency and tint to more closely match the Android version
    [self.backgroundImage setAlpha:0.5];
    self.gridImage.image = [self.gridImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.gridImage setTintColor:[UIColor whiteColor]];

    // prepare the collection view flow layout
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
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
    NSLog(@"Click");
    [cell setBackgroundColor:[UIColor redColor]];
    /*DrugCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DrugCollectionViewCell" forIndexPath:indexPath];
    [cell setImage:[medArray objectAtIndex:indexPath.row]];
    cell.layer.borderColor = [[UIColor clearColor]CGColor];
    
    if (products != nil) {
        NSArray *_drugIDs = [NovartisUtils getValue:[products valueForKey:@"product-id"] default:@[]];
        if (indexPath.row >= [_drugIDs count]) {
            [cell setProductLabel:@""];
            [cell setCellType:MenuCellType];
        } else {
            NSArray *_drugPrescription = [[NovartisUtils getValue:[products valueForKey:@"prescription_label_title"] default:@[]] mutableCopy];
            NSString *drugLabel = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"\u24D8 %@\n", [NovartisUtils getValue:[_drugPrescription objectAtIndex:indexPath.row] default:@"Full Prescribing Info"]]];
            if ([drugLabel containsString:@"Warning"]) {
                drugLabel = [drugLabel stringByReplacingOccurrencesOfString:@"Warning" withString:@"WARNING"];
            }
            [cell setProductLabel:drugLabel];
            [cell setCellType:RegularCellType];
            [cell setProductID:[_drugIDs objectAtIndex:indexPath.row]];
        }
        [cell setCellDelegate:self];
    }
    
    return cell;*/
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /*if (indexPath.row == [medArray count]-2) {
        [self openPracticeResources];
    } else if (indexPath.row == [medArray count]-1) {
        [self openInbox];
    }*/
}

- (IBAction)resetClicked:(id)sender {
    NSLog(@"HERE");
}

@end
