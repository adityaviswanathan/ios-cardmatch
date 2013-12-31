//
//  SetCard.h
//  Matchismo
//
//  Created by Aditya on 12/29/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *shape;
@property (strong, nonatomic) NSString *color;
@property (nonatomic) NSNumber *quantity;
@property (strong, nonatomic) NSString *shading;

+ (NSArray *)validShapes;
+ (NSArray *)validColors;
+ (NSArray *)validQuantities;
+ (NSArray *)validShadings;

@end
