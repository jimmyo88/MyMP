//
//  ResultScreenViewController.m
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ResultScreenViewController.h"
#import "WebResultDetialViewController.h"

@interface ResultScreenViewController ()

@end

@implementation ResultScreenViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tableView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.memberUrl = [[NSString alloc]init];
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
    NSLog(@"%d",self.results.resultCollection.count);
    
    return self.results.resultCollection.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dict = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    UILabel *constituencyName = (UILabel *)[cell viewWithTag:100];
    UILabel *memberName = (UILabel *)[cell viewWithTag:101];
    UILabel *memberParty = (UILabel *)[cell viewWithTag:102];
    
    constituencyName.text = [dict valueForKey:@"constituency_name"];
    memberName.text = [dict valueForKey:@"member_name"];
    memberParty.text = [dict valueForKey:@"member_party"];
    
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
        NSDictionary *dict = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        self.memberUrl = [[NSString alloc]initWithString:[dict valueForKey:@"member_biography_url"]];
//    
//     WebResultDetialViewController *detailViewController = [[WebResultDetialViewController alloc] initWithUrl:self.memberUrl];
//    detailViewController.bioUrl = self.memberUrl;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ResultViewToWebView"])
    {
        NSDictionary *dict = [self.results.resultCollection objectForKey:[NSString stringWithFormat:@"%ld",(long)[self.tableView indexPathForSelectedRow].row]];
                                                                        
        
        WebResultDetialViewController *viewController = [segue destinationViewController];
        NSString *custObject = [dict valueForKey:@"member_biography_url"];
        viewController.bioUrl = custObject;
    }
}

- (void)viewDidUnload {
//    [self setMemberName:nil];
    [self setTableView:nil];
//    [self setCustomCell:nil];
    [super viewDidUnload];
}
@end
