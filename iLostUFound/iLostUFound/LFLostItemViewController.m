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
    
    NSLog(@"%@", self.lostItemsArray);
    
    connection = nil;
}



@end
