//
//  Picture.m
//  HallOfFrames
//
//  Created by Paul Lefebvre on 6/2/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import "Picture.h"

@implementation Picture
-(instancetype)initWithImage:(UIImage*)image andColor:(UIColor*)color{
    self = [super init];
    if (self) {
        self.image = image;
        self.frameColor = color;
    }
    return self;
}

@end
