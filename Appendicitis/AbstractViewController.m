//
//  AbstractViewController.m
//  Appendicitis
//
//  Created by Michael Spearman on 6/30/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "AbstractViewController.h"

@interface AbstractViewController ()

@property (weak, nonatomic) IBOutlet UITextView *abstractText;

@end

@implementation AbstractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.abstractText scrollRangeToVisible:NSMakeRange(0, 0)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
