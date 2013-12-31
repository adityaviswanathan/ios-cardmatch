//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Aditya on 12/29/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    if(self) {
        for(NSString *shape in [SetCard validShapes]) {
            for(NSString *color in [SetCard validColors]) {
                for(NSString *shading in [SetCard validShadings]) {
                    for(NSNumber *quantity in [SetCard validQuantities]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.shape = shape;
                        card.color = color;
                        card.shading = shading;
                        card.quantity = quantity;
                        [self addCard:card];
                    }
                }
            }
        }
    }    
    return self;
}

@end
