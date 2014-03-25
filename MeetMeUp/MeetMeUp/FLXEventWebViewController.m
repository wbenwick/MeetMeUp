//
//  FLXEventWebViewController.m
//  MeetMeUp
//
//  Created by Administrator on 3/25/14.
//  Copyright (c) 2014 FileLogix. All rights reserved.
//

#import "FLXEventWebViewController.h"

@interface FLXEventWebViewController () {
    
    __weak IBOutlet UIWebView *eventWebView;
}

@end

@implementation FLXEventWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL * url = [NSURL URLWithString:self.eventURL];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [eventWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
