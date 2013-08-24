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

-(id)initWithUrl:(NSString *)url{
    
    self = [super init];
    if(self)
    {
        self.bioUrl = url;
        [self loadWebsite];
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadWebsite];
}

-(void)loadWebsite
{
    NSURL *websiteUrl = [NSURL URLWithString:self.bioUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
