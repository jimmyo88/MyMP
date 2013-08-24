//
//  WebResultDetialViewController.h
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebResultDetialViewController : UIViewController

@property (nonatomic, strong) NSString *bioUrl;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

-(id)initWithUrl:(NSString *)url;
@end
