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
#import "CustomView.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CustomViewDelegate>
@property NSMutableArray *pictures;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

NSString* const kCell = @"CellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Picture* pic1 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"dodge"] andColor:[UIColor blueColor]];
    Picture* pic2 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"android apple"] andColor:[UIColor blueColor]];
    Picture* pic3 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"salad chick"] andColor:[UIColor blueColor]];
    Picture* pic4 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"SB"] andColor:[UIColor blueColor]];
    Picture* pic5 = [[Picture alloc]initWithImage:[UIImage imageNamed:@"sunguy"] andColor:[UIColor blueColor]];
    
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomView *test =[[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    test.delegate = self;
    test.path = indexPath;
    [self.view addSubview:test];

    //[self.view.frame]
    [self.view.subviews[3] setFrame:self.view.frame];
}

-(void)customViewDelegate:(CustomView *)view didPressButton:(UIButton *)button{
    [view removeFromSuperview];
    [self.collectionView cellForItemAtIndexPath:view.path].backgroundColor = button.backgroundColor;
}

@end
