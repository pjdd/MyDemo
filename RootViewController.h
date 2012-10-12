//
//  RootViewController.h
//  MyDemo
//
//  Created by administrator on 12-10-12.
//  Copyright (c) 2012年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterViewController.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate>
{
    
}


@property (nonatomic, retain) ChapterViewController *chapterVC;
@property (nonatomic, retain) UIPopoverController *popover;
@property (nonatomic, copy) NSDictionary *category;
@property (nonatomic, copy) NSDictionary *ios;
@property (nonatomic, copy) NSDictionary *java;
@property(nonatomic, assign) int selectedIndex;

@property (weak, nonatomic) IBOutlet UITabBar *tab;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)btJava:(id)sender;
- (IBAction)btIOS:(id)sender;
@end
