//
//  IntroductionViewController.m
//  Appendicitis
//
//  Created by Michael Spearman on 6/30/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "IntroductionViewController.h"

@interface IntroductionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *appendixImage;
@property (weak, nonatomic) IBOutlet UIButton *researchers_button;

@end

@implementation IntroductionViewController
- (IBAction)showAbstract:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Abstract"]];
    nav.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissAbstract)];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)dismissAbstract {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.appendixImage setImage:[UIImage imageNamed:@"pic-idea-pas"]];
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
