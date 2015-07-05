//
//  RootViewController.m
//  Appendicitis
//
//  Created by Michael Spearman on 6/30/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "EducationViewController.h"
#import "IntroductionViewController.h"

@interface RootViewController ()

@property NSArray *viewControllers;
@property ViewController *scoreBoardVC;
@property IntroductionViewController *introductionVC;
@property EducationViewController *educationVC;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;

    
    _scoreBoardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreBoard"];
    _introductionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Introduction"];
    _educationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Education"];
    
    _viewControllers = @[_introductionVC];
    [self.pageViewController setViewControllers:_viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupPageControlAppearance {
    UIPageControl * pageControl = [[self.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(class = %@)", [UIPageControl class]]] lastObject];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[IntroductionViewController class]]) {
        return nil;
    } else if ([viewController isKindOfClass:[ViewController class]]) {
        return _introductionVC;
    } else if ([viewController isKindOfClass:[EducationViewController class]]) {
        return _scoreBoardVC;
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[EducationViewController class]]) {
        return nil;
    } else if ([viewController isKindOfClass:[IntroductionViewController class]]) {
        return _scoreBoardVC;
    } else if ([viewController isKindOfClass:[ViewController class]]) {
        return _educationVC;
    }
    return nil;
}

- (NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    [self setupPageControlAppearance];
    return 3;
}

- (NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    if ([[pageViewController.viewControllers firstObject] isKindOfClass:[IntroductionViewController class]]) {
        return 0;
    } else if ([[pageViewController.viewControllers firstObject] isKindOfClass:[ViewController class]]) {
        return 1;
    } else if ([[pageViewController.viewControllers firstObject] isKindOfClass:[EducationViewController class]]){
        return 2;
    }
    return -1;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
