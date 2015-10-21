//
//  PlayingCardView.m
//  Machismo
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#define CORNER_FOR_STANDARD_HEIGH 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FOR_STANDARD_HEIGH; }
- (CGFloat)cornerRadius {return CORNER_RADIUS * [self cornerScaleFactor]; }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *roundedRec = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                          cornerRadius:[self cornerRadius]];
    [roundedRec addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}


- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}
@end
