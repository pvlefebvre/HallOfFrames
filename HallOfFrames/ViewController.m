//
//  ViewController.m
//  HallOfFrames
//
//  Created by Paul Lefebvre on 6/2/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"
#import "PictureCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property NSMutableArray *pictures;
@end

@implementation ViewController

NSString* const kCell = @"CellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Picture* pic1 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"dodge"] andColor:[UIColor blueColor]];
    Picture* pic2 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"android apple"] andColor:[UIColor blueColor]];
    Picture* pic3 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"salad chick"] andColor:[UIColor blueColor]];
    Picture* pic4 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"SB"] andColor:[UIColor blackColor]];
    Picture* pic5 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"sunguy"] andColor:[UIColor blackColor]];
    
    self.pictures = [[NSMutableArray alloc]initWithObjects:pic1, pic2, pic3, pic4, pic5, nil];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    Picture* pic = [self.pictures objectAtIndex:indexPath.row];
    cell.pictureImageView.image = pic.image;
    cell.backgroundColor = pic.frameColor;
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

@end
