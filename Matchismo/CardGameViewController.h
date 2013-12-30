//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Aditya on 12/20/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

//for subclasses
- (Deck *)cardDeck; //abstract

@end
