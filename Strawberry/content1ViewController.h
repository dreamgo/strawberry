//
//  content1ViewController.h
//  Strawberry
//
//  Created by Ted Lee on 3/9/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface content1ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;

@property (nonatomic, strong) NSArray *menu1;
@property (nonatomic, strong) NSArray *menu2;
@property (nonatomic, strong) NSArray *menu3;
- (IBAction)pictureAlert1:(UITapGestureRecognizer *)sender;


@end
