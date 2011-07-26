//
//  BijinTokeiCloneViewController.m
//  BijinTokeiClone
//
//  Created by プー坊 on 11/07/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BijinTokeiCloneViewController.h"

@interface BijinTokeiCloneViewController (Private)
- (void)viewImage:(NSDate *)date;
@end

@implementation BijinTokeiCloneViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    //timeLabel.font = [UIFont fontWithName:@"DB LCD Temp Black" size:48.0f];
    [self viewImage:[NSDate date]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Private methods

- (void)viewImage:(NSDate *)date
{
    UIImage *image = [UIImage imageNamed:@"0000.png"];
    if (image == nil) {
        image = [UIImage imageNamed:@"base01.png"];
    }
    imageView.image = image;
}

@end
