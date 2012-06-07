//
//  UIImageView.m
//  UIImageViewCurlShadowEffect
//
//  Created by Abdullah Md. Zubair on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//
//  UIImageViewBorder.m
//  CustomTableView
//
#import "QuartzCore/QuartzCore.h"

@interface UIImageView (private)
-(UIImage*)rescaleImage:(UIImage*)image;
-(void)setImage:(UIImage*)image withBorderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset;
-(CGPathRef)curlShadowPathWithShadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset;

@end

@implementation UIImageView (ImageViewBorder)

-(UIImage*)rescaleImage:(UIImage*)image{
    UIImage* scaledImage = image;
    
    CALayer* layer = self.layer;
    CGFloat borderWidth = layer.borderWidth;
    
    //if border is defined
    if (borderWidth > 0)
    {
        //rectangle in which we want to draw the image.
        CGRect imageRect = CGRectMake(0.0, 0.0, self.bounds.size.width - 2 * borderWidth,self.bounds.size.height - 2 * borderWidth);
        //Only draw image if its size is bigger than the image rect size.
        if (image.size.width > imageRect.size.width || image.size.height > imageRect.size.height)
        {
            UIGraphicsBeginImageContext(imageRect.size);
            [image drawInRect:imageRect];
            scaledImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }       
    }
    return scaledImage;
}

-(void)configureImageViewBorder:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset{
    CALayer* layer = [self layer];
    [layer setBorderWidth:borderWidth];
    [self setContentMode:UIViewContentModeCenter];
    [layer setBorderColor:[UIColor whiteColor].CGColor];
    [layer setShadowColor:[UIColor blackColor].CGColor];
    [layer setShadowOffset:CGSizeMake(0.0, 4.0)];
    [layer setShadowRadius:3.0];
    [layer setShadowOpacity:0.4];
    layer.shadowPath = [self curlShadowPathWithShadowDepth:shadowDepth
                                       controlPointXOffset:controlPointXOffset
                                       controlPointYOffset:controlPointYOffset];
    
}


-(CGPathRef)curlShadowPathWithShadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset
{
    
    CGSize viewSize = [self bounds].size;
    CGPoint polyTopLeft = CGPointMake(0.0, controlPointYOffset);
    CGPoint polyTopRight = CGPointMake(viewSize.width, controlPointYOffset);
    CGPoint polyBottomLeft = CGPointMake(0.0, viewSize.height + shadowDepth);
    CGPoint polyBottomRight = CGPointMake(viewSize.width, viewSize.height +  shadowDepth);
    
    CGPoint controlPointLeft = CGPointMake(controlPointXOffset , controlPointYOffset);
    CGPoint controlPointRight = CGPointMake(viewSize.width - controlPointXOffset,  controlPointYOffset);
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [path moveToPoint:polyTopLeft];
    [path addLineToPoint:polyTopRight];
    [path addLineToPoint:polyBottomRight];
    [path addCurveToPoint:polyBottomLeft
            controlPoint1:controlPointRight
            controlPoint2:controlPointLeft];
    
    [path closePath]; 
    return path.CGPath;
}


-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset
{
    self.backgroundColor = [UIColor lightGrayColor];
    [self configureImageViewBorder:borderWidth shadowDepth:shadowDepth controlPointXOffset:controlPointXOffset controlPointYOffset:controlPointYOffset];
    UIImage* scaledImage = [self rescaleImage:image];
    self.image = scaledImage;
}

@end