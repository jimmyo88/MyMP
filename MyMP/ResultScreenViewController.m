//
//  ResultScreenViewController.m
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ResultScreenViewController.h"
#import "WebResultDetialViewController.h"

static NSString *CellIdentifier = @"Cell";
static NSString *CONSTITUENCY_NAME = @"constituency_name";
static NSString *MEMBER_NAME = @"member_name";
static NSString *MEMBER_PARTY = @"member_party";
#define CONSTITUENCY_TAG 100
#define MEMBER_NAME_TAG 101
#define MEMBER_PARTY_TAG 102

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

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
    UILabel *memberParty = (UILabel *)[cell viewWithTag:MEMBER_PARTY_TAG];
    
    constituencyName.text = [dict valueForKey:CONSTITUENCY_NAME];
    memberName.text = [dict valueForKey:MEMBER_NAME];
    memberParty.text = [dict valueForKey:MEMBER_PARTY];

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ResultViewToWebView"])
    {
        NSDictionary *selectedObject = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)[self.tableView indexPathForSelectedRow].row]];
                                                                        
        WebResultDetialViewController *webVC = [segue destinationViewController];
        NSString *bioUrl = [selectedObject valueForKey:@"member_biography_url"];
        webVC.bioUrl = bioUrl;
    }
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
