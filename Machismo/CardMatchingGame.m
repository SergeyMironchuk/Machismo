//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Admin on 12.10.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //	of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCadrCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init]; // назначенный инициализатор супер класса
    if (self) {
        for (int i; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 0;
static const int COST_TO_CHOSE = 1;

- (Card *)cardAtIndex:(NSUInteger)index {
    return [self.cards count] > index ? self.cards[index] : nil;
}

- (void) choseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen & !otherCard.isMatched) {
                    int machScore = [card match:@[otherCard]];
                    if (machScore) {
                        self.score += machScore + MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
}

@end
