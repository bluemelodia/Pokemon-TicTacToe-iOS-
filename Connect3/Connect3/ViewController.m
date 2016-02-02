//
//  ViewController.m
//  Connect3
//
//  Created by Melanie Lislie Hsu on 2/1/16.
//  Copyright © 2016 Melanie Lislie Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
}

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


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetClicked:(id)sender {
    NSLog(@"HERE");
}

@end
