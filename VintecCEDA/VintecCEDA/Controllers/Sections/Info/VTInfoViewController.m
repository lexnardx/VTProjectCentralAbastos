//
//  VTInfoViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTInfoViewController.h"
#import "NSData+Base64.h"


@interface VTInfoViewController ()

@end

@implementation VTInfoViewController

@synthesize section;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *ret = nil;
    
    if (section.imageBase64) {
        NSData *imageData = [[NSData alloc] initWithBase64Encoding:section.imageBase64];
        ret = [UIImage imageWithData:imageData];
    }
    
    imageSection.image = ret;
    titleSection.text = section.name;
    descriptionSection.text = section.text;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
