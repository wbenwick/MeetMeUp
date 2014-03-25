//
//  FLXViewController.m
//  MeetMeUp
//
//  Created by Administrator on 3/24/14.
//  Copyright (c) 2014 FileLogix. All rights reserved.
//

#import "FLXViewController.h"
#import "FLXEventViewController.h"
#import "FLXEventWebViewController.h"

@interface FLXViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* myEvents;
    __weak IBOutlet UISearchBar *mySearchBar;
    __weak IBOutlet UITableView *myTableView;
}
@end

@implementation FLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSURL* url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=32256&text=mobile&time=,1w&key=7b6d30444c5c61626c7c27643d146455"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError* error;
        NSDictionary* myResults;
        myResults = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        myEvents = myResults[@"results"];
        [myTableView reloadData];
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [myEvents count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyEventReusableID"];
    NSDictionary *myEvent = myEvents[indexPath.row];
    NSURL* url = [NSURL URLWithString:myEvent[@"title"]];
    
    
    cell.textLabel.text = myEvent[@"group"][@"name"];
    cell.detailTextLabel.text = myEvent[@"venue"][@"name"];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FLXEventViewController * eventView = [segue destinationViewController];
    NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];

    NSDictionary *myEvent = myEvents[indexPath.row];
//    NSURL* url = [NSURL URLWithString:myEvent[@"title"]];
    
    eventView.title = myEvent[@"group"][@"name"];
    eventView.eventHostedByString= [NSString stringWithFormat:@"%@",[myEvent objectForKey:@"venue"][@"name"]];
    eventView.eventRSVPString = [myEvent objectForKey:@"yes_rsvp_count"];
    eventView.eventDescriptionString = myEvent[@"name"];
    eventView.eventURLString = myEvent[@"event_url"];
    eventView.eventWebViewString = myEvent[@"description"];

    NSLog(@"%@", [myEvent objectForKey:@"venue"][@"name"]);
}

@end
