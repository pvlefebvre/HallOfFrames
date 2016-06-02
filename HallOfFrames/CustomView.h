//
//  CustomView.h
//  HallOfFrames
//
//  Created by Paul Lefebvre on 6/2/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomView;

@protocol CustomViewDelegate <NSObject>

@optional

-(void)customViewDelegate:(CustomView*)view didPressButton:(UIButton*)button;

@end
@interface CustomView : UIView
@property (nonatomic,weak) id<CustomViewDelegate> delegate;

@end
