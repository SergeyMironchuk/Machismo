//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Admin on 12.10.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// назначенный инициализатор
- (instancetype)initWithCadrCount: (NSUInteger) count
                        usingDeck: (Deck *) deck;

- (void)choseCardAtIndex: (NSUInteger) index;
- (Card *)cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
