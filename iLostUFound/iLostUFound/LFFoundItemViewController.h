//
//  LFFoundItemViewController.h
//  iLostUFound
//
//  Created by sunny on 4/19/14.
//  Copyright (c) 2014 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFFoundItemViewController : UIViewController<NSURLConnectionDataDelegate>

@property(strong, nonatomic) NSMutableData* foundItems;
@property(strong, nonatomic) NSArray* foundItemsArray;

@end
