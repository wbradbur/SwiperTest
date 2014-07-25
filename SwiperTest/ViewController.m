//
//  ViewController.m
//  SwiperTest
//
//  Created by Chase Bradbury on 7/23/14.
//  Copyright (c) 2014 Redwood Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self restartGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)restartGame
{
    direction = up;
    score = -1;
    time = 5;
    
    // Change this
    //highscore = 0;
    
    startButton.hidden = NO;
    scoreLabel.hidden = YES;
    genericLabel.hidden = YES;
}

- (IBAction)startGame
{
    startButton.hidden = YES;
    swipeControl.enabled = YES;
    arrowImage.hidden = NO;
    timeLabel.hidden = NO;
    scoreLabel.hidden = NO;
    highscoreLabel.hidden = YES;
    
    [self swipeAction];
    
    timeLabel.text = [NSString stringWithFormat:@"%i", time];
    
    [timer invalidate];
    timer = nil;
    
    [self setTimerFor:0.8f];
}

- (void)endGame
{
    swipeControl.enabled = NO;
    arrowImage.hidden = YES;
    timeLabel.hidden = YES;
    highscoreLabel.hidden = NO;
    genericLabel.hidden = NO;
    
    genericLabel.text = @"Game over!";
    
    [timer invalidate];
    timer = nil;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(changeHighscore)
                                           userInfo:nil
                                            repeats:NO];
}

- (void)changeHighscore
{
    if (score > highscore)
    {
        genericLabel.text = @"New highscore!";
        highscore = score;
        highscoreLabel.text = [NSString stringWithFormat:@"Highscore: %i", highscore];
        
        [timer invalidate];
        timer = nil;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(restartGame)
                                               userInfo:nil
                                                repeats:NO];
    }
    else
    {
        [self restartGame];
    }
    
}

- (IBAction)swipeAction
{
    time = 3;
    timeLabel.text = [NSString stringWithFormat:@"%i", time];
    
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", ++score];
    
    [timer invalidate];
    timer = nil;
    
    [self setTimerFor:0.8f];
    
    NSLog(@"Swiped.");
    
    // Get a random direction
    direction = arc4random() % 4;
    
    if (direction == up)
    {
        NSLog(@"Swipe up!");
        [swipeControl setDirection:UISwipeGestureRecognizerDirectionUp];
        arrowImage.image = [UIImage imageNamed:@"arrowUp"];
    }
    else if (direction == down)
    {
        NSLog(@"Swipe down!");
        [swipeControl setDirection:UISwipeGestureRecognizerDirectionDown];
        arrowImage.image = [UIImage imageNamed:@"arrowDown"];
    }
    else if (direction == left)
    {
        NSLog(@"Swipe left!");
        [swipeControl setDirection:UISwipeGestureRecognizerDirectionLeft];
        arrowImage.image = [UIImage imageNamed:@"arrowLeft"];
    }
    else
    {
        NSLog(@"Swipe right!");
        [swipeControl setDirection:UISwipeGestureRecognizerDirectionRight];
        arrowImage.image = [UIImage imageNamed:@"arrowRight"];
    }
    
}

- (void)countDown
{
    timeLabel.text = [NSString stringWithFormat:@"%i", --time];
    
    if (time == 0) {
        [self endGame];
    }
}

- (void)setTimerFor:(float)seconds
{
    timer = [NSTimer scheduledTimerWithTimeInterval:seconds/3
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
}

@end
