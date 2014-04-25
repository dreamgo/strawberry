//
//  HostViewController.m
//  Strawberry
//
//  Created by Ted Lee on 3/9/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//


#import "HostViewController.h"
#import "content1ViewController.h"
#import "content2ViewController.h"
#import "content3ViewController.h"
@interface HostViewController () <ViewPagerDataSource, ViewPagerDelegate>

@end

@implementation HostViewController
{
    UILabel *titleLabel;
}

- (void)viewDidLoad {
    NSLog(@"sandbox path：%@",NSHomeDirectory());
    self.dataSource = self;
    self.delegate = self;
    
    self.title = @"Strawberry";
    
    // Keeps tab bar below navigation bar on iOS 7.0+
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [super viewDidLoad];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 3;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    if (index==0) {
        label.text = [NSString stringWithFormat:@"DISEASE"];
    }
    if (index==1) {
        label.text = [NSString stringWithFormat:@"INSECTS"];
    }
    if (index==2) {
        label.text = [NSString stringWithFormat:@"WEEDS"];
    }
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    titleLabel = label;
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    content1ViewController *cvc1;
    content1ViewController *cvc2;
    content1ViewController *cvc3;
    if (index==0) {
        cvc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController1"];
        return cvc1;
    }
    else if (index==1) {
        cvc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController2"];
        return cvc2;
    }
    else if (index==2) {
        cvc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController3"];
        return cvc3;
    }
    else
        return cvc3;
    
}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 1.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        default:
            break;
    }
    
    return value;
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}

@end

