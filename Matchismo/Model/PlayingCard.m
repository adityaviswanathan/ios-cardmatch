//
//  PlayingCard.m
//  Matchismo
//
//  Created by Aditya on 12/22/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards) {
        PlayingCard *selectedCard = (PlayingCard *)card;
        if([self.suit isEqualToString:selectedCard.suit]) {
            score += 1;
        } else if(self.rank == selectedCard.rank){
            score += 4;
        }
        for(Card *allCard in otherCards) {
            if(![allCard isEqual:card]) {
                PlayingCard *neighborCard = allCard;
                if([neighborCard.suit isEqualToString:selectedCard.suit]) {
                    score += 1;
                } else if(neighborCard.rank == selectedCard.rank){
                    score += 4;
                } 
            }
        }
    }    
    return score;
}

- (NSAttributedString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [[NSAttributedString alloc] initWithString:[rankStrings[self.rank] stringByAppendingString:self.suit]];
    
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥︎", @"♦︎", @"♣︎", @"♠︎"];
}

- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
