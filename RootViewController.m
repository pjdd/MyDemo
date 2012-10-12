//
//  RootViewController.m
//  MyDemo
//
//  Created by administrator on 12-10-12.
//  Copyright (c) 2012年 administrator. All rights reserved.
//

#import "RootViewController.h"
#import "ChapterViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize tab;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *cg1 = [NSArray arrayWithObjects:@"ch1",@"ch2",@"ch3", nil];
    NSArray *cg2 = [NSArray arrayWithObjects:@"ch2",@"ch3",@"ch4", nil];
    self.ios = [NSDictionary dictionaryWithObjectsAndKeys:cg1,@"oc基础",cg2,@"oc高级", nil];
    self.java = [NSDictionary dictionaryWithObjectsAndKeys:cg1,@"java基础",cg2,@"java高级", nil];
    self.category = nil;
    
    self.chapterVC = [[ChapterViewController alloc] initWithNibName:@"ChapterViewController" bundle:nil];
    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.chapterVC];
    self.popover.popoverContentSize = CGSizeMake(400, 400);
    self.chapterVC.contentSizeForViewInPopover = self.chapterVC.view.bounds.size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.category count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [[self.category allKeys] objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	self.selectedIndex = indexPath.row;
    [self.popover presentPopoverFromRect:tableView.frame
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionLeft
                                animated:YES];
    self.chapterVC = nil;
}


- (IBAction)btJava:(id)sender {
    self.category = self.java;
    [self.tableView reloadData];
}

- (IBAction)btIOS:(id)sender {
    self.category = self.ios;
    [self.tableView reloadData];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController{
    if (self.popover) {
        [self.popover dismissPopoverAnimated:YES];
        self.popover=nil;
        self.chapterVC = nil;
    }
}

//closing popover
-(void)killPopoversOnSight {
    if (self.popover) {
        [self.popover dismissPopoverAnimated:NO];
    }
}
@end
