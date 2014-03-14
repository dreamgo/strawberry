//
//  content3ViewController.m
//  Strawberry
//
//  Created by Ted Lee on 3/9/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//

#import "content3ViewController.h"

@interface content3ViewController ()

@end

@implementation content3ViewController
@synthesize menu1;
@synthesize menu2;
@synthesize menu3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload{
    [self setMenu1:nil];
    [self setMenu2:nil];
    [self setMenu3:nil];
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view.
    self.menu1=[[NSArray alloc]initWithObjects:@"All Active Ingredients",@"Tradenames",@"Fungicide Resistance", nil];
    self.menu2=[[NSArray alloc]initWithObjects:@"All Active Ingredient",@"Tradenames", nil];
    self.menu3=[[NSArray alloc]initWithObjects:@"contact",nil];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self.menu1 count];
        case 1:
            return [self.menu2 count];
        case 2:
            return [self.menu3 count];
        default:
            return 0;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Herbicide";
        case 1:
            return @"Biologicals";
        case 2:
            return @"Contact local Specialist";
        default:
            return @"Unknown";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"weedscell"];
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=[self.menu1 objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text=[self.menu2 objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.textLabel.text=[self.menu3 objectAtIndex:indexPath.row];
            break;
        default:
            cell.textLabel.text=@"Unknown";
    }
    return cell;
}



@end
