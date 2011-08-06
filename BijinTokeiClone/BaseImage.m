//
//  BaseImage.m
//  BijinTokeiClone
//
//  Created by プー坊 on 11/08/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseImage.h"


@implementation BaseImage

static int _index = -1;

+ (UIImage *)nextImage
{
    _index ++;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"base%02d.png", _index]];
    if (image == nil) {
        _index = 0;
        image = [UIImage imageNamed:[NSString stringWithFormat:@"base%02d.png", _index]];
    }
    return image;
}

@end
