//
//  PlayingCardViewController.m
//  Machismo
//
//  Created by Admin on 19.10.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardView.h"
#import "PlayingCard.h"

@interface PlayingCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (nonatomic, strong) Deck *deckForAnimateAllCards;

@end

@implementation PlayingCardViewController
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    BOOL cardExists = YES;
    if (!self.playingCardView.faceUp) {
        cardExists = [self drawRandomPlayingCard];
    }
    if (cardExists) {
        
        [UIView transitionWithView:self.playingCardView
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                               self.playingCardView.faceUp = !self.playingCardView.faceUp;
                        }
                        completion:NULL];
    }
}

- (Deck *)deckForAnimateAllCards
{
    if(!_deckForAnimateAllCards) _deckForAnimateAllCards = [[PlayingCardDeck alloc] init];
    return _deckForAnimateAllCards;
}

- (BOOL)drawRandomPlayingCard
{
    Card *card = [self.deckForAnimateAllCards drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
        return YES;
    }
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]
                                                initWithTarget:self.playingCardView
                                                action:@selector(pinch:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
