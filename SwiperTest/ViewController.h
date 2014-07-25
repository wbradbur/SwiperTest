//
//  ViewController.h
//  SwiperTest
//
//  Created by Chase Bradbury on 7/23/14.
//  Copyright (c) 2014 Redwood Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    up,
    down,
    left,
    right
} RSDirection;

@interface ViewController : UIViewController
{
    IBOutlet UIButton *startButton;
    IBOutlet UIImageView *arrowImage;
    IBOutlet UISwipeGestureRecognizer *swipeControl;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *highscoreLabel;
    IBOutlet UILabel *genericLabel;
    
    RSDirection direction;
    NSInteger score;
    NSInteger highscore;
    NSInteger timeMax;
    NSInteger time;
    NSTimer *timer;
}

- (IBAction)startGame;

- (IBAction)swipeAction;

@end
