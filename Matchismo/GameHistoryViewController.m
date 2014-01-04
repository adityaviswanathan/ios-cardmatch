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
    
//    for(NSMutableAttributedString *move in self.moveHistory) {
//        NSMutableAttributedString *previousString = [self.historyLabel.attributedText copy];
//        [previousString appendAttributedString:(NSAttributedString *)move];
//        self.historyLabel.attributedText = previousString;
//    }
    
    NSMutableAttributedString *combineString = [[NSMutableAttributedString alloc] init];
    
    for(NSMutableAttributedString *move in self.moveHistory) {
        [combineString appendAttributedString:(NSAttributedString *)move];
    }
    
    self.historyLabel.attributedText = combineString;
}

@end
