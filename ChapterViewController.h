//
//  ChapterViewController.h
//  MyDemo
//
//  Created by administrator on 12-10-12.
//  Copyright (c) 2012年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChapterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (nonatomic, copy) NSArray *chapter;
@property(nonatomic, assign) int selectedIndex;
@end
