//
//  Card.m
//  Matchismo
//
//  Created by Aditya on 12/20/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards) {
        if([card.contents isEqualToAttributedString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
