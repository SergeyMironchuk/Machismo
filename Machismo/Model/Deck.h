//
//  Deck.h
//  Machismo
//
//  Created by Admin on 21.08.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;


@end
