//
//  ResultScreenViewController.m
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ResultScreenViewController.h"
#import "WebResultDetialViewController.h"
#import "ImageChooser.h"
#import "SearchURLBuilder.h"
#import "JSONDownloader.h"
#import "ResultCell.h"

static NSString *CellIdentifier = @"Cell";
static NSString *MEMBER_BIO = @"member_biography_url";

@interface ResultScreenViewController ()

@property (nonatomic, strong) NSArray *results;

@end

@implementation ResultScreenViewController

#pragma mark - View lifeycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [SearchUrlBuilder buildURLForSearchQuery:self.searchText];
    JSONDownloader *downloader = [[JSONDownloader alloc] initWithUrl:url];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        [downloader downloadJsonData];
        self.results = [downloader buildModels];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([self.results count] == 0)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, no results found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else
            {
                [self.tableView reloadData];
            }
        });
    });
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ResultViewToBioWebView"])
    {
        NSDictionary *selectedObject = [self.results objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        WebResultDetialViewController *webVC = [segue destinationViewController];
        webVC.bioUrl = [selectedObject valueForKey:@"member_biography_url"];
    }
    
    else if ([segue.identifier isEqualToString:@"ResultViewToMemberWesbiteWebView"])
    {
        UIButton *button = sender;
        WebResultDetialViewController *webVC = [segue destinationViewController];
        webVC.bioUrl = button.currentTitle;
    }
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    
    [super viewDidUnload];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultCell *cell = (ResultCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *dict = self.results[indexPath.row];
    
    [cell configureForDictionary:dict];
    
    return cell;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
