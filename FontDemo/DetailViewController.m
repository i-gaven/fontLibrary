
//
//  DetailViewController.m
//  FontDemo
//
//  Created by 赵国腾 on 15/7/20.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.font = [UIFont fontWithName:_fontName size:17.0f];
}

@end
