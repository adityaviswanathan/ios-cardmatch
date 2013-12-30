//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Aditya on 12/28/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)cardDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
