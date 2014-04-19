//
//  LFSingleLostItemViewController.h
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFFoundItemViewController.h"

@interface LFSingleFoundItemViewController : UIViewController

@property(strong, nonatomic) NSDictionary* singleFoundItem;
@property(strong, nonatomic) IBOutlet UILabel* username;
@property(strong, nonatomic) IBOutlet UILabel* email;
@property(strong, nonatomic) IBOutlet UILabel* found_item;
@property(strong, nonatomic) IBOutlet UILabel* description;


@end
