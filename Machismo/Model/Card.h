//
//  Card.h
//  Machismo
//
//  Created by Admin on 21.08.15.
//  Copyright (c) 2015 Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *) otherCards;
@end
