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
    
    return score;
}

- (NSString *)contents
{
    return @"";
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
