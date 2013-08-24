//
//  WebResultDetialViewController.m
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "WebResultDetialViewController.h"

@interface WebResultDetialViewController ()

@end

@implementation WebResultDetialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWebsite];
}

-(void)loadWebsite
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.bioUrl]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
