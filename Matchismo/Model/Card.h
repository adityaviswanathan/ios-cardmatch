//
//  Card.h
//  Matchismo
//
//  Created by Aditya on 12/20/13.
//  Copyright (c) 2013 Aditya Viswanathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSAttributedString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
