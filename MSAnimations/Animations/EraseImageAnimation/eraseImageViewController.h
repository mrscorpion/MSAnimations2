//
//  eraseImageViewController.h
//  eraseImage
//
//  Created by mr.scorpion on 2016/1/6.
//  Copyright 2016 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eraseImageViewController : UIViewController
<
UIGestureRecognizerDelegate
>
{
	IBOutlet UIImageView *imageView;
	BOOL canEarse;
}
@property (nonatomic, retain) UIImageView *imageView;
@end

