//
//  GameHistoryViewController.m
//  Matchismo
//
//  Created by Aditya on 1/1/14.
//  Copyright (c) 2014 Aditya Viswanathan. All rights reserved.
//

#import "GameHistoryViewController.h"

@interface GameHistoryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;


@end

@implementation GameHistoryViewController

- (void)viewDidLoad
{
    NSMutableAttributedString *combineString = [[NSMutableAttributedString alloc] init];
    
    for(NSMutableAttributedString *move in self.moveHistory) {
        [combineString appendAttributedString:(NSAttributedString *)move];
        [combineString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    }
    self.historyLabel.attributedText = combineString;
    NSLog(combineString.string);
}

@end
