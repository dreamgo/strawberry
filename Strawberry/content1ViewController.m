//
//  content1ViewController.m
//  Strawberry
//
//  Created by Ted Lee on 3/9/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//

#import "content1ViewController.h"
#import "CXAlertView.h"

@interface content1ViewController ()

@end

@implementation content1ViewController
@synthesize menu1;
@synthesize menu2;
@synthesize menu3;
@synthesize theScrollView;

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
    [theScrollView setContentSize:CGSizeMake(2 * theScrollView.bounds.size.width, theScrollView.bounds.size.height)];
    [theScrollView setPagingEnabled:YES];
    
   
    UIImageView* image;
    UIImage *img;

    for (int i=0; i<4; i++) {
        if (i==1||i==3) {
            img=[UIImage imageNamed:@"strawberry.png"];
            
            
        }
        else
        img=[UIImage imageNamed:@"strawberry_d1.jpg"];
        image=[[UIImageView alloc]initWithImage:img];
        [image setFrame:CGRectMake(157*i, 70, 155, 150)];
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pictureAlert1:)];
        [gestureRecognizer setNumberOfTapsRequired:1];
        [image setUserInteractionEnabled:YES];
        [image addGestureRecognizer:gestureRecognizer];
        [theScrollView addSubview:image];
    }

}

/*
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
*/

- (IBAction)pictureAlert1:(UITapGestureRecognizer *)sender{
    // Create alertView with the old fashioned way.
    CXAlertView *alertView = [[CXAlertView alloc] initWithTitle:@"Ralstonia solanacearum" message:@"\"Ralstonia solanacearum is an aerobic non-sporing, Gram-negative plant pathogenic bacterium. R. solanacearum is soil-borne and motile with a polar flagellar tuft. It colonises the xylem, causing bacterial wilt in a very wide range of potential host plants. It is known as Granville wilt when it occurs in tobacco.\" - Wikipedia" cancelButtonTitle:nil];
    
    // This is a demo for changing content at realtime.
    [alertView addButtonWithTitle:@"Picture"
                             type:CXAlertViewButtonTypeDefault
                          handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
                              alertView.title = @"Strawberry Disease";
                              UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"strawberry_d1.jpg"]];
                              imageView.backgroundColor = [UIColor clearColor];
                              alertView.contentView = imageView;
                          }];
    // Add additional button as you like with block to handle UIControlEventTouchUpInside event.
    [alertView addButtonWithTitle:@"OK"
                             type:CXAlertViewButtonTypeCancel
                          handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
                              // Dismiss alertview
                              [alertView dismiss];
                          }];
    // This is a demo for multiple line of title.
    [alertView addButtonWithTitle:@"Multititle"
                             type:CXAlertViewButtonTypeCustom
                          handler:^(CXAlertView *alertView, CXAlertButtonItem *button) {
                              alertView.contentView = nil;
                              alertView.title = @"This \n is \n a \n multiline \n title demo without content.";
                          }];
    
    // Remember to call this, or alertview will never be seen.
    [alertView show];

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
            return @"Fungicide Efficacy/Toxicity";
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"diseasecell"];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    NSLog(@"select 1.1");
                    //[self performSegueWithIdentifier:@"disease1.1" sender:self];
                    break;
                case 1:
                    NSLog(@"select 1.2");
                case 2:
                    NSLog(@"select 1.3");
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    NSLog(@"select 2.1");
                    break;
                case 1:
                    NSLog(@"select 2.2");
                default:
                    break;
            }
            break;
        case 2:
            NSLog(@"select 3:connect.");
            break;
        default:
            break;
    }
    
}




@end
