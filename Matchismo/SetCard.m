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

- (NSDictionary *)generateAttributeDictionary
{
    NSNumber *strokeWidth = [[NSNumber alloc] init];
    UIColor *color = [[UIColor alloc] init];
    UIColor *strokeColor = [[UIColor alloc] init];
    
    if([self.color isEqual:@"green"]) {
        color = [UIColor greenColor];
    } else if([self.color isEqual:@"purple"]) {
        color = [UIColor purpleColor];
    } else if([self.color isEqual:@"red"]) {
        color = [UIColor redColor];
    }
    
    if([self.shading isEqual:@"Solid"]) {
        strokeWidth = @-5;
        strokeColor = color;
    } else if([self.shading isEqual:@"Striped"]) {
        strokeWidth = @-5;
        strokeColor = color;
        color = [color colorWithAlphaComponent:0.3];
    } else if([self.shading isEqual:@"Open"]) {
        strokeWidth = @5;
        strokeColor = color;
        color = [color colorWithAlphaComponent:0.0];
    }
    
    NSDictionary *attributeDictionary = @{ NSForegroundColorAttributeName : color,
                                           NSStrokeWidthAttributeName : strokeWidth,
                                           NSStrokeColorAttributeName : strokeColor };
    
    return attributeDictionary;
}

- (NSAttributedString *)contents
{
    NSMutableAttributedString *setCardDisplay = [[NSMutableAttributedString alloc] initWithString:self.shape attributes:[self generateAttributeDictionary]];
    NSMutableAttributedString *unitType = [setCardDisplay copy];
    
    for(int k = 1; k < self.quantity.intValue; k++) { //applying quantity property
        [setCardDisplay appendAttributedString:unitType];
    }
    
    NSLog([NSString stringWithFormat:@"shading: %@", self.shading]);
    
    return setCardDisplay;
}

+ (NSArray *)validShapes
{
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validColors
{
    return @[@"green", @"purple", @"red"];
}

+ (NSArray *)validShadings
{
    return @[@"Solid", @"Striped", @"Open"];
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
