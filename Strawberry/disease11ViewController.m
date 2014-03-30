//
//  disease11ViewController.m
//  Strawberry
//
//  Created by Ted Lee on 3/21/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//

#import "disease11ViewController.h"
#import "XCMultiSortTableView.h"

@interface disease11ViewController ()<XCMultiTableViewDataSource>

@end

@implementation disease11ViewController{
    NSMutableArray *headData;
    NSMutableArray *leftTableData;
    NSMutableArray *rightTableData;
}


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
	// Do any additional setup after loading the view.
    [self initData];
    XCMultiTableView *tableView = [[XCMultiTableView alloc] initWithFrame:CGRectInset(self.view.bounds, 0.0f, 100.0f)];
    tableView.leftHeaderEnable = YES;
    tableView.datasource = self;
    [self.view addSubview:tableView];
    UILabel *headfirst = [[UILabel alloc] initWithFrame:CGRectMake(5, 90, 140, 50)];
    [self.view addSubview:headfirst];
    [headfirst setText:@"Active Ingredient"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initData {
    
    headData = [NSMutableArray arrayWithCapacity:10];
    [headData addObject:@"Frac Code"];
    [headData addObject:@"Guide"];
    [headData addObject:@"PDMR"];
    [headData addObject:@"Sum"];
    leftTableData = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray *one = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 13; i++) {
        [one addObject:[NSString stringWithFormat:@"+%d", i]];
    }
    [leftTableData addObject:one];
    
    rightTableData = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableArray *oneR = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 13; i++) {
        NSMutableArray *ary = [NSMutableArray arrayWithCapacity:10];
        for (int j = 0; j < 5; j++) {
            if (j == 1) {
                [ary addObject:[NSNumber numberWithInt:random() % 5 *2]];
            }else if (j == 2) {
                [ary addObject:[NSNumber numberWithInt:random() % 10 *3]];
            }
            else {
                [ary addObject:[NSString stringWithFormat:@"%d,%d", i, j]];
            }
        }
        [oneR addObject:ary];
    }
    [rightTableData addObject:oneR];
}
 


#pragma mark - XCMultiTableViewDataSource


- (NSArray *)arrayDataForTopHeaderInTableView:(XCMultiTableView *)tableView {
    return [headData copy];
}
- (NSArray *)arrayDataForLeftHeaderInTableView:(XCMultiTableView *)tableView InSection:(NSUInteger)section {
    return [leftTableData objectAtIndex:section];
}

- (NSArray *)arrayDataForContentInTableView:(XCMultiTableView *)tableView InSection:(NSUInteger)section {
    return [rightTableData objectAtIndex:section];
}


- (NSUInteger)numberOfSectionsInTableView:(XCMultiTableView *)tableView {
    return [leftTableData count];
    
}

- (CGFloat)tableView:(XCMultiTableView *)tableView contentTableCellWidth:(NSUInteger)column {
    if (column == 0) {
        return 85.0f;
    }
    return 70.0f;
}

- (CGFloat)tableView:(XCMultiTableView *)tableView cellHeightInRow:(NSUInteger)row InSection:(NSUInteger)section {
  
    return 30.0f;
    
}

- (UIColor *)tableView:(XCMultiTableView *)tableView bgColorInSection:(NSUInteger)section InRow:(NSUInteger)row InColumn:(NSUInteger)column {
/*    if (row == 1 && section == 0) {
        return [UIColor redColor];
    }
 */
    return [UIColor clearColor];
}

- (UIColor *)tableView:(XCMultiTableView *)tableView headerBgColorInColumn:(NSUInteger)column {
    if (column%2 != 0) {
        return [UIColor whiteColor];
    }else {
        return [UIColor whiteColor];
    }
    return [UIColor clearColor];
}


@end

