//
//  LFFoundItemViewController.m
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import "LFFoundItemViewController.h"
#import "LFSingleFoundItemViewController.h"

@interface LFFoundItemViewController ()

@end

@implementation LFFoundItemViewController

static NSString* cellIdentifier = @"foundItemCell";

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
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ilostufound.herokuapp.com/found_items.json"]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    request = nil;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    LFSingleFoundItemViewController* singleitemController = (LFSingleFoundItemViewController*)segue.destinationViewController;
    singleitemController.singleFoundItem = [self.foundItemsArray objectAtIndex:indexPath.row];
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.foundItems = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.foundItems appendData:data];
    self.foundItemsArray = [[NSArray alloc] init];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.foundItemsArray = [NSJSONSerialization JSONObjectWithData:self.foundItems options:0 error:nil];
    [self.tableView reloadData];
    NSLog(@"%d", [self.foundItemsArray count]);
    connection = nil;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", [self.foundItemsArray count]);
    return [self.foundItemsArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary* foundItem = [self.foundItemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [foundItem valueForKey:@"found_item"];
    return cell;
}

@end
