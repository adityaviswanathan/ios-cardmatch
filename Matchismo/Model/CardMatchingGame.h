//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Aditya on 12/23/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index numMatch:(int)num;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)restartScore;
- (void)fillSelectedCards:(NSMutableArray *)cards fillScore:(int)score;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSString *status; //of Card

@end
