//
//  UIImageView.h
//  UIImageViewCurlShadowEffect
//
//  Created by Foyzul Karim on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UIImageView (ImageViewBorder)
-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowHeight controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset;
@end
