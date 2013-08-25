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
    self.webView.delegate = self;
    [self loadWebsite];
    

}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
     self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = CGPointMake(160, 240);
    self.spinner.hidesWhenStopped = YES;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
}

-(void)loadWebsite
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.bioUrl]]];   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating]; 
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
