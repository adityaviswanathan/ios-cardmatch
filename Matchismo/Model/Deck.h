//
//  Deck.h
//  Matchismo
//
//  Created by Aditya on 12/22/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
