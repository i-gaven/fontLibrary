//
//  ViewController.m
//  FontDemo
//
//  Created by 赵国腾 on 15/7/20.
//  Copyright (c) 2015年 ;. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *fontList;
@property (nonatomic, strong) NSString *fontName;

@end

@implementation ViewController

- (NSArray *)fontList {
    
    if (_fontList == nil) {
        _fontList = [UIFont familyNames];
    }
    return _fontList;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.fontList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"FontCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    NSString *fontName = self.fontList[indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:fontName size:16.0f];
    cell.detailTextLabel.font = [UIFont fontWithName:fontName size:16.0f];

    cell.detailTextLabel.text = fontName;
    cell.textLabel.text = @"iOS系统自带字体";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.fontName = self.fontList[indexPath.row];
    [self performSegueWithIdentifier:@"DetailViewController" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
    
    detailViewController.fontName = self.fontName;
}

@end
