//
//  LFSingleLostItemViewController.m
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import "LFSingleFoundItemViewController.h"

@interface LFSingleFoundItemViewController ()

@end

@implementation LFSingleFoundItemViewController

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
    NSLog(@"%@", self.singleFoundItem);
    self.username.text = [self.singleFoundItem valueForKey:@"name"];
    self.email.text = [self.singleFoundItem valueForKey:@"email"];
    self.found_item.text = [self.singleFoundItem valueForKey:@"found_item"];
    self.description.text = [self.singleFoundItem valueForKey:@"description"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
