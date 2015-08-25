//
//  PlayingCard.h
//  Machismo
//
//  Created by Admin on 25.08.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
