//
//  VTTableViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTTableViewController.h"
#import "UIUtil.h"
#import "CategoryTableViewController.h"

@interface VTTableViewController ()

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) CategoryTableViewController *sectionTableView;
@property(nonatomic,strong) UISearchBar *searchBar;

@end

@implementation VTTableViewController

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
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *document = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Document"] style:UIBarButtonItemStylePlain target:self action:@selector(tapDocument:)];
    
    UIBarButtonItem *favorite = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Favorites"] style:UIBarButtonItemStylePlain target:self action:@selector(tapFavorite:)];
    
    
    self.navigationItem.leftBarButtonItem = document;
    self.navigationItem.rightBarButtonItem = favorite;

    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationController.navigationBar setBackgroundColor:COLOR_PURPLE];
    

    self.searchBar = [[UISearchBar alloc] init];
    
    [self.searchBar sizeToFit];
    [self.searchBar setTranslucent:YES];
    [self.searchBar setDelegate:self];
    [self.searchDisplayController setDelegate:self];
    
    [self.navigationItem setTitleView:self.searchBar];
    
    self.sectionTableView = [[CategoryTableViewController alloc] initWithNibName:@"SectionTableViewController" bundle:nil];
    
    CGRect frame = self.sectionTableView.view.frame;
    frame.origin.y = 64;
    [self.sectionTableView.view setFrame:frame];
    
    [self.view addSubview:self.sectionTableView.view];
    
    //[self.navigationController.navigationBar setTranslucent:YES];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - SearchDisplay Delegate

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

#pragma mark - TableView Delegate & DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    
    return cell;
}




-(void)tapDocument:(id)sender
{
    
}

-(void)tapFavorite:(id)sender
{
    
}

-(void)viewWillAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
