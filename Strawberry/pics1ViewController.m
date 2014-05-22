//
//  pics1ViewController.m
//  Strawberry
//
//  Created by Ted Lee on 5/22/14.
//  Copyright (c) 2014 Ted Lee. All rights reserved.
//

#import "pics1ViewController.h"
#import "URBMediaFocusViewController.h"


@interface pics1ViewController ()
@property (nonatomic, strong) UIImageView *thumbnailView1;
@property (nonatomic, strong) UIImageView *thumbnailView2;
@property (nonatomic, strong) UIImageView *thumbnailView3;
@property (nonatomic, strong) UIImageView *thumbnailView4;
@property (nonatomic, strong) UIImageView *thumbnailView5;
@property (nonatomic, strong) UIImageView *thumbnailView6;
@property (nonatomic, strong) UIImageView *remoteThumbnailView;
@property (nonatomic, strong) UIImageView *localThumbnailView;
@property (nonatomic, strong) UIImageView *panoramaThumbnailView;
@property (nonatomic, strong) UIImageView *verticalPanoramaThumbnailView;
@property (nonatomic, strong) UIImageView *animatedThumbnailView;
@property (nonatomic, strong) NSMutableData *remoteData;
@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusController;
@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation pics1ViewController

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
    self.title = @"Demo";
	
	if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	if ([self respondsToSelector:@selector(extendedLayoutIncludesOpaqueBars)]) {
		self.extendedLayoutIncludesOpaqueBars = YES;
	}
	
	self.mediaFocusController = [[URBMediaFocusViewController alloc] init];
	self.mediaFocusController.delegate = self;
	//self.mediaFocusController.shouldBlurBackground = NO;	// uncomment if you don't want the background blurred
	//self.mediaFocusController.parallaxEnabled = NO;	// uncomment if you don't want the parallax (push-back) effect
	//self.mediaFocusController.shouldDismissOnTap = NO; // uncomment if you wish to disable dismissing the view on a single tap outside image bounds
	//self.mediaFocusController.shouldDismissOnImageTap = YES;	// uncomment if you wish to support dismissing view on a single tap on the image itself
	
	self.thumbnailView1 = [self thumbnailViewWithOrigin:CGPointMake(2.0, 80.0)];
	self.thumbnailView1.image = [UIImage imageNamed:@"strawberry_d1.jpg"];
	
	self.thumbnailView2 = [self thumbnailViewWithOrigin:CGPointMake(162, 80.0)];
	self.thumbnailView2.image = [UIImage imageNamed:@"strawberry_d1.jpg"];
    
    self.thumbnailView3 = [self thumbnailViewWithOrigin:CGPointMake(2.0, 220.0)];
	self.thumbnailView3.image = [UIImage imageNamed:@"strawberry_d1.jpg"];
    
    self.thumbnailView4 = [self thumbnailViewWithOrigin:CGPointMake(162.0, 220.0)];
	self.thumbnailView4.image = [UIImage imageNamed:@"strawberry_d1.jpg"];

    self.thumbnailView5 = [self thumbnailViewWithOrigin:CGPointMake(2.0, 360.0)];
	self.thumbnailView5.image = [UIImage imageNamed:@"strawberry_d1.jpg"];
    
    self.thumbnailView6 = [self thumbnailViewWithOrigin:CGPointMake(162.0, 360.0)];
	self.thumbnailView6.image = [UIImage imageNamed:@"strawberry_d1.jpg"];
	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if (!self.remoteThumbnailView.image) {
		NSURL *remoteImageURL = [NSURL URLWithString:@"http://apollo.urban10.net/random/oiab/01_thumb.jpg"];
		NSURLRequest *request = [NSURLRequest requestWithURL:remoteImageURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10.0];
		
		if (!self.connection) {
			self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
		}
		self.remoteData = [[NSMutableData alloc] init];
		[self.connection start];
	}
}

- (BOOL)shouldAutorotate {
	return NO;
}

- (void)showFocusView:(UITapGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.view == self.thumbnailView1) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}
	else if (gestureRecognizer.view == self.thumbnailView2) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}
	else if (gestureRecognizer.view == self.thumbnailView3) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}
    else if (gestureRecognizer.view == self.thumbnailView4) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}
    else if (gestureRecognizer.view == self.thumbnailView5) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}
    else if (gestureRecognizer.view == self.thumbnailView6) {
		[self.mediaFocusController showImage:[UIImage imageNamed:@"strawberry_d1.jpg"] fromView:gestureRecognizer.view];
	}

}

- (void)addTapGestureToView:(UIView *)view {
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showFocusView:)];
	tapRecognizer.numberOfTapsRequired = 1;
	tapRecognizer.numberOfTouchesRequired = 1;
	[view addGestureRecognizer:tapRecognizer];
}

#pragma mark - URBMediaFocusViewControllerDelegate Methods

- (void)mediaFocusViewControllerDidAppear:(URBMediaFocusViewController *)mediaFocusViewController {
	NSLog(@"focus view appeared");
}

- (void)mediaFocusViewControllerDidDisappear:(URBMediaFocusViewController *)mediaFocusViewController {
	NSLog(@"focus view disappeared");
}

- (void)mediaFocusViewController:(URBMediaFocusViewController *)mediaFocusViewController didFinishLoadingImage:(UIImage *)image {
	NSLog(@"focus view finished loading image");
}

- (void)mediaFocusViewController:(URBMediaFocusViewController *)mediaFocusViewController didFailLoadingImageWithError:(NSError *)error {
	NSLog(@"focus view failed loading image: %@", error);
}

#pragma mark - NSURLConnectionDataDelegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.remoteData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	if (self.remoteData) {
		self.remoteThumbnailView.image = [UIImage imageWithData:self.remoteData];
		
	}
}

#pragma mark - Private Methods

- (UIImageView *)thumbnailViewWithOrigin:(CGPoint)origin {
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 155.0, 135.0)];
	imageView.backgroundColor = [UIColor darkGrayColor];
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.clipsToBounds = YES;
	imageView.userInteractionEnabled = YES;
	[self.view addSubview:imageView];
	[self addTapGestureToView:imageView];
	
	return imageView;
}

@end
