//
//  PlayingCardView.h
//  Machismo
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property(nonatomic, strong) NSString *suit;
@property(nonatomic) BOOL faceUp;
@end
