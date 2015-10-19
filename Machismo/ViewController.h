//
//  ViewController.h
//  Machismo
//  Abstract class. Must implement methods as described below.
//
//  Created by Admin on 21.08.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

-(Deck *)createDeck;    // Abstract

@end

