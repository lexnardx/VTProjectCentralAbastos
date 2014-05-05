//
//  VTInfoViewController.h
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMSections.h"

@interface VTInfoViewController : UIViewController
{
    IBOutlet UIImageView *imageSection;
    IBOutlet UILabel *titleSection;
    IBOutlet UITextView *descriptionSection;
}

@property(nonatomic,strong) JMSections *section;

@end
