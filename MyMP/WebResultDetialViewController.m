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

- (void)viewDidUnload
{
    [self setWebView:nil];
    
    [super viewDidUnload];
}

- (void)loadWebsite
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.bioUrl]]];   
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating]; 
}

@end
