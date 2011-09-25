//
//  BijinTokeiCloneViewController.m
//  BijinTokeiClone
//
//  Created by プー坊 on 11/07/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "BijinTokeiCloneViewController.h"

#import "BaseImage.h"

@interface BijinTokeiCloneViewController (Private)
- (void)updateHours:(NSString *)hours minutes:(NSString *)minutes;
@end

@implementation BijinTokeiCloneViewController

- (void)dealloc
{
    [_currentTime release], _currentTime = nil;

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Timer

- (void)updateTime:(NSTimer*)timer {
    NSDate *now = [NSDate date];

    NSString *hours;
    NSString *minutes;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    hours = [formatter stringFromDate:now];
    [formatter setDateFormat:@"mm"];
    minutes = [formatter stringFromDate:now];
    [formatter release];

    //NSLog(@"hours: %@, minutes: %@", hours, minutes);

    NSString *nowTime = [NSString stringWithFormat:@"%@%@", hours, minutes];
    if ([_currentTime isEqual:nowTime] == NO)
    {
        [_currentTime release], _currentTime = [nowTime retain];
        [self updateHours:hours minutes:minutes];
    }
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    //timeLabel.font = [UIFont fontWithName:@"DB LCD Temp Black" size:48.0f];
    //timeLabel.font = [UIFont fontWithName:@"Courier Bold" size:48.0f]; //等幅フォント

    srand([[NSDate date] timeIntervalSinceReferenceDate]);
    _isViewFirst = YES;

    [self updateTime:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.5f
                                     target:self
                                   selector:@selector(updateTime:)
                                   userInfo:nil
                                    repeats:YES];

    //コロン点滅
    CAKeyframeAnimation *blinkAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    blinkAnimation.duration = 1.0f;
    blinkAnimation.repeatCount = FLT_MAX;
    blinkAnimation.values = [[[NSArray alloc] initWithObjects:
                              [NSNumber numberWithFloat:1.0f],
                              [NSNumber numberWithFloat:0.0f],
                              [NSNumber numberWithFloat:1.0f],
                              nil] autorelease];
    [colonLabel.layer addAnimation:blinkAnimation forKey:@"blink"];
}


- (void)viewDidUnload
{
    [_currentTime release], _currentTime = nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Private methods

- (void)updateHours:(NSString *)hours minutes:(NSString *)minutes
{
    //NSLog(@"updateHours: %@ minutes: %@", hours, minutes);

    hoursLabel.text = hours;
    minutesLabel.text = minutes;

    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@.png", hours, minutes]];
    if (image == nil) {
        image = [BaseImage nextImage];
    }

    UIViewAnimationOptions transitions[] = {
        UIViewAnimationOptionTransitionFlipFromLeft,
        UIViewAnimationOptionTransitionFlipFromRight,
        UIViewAnimationOptionTransitionCurlUp,
        UIViewAnimationOptionTransitionCurlDown};
    NSUInteger transitionIndex = (int)(rand()*(4.0)/(1.0+RAND_MAX));

    UIImageView *fromImageView = _isViewFirst ? firstImageView : secondImageView;
    UIImageView *toImageView = _isViewFirst ? secondImageView : firstImageView;
    toImageView.image = image;
    [UIView transitionFromView:fromImageView
                        toView:toImageView
                      duration:1.0f
                       options:transitions[transitionIndex]
                    completion:nil];
    [self.view bringSubviewToFront:boardView];
    _isViewFirst = !_isViewFirst;
}

@end
