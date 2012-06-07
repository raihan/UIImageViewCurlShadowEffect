//
//  UIImageView.h
//  UIImageViewCurlShadowEffect
//
//  Created by Abdullah Md. Zubair on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UIImageView (ImageViewBorder)
-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowHeight controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset;
@end
