//
//  SectionTableViewController.m
//  VintecCEDA
//
//  Created by leonardo on 5/2/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "CoreDataManager.h"
#import "JMCategory.h"
#import "CDCategory.h"
#import "NSData+Base64.h"
#import "UIUtil.h"
#import "Util.h"


@interface CategoryTableViewController ()

@property(nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation CategoryTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *categories = [[CoreDataManager sharedInstance] fetchRowsWithFeature:VTFeatureCategory];
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    for (CDCategory *category in categories) {
        JMCategory *jmcategory = [JMCategory jMCategoryFromCategoryObject:category];
        [self.dataSource addObject:jmcategory];
    }
    
    [self.tableView setRowHeight:70];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    
    if (!cell) {
        cell = [self customTableViewCell];
        
    }
    
    JMCategory *category = [self.dataSource objectAtIndex:indexPath.row];
    
    UILabel *textLabel = (UILabel *)[cell viewWithTag:-98];
    
    textLabel.text = category.name;
    [cell setBackgroundColor:[self colorForCategoryIdentifier:category.identifier]];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:-99];
    
    if (!category.icon && ![Util stringIsEmptyOrNull:category.iconBase64]) {
        NSData *data =[[NSData alloc] initWithBase64Encoding:category.iconBase64];
        category.icon = [[UIImage alloc] initWithData:data];
    }
    
    [imageView setImage:category.icon];
    
    return cell;
}

-(UITableViewCell *)customTableViewCell
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 150, 50)];
    
    [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:24]];
    [textLabel setTextColor:[UIColor whiteColor]];
    //[cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setTag:-98];
    [cell.contentView addSubview:textLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50, 50)];
    [imageView setTag:-99];
    
    [cell.contentView addSubview:imageView];
    
    
    return cell;
    
}


-(UIColor *)colorForCategoryIdentifier:(NSInteger)identifier
{
    switch (identifier) {
        case 1:
            return COLOR_PURPLE;
        case 2:
            return COLOR_GREEN;
        case 3:
            return COLOR_ORANGE;
        case 4:
            return COLOR_RED;
        case 5:
            return COLOR_YELLOW;
            
        default:
            return COLOR_GRAY;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
