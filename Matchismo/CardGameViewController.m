//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Aditya on 12/20/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
//#import "PlayingCardDeck.h"
//#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) Deck *cardDeck;
@property (nonatomic, strong) CardMatchingGame *game;
//@property (nonatomic) NSMutableArray *usedCards;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UISwitch *threeCardModeButton;
@property (nonatomic) int cardMode;
@property (weak, nonatomic) IBOutlet UILabel *moveResults;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.cardDeck];
    }
    return _game;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (Deck *)cardDeck //abstract
{
//    if(!_cardDeck) {
//        _cardDeck = [[PlayingCardDeck alloc] init];
//    }
//    
//    return _cardDeck;
    
    return nil;
}

- (int)cardMode
{
    if(!_cardMode) {
        _cardMode = 1;
    }
    return _cardMode;
}

- (IBAction)touchRestart:(id)sender {
    [self.game restartScore];    
    _game = nil;
    _cardDeck = nil;
    for(UIButton *cardButton in self.cardButtons) {
        cardButton.enabled = YES;
    }
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex numMatch:self.cardMode];
    [self updateUI];
}

- (IBAction)threeCardModeTrigger:(id)sender {
    if([self.threeCardModeButton isOn]) {
        _cardMode = 2;
    } else if(![self.threeCardModeButton isOn]) {
        _cardMode = 1;
    }
}

- (void)updateUI
{
    for(UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        if(card.isMatched) {
            [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
            cardButton.enabled = NO;
        }
//        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.moveResults.text = self.game.status;
}

- (NSString *)titleForCard:(Card *)card
{
    if(card.isChosen) {
        return card.contents;
    }
    return @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card;
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

/* AV's ORIGINAL CODE */

//-(NSMutableArray *)usedCards
//{
//    if(!_usedCards) {
//        _usedCards = [[NSMutableArray alloc] init];
//    }
//    
//    return _usedCards;
//}
//
//- (NSString *)getNewRandomCard
//{
//    if([self.usedCards count] == 52) {
//        return @"done";
//    }
//    NSString *randCard = @"";
//    do {
//        randCard = [[self.cardDeck drawRandomCard] contents];
//    } while([self.usedCards containsObject:randCard]);
//    
//    [self.usedCards addObject:randCard];
//    
//    return randCard;
//}

/*

- (IBAction)touchCardButton:(UIButton *)sender
{
    if([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        Card *newCard = [self.cardDeck drawRandomCard];
        if(newCard) {
//        if([newCard isEqualToString:@"done"]) {
//            [sender setBackgroundImage:nil
//                              forState:UIControlStateNormal];
//        } else {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:newCard.contents
                    forState:UIControlStateNormal];
            self.flipCount++;
//        }
        }
    }
    
} 
 
 */

@end
