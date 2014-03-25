//
//  FLXEventViewController.m
//  MeetMeUp
//
//  Created by Administrator on 3/25/14.
//  Copyright (c) 2014 FileLogix. All rights reserved.
//

#import "FLXEventViewController.h"

@interface FLXEventViewController () {
    
    __weak IBOutlet UIButton *eventButton;
    __weak IBOutlet UIWebView *eventWebView;
    __weak IBOutlet UITextView *eventDescription;
    __weak IBOutlet UITextField *eventRSVP;
    __weak IBOutlet UITextField *eventHostedBy;
    __weak IBOutlet NSString *eventURL;
    
}

@end

@implementation FLXEventViewController

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
    
    eventDescription.text = self.eventDescriptionString;
    eventRSVP.text = [NSString stringWithFormat:@"%@",  self.eventRSVPString];
    eventHostedBy.text = self.eventHostedByString;
    [eventWebView loadHTMLString:self.eventWebViewString baseURL:nil];
   
    
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
