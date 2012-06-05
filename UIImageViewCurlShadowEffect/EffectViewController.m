//
//  EffectViewController.m
//  UIImageViewCurlShadowEffect
//
//  Created by Foyzul Karim on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EffectViewController.h"
#import "UIImageView.h"

@implementation EffectViewController
UIImageView *imageView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    imageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 202, 260)];
    UIImage* image = [UIImage imageNamed:@"67D4I6bxX-KCX0svkuOZ.png"];
    [imageView setImage:image borderWidth:3.0 shadowDepth:10.0 controlPointXOffset:30.0 controlPointYOffset:70.0];
    [self.view addSubview:imageView];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
