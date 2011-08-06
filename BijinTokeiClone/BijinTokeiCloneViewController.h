//
//  BijinTokeiCloneViewController.h
//  BijinTokeiClone
//
//  Created by プー坊 on 11/07/25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BijinTokeiCloneViewController : UIViewController {
    NSString *_currentTime;
    BOOL _isViewFirst;

    IBOutlet UIImageView *firstImageView;
    IBOutlet UIImageView *secondImageView;
    IBOutlet UIView *boardView;
    IBOutlet UILabel *hoursLabel;
    IBOutlet UILabel *minutesLabel;
    IBOutlet UILabel *colonLabel;
}

@end
