//
//  LFLostItemViewController.m
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import "LFLostItemViewController.h"

@interface LFLostItemViewController ()

@end

@implementation LFLostItemViewController

static NSString* cellIdentifier = @"LostItemCell";

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
    
    // connectig for lost items.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ilostufound.herokuapp.com/lost_items.json"]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    request = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.lostItems = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.lostItems appendData:data];
    self.lostItemsArray = [[NSArray alloc] init];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.lostItemsArray = [NSJSONSerialization JSONObjectWithData:self.lostItems options:0 error:nil];
    [self.tableView reloadData];
    
    NSLog(@"%@", self.lostItemsArray);
    
    connection = nil;
    self.lostItems = nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.lostItemsArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary* lost_item  = [self.lostItemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [lost_item valueForKey:@"lost_item"];
    return cell;
}


@end
