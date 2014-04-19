//
//  LFLostItemViewController.h
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFLostItemViewController : UIViewController<NSURLConnectionDataDelegate>

@property(strong, nonatomic) NSMutableData* lostItems;
@property(strong, nonatomic) NSArray* lostItemsArray;

@end
