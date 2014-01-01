//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Aditya on 12/23/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"
#import "SetCard.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

//@synthesize status = _status;

- (NSAttributedString *)status
{
    if(!_status) {
        _status = [[NSAttributedString alloc] init];
    }
    return _status;
}

- (NSMutableArray *)cards
{
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self) {
        for(int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if(card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if(index < [self.cards count]) {
        return self.cards[index];
    } else {
        return nil;
    }
}

- (void)fillSelectedCards:(NSMutableArray *)cards fillScore:(int)score
{
    NSLog(@"start");
    if(score > 0) {
        NSMutableAttributedString *statusBuild = [[NSMutableAttributedString alloc] initWithString:@"You matched "];
        for(Card *selectedCard in cards) {
            [statusBuild appendAttributedString:selectedCard.contents];
            [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        }
        [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@"for "]];
        [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", score]]];
        [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@" points."]];
        _status = statusBuild;
    } else if(score == 0){
        NSMutableAttributedString *statusBuild = [[NSMutableAttributedString alloc] init];
        for(Card *selectedCard in cards) {
            [statusBuild appendAttributedString:selectedCard.contents];
            [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        }
        _status = statusBuild;
    } else if(score < 0) {
        NSMutableAttributedString *statusBuild = [[NSMutableAttributedString alloc] init];
        for(Card *selectedCard in cards) {
            [statusBuild appendAttributedString:selectedCard.contents];
            [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        }
        [statusBuild appendAttributedString:[[NSAttributedString alloc] initWithString:@"don't match!"]];
        _status = statusBuild;
    }
    NSLog(self.status.string);
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index numMatch:(int)numMode
{
    NSLog(@"hi");
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *chosenCards = [NSMutableArray array];
            BOOL threshold = NO;
            for(Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                    NSLog([NSString stringWithFormat:@"%d", [chosenCards count]]);
                    if([chosenCards count] == numMode) {
                        threshold = YES;
                        NSArray *cardsPicked = [NSArray arrayWithArray:chosenCards];
                        int matchScore = [card match:cardsPicked];
                        [chosenCards addObject:card];
                        [self fillSelectedCards:chosenCards fillScore:(matchScore * MATCH_BONUS)];
                        
                        if (matchScore) {
                            NSLog(@"found");
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            for(Card *otherCard in cardsPicked) {
                                otherCard.matched = YES;
                            }
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            [self fillSelectedCards:chosenCards fillScore:-1];
                            for(Card *card in cardsPicked) {
                                card.chosen = NO;
                            }
                        }
                    }
                }
            }
            if(!threshold) {
                [chosenCards addObject:card];
                [self fillSelectedCards:chosenCards fillScore:0];
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (void)restartScore
{
    self.score = 0;
}

@end
