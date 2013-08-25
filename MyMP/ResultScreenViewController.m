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

static NSString *CellIdentifier = @"Cell";
static NSString *CONSTITUENCY_NAME = @"constituency_name";
static NSString *MEMBER_NAME = @"member_name";
static NSString *MEMBER_PARTY = @"member_party";
static NSString *MEMBER_WEBSITE = @"member_website";
#define CONSTITUENCY_TAG 100
#define MEMBER_NAME_TAG 101
#define MEMBER_WEBSITE_TAG 102
#define CONSTITUENCY_IMAGE_TAG 103

@interface ResultScreenViewController ()
@end

@implementation ResultScreenViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    if (self.results.resultCollection.count == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Sorry, no results found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.results.resultCollection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dict = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    UILabel *constituencyName = (UILabel *)[cell viewWithTag:CONSTITUENCY_TAG];
    UILabel *memberName = (UILabel *)[cell viewWithTag:MEMBER_NAME_TAG];
    UIButton *memberWebsite = (UIButton *)[cell viewWithTag:MEMBER_WEBSITE_TAG];
    UIImageView *constituencyImage = (UIImageView *)[cell viewWithTag:CONSTITUENCY_IMAGE_TAG];
    
    constituencyName.text = [dict valueForKey:CONSTITUENCY_NAME];
    memberName.text = [dict valueForKey:MEMBER_NAME];
    [memberWebsite setTitle:[dict valueForKey:MEMBER_WEBSITE] forState:UIControlStateNormal];
    constituencyImage.image = [ImageChooser chooseImage:[dict valueForKey:MEMBER_PARTY]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDictionary *selectedObject = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)[self.tableView indexPathForSelectedRow].row]];
    if ([segue.identifier isEqualToString:@"ResultViewToBioWebView"])
    {
        WebResultDetialViewController *webVC = [segue destinationViewController];
        NSString *bioUrl = [selectedObject valueForKey:@"member_biography_url"];
        webVC.bioUrl = bioUrl;
    }

    else if ([segue.identifier isEqualToString:@"ResultViewToMemberWesbiteWebView"])
    {
        WebResultDetialViewController *webVC = [segue destinationViewController];
        NSString *bioUrl = [selectedObject valueForKey:MEMBER_WEBSITE];
        webVC.bioUrl = bioUrl;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
