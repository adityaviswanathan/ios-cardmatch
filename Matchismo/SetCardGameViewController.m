//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Aditya on 12/29/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *)cardDeck
{
    return [[SetCardDeck alloc] init];
}

@end
