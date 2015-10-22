//
//  ViewController.m
//  Machismo
//
//  Created by Admin on 21.08.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardView.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;

@end

@implementation ViewController

- (IBAction)resetGame {
    self.game = nil;
    [self updateUI];
}

@synthesize game = _game;

- (CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCadrCount:[self.cardButtons count]
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void)setGame:(CardMatchingGame *)game
{
    _game = game;
}
- (IBAction)tapCardButton:(UITapGestureRecognizer *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender.view];
    [self.game choseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (PlayingCardView *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        PlayingCard *card = (PlayingCard *)[self.game cardAtIndex:cardIndex];
        cardButton.rank = card.rank;
        cardButton.suit = card.suit;
        BOOL newFaceUp = card.isChosen ? YES : NO;
        if (cardButton.faceUp != newFaceUp) {
            [UIView transitionWithView:cardButton
                              duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:^{
                                cardButton.faceUp = newFaceUp;
                            }
                            completion:NULL];

        }
        cardButton.enabled = !card.isMatched;
        //self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.scoreLabel.text = [[NSString alloc] initWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

@end
