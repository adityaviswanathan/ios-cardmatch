//
//  SetCard.m
//  Matchismo
//
//  Created by Aditya on 12/29/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    int shapeMatch = 0;
    int colorMatch = 0;
    int shadingMatch = 0;
    int quantityMatch = 0;
    
    for(Card *card in otherCards) {
        SetCard *selectedCard = (SetCard *)card;
        if([selectedCard.shape isEqual:self.shape]) {
            shapeMatch++;
        }
        if([selectedCard.color isEqual:self.color]) {
            colorMatch++;
        }
        if([selectedCard.shading isEqual:self.shading]) {
            shadingMatch++;
        }
        if([selectedCard.quantity isEqual:self.quantity]) {
            quantityMatch++;
        }
    }
    
    if(shapeMatch != 1 && colorMatch != 1 && shadingMatch != 1 && quantityMatch != 1) {
        score = 10;
    }
    
    return score;
}

- (NSString *)contents
{
    NSMutableAttributedString *setCardDisplay = [[NSMutableAttributedString alloc] initWithString:self.shape attributes:@{ NSForegroundColorAttributeName : self.color }];
    
    for(int k = 0; k < (int)self.quantity; k++) {
        [setCardDisplay appendAttributedString:setCardDisplay];
    }
    
    return self.shape;
}

+ (NSArray *)validShapes
{
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validColors
{
    return @[[UIColor greenColor], [UIColor purpleColor], [UIColor redColor]];
}

+ (NSArray *)validShadings
{
    return @[@"Solid", @"Striped", @"Solid"];
}

const int MAX_CARD_NUM = 3;
+ (NSArray *)validQuantities
{
    return @[@1, @2, @3];
}

//@synthesize type = _type;
//
//- (void)setType:(NSAttributedString *)type
//{
//    if([[SetCard validTypes] containsObject:type]) {
//        _type = type;
//    }
//}
//
//- (NSAttributedString *)type
//{
//    return _type ? _type : @"?";
//}

@end
