//
//  eraseImageViewController.m
//  eraseImage
//
//  Created by mr.scorpion on 2016/1/6.
//  Copyright 2016 mr.scorpion. All rights reserved.
//

#import "eraseImageViewController.h"

@implementation eraseImageViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 单指双击返回
    UITapGestureRecognizer *singleFingerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerTwo.numberOfTouchesRequired = 1;
    singleFingerTwo.numberOfTapsRequired = 2;
    singleFingerTwo.delegate = self;
    [self.view addGestureRecognizer:singleFingerTwo];
}

// diamiss animation
- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
    if(sender.numberOfTapsRequired == 2)
    {
         [self dismissViewControllerAnimated:YES completion:^{
             [self.imageView removeFromSuperview];
             self.imageView = nil;
         }];
    }
}
                                               
                                               
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if([touch view] == imageView)
	{
		canEarse = YES;
	}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if (canEarse)
	{
		CGPoint currentPoint = [touch locationInView:imageView];
		UIGraphicsBeginImageContext(self.imageView.frame.size);
		[imageView.image drawInRect:imageView.bounds];
		CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(currentPoint.x, currentPoint.y, 35, 35));
		imageView.image = UIGraphicsGetImageFromCurrentImageContext(); 
		UIGraphicsEndImageContext();
	}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	canEarse = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
	[imageView removeFromSuperview];
}
@end
