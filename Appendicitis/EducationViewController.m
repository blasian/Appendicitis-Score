//
//  EducationViewController.m
//  Appendicitis
//
//  Created by Michael Spearman on 6/30/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *abstractButton;

@end

@implementation EducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // abstract button alignment
    self.abstractButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.abstractButton setTitle:@"Developed by Samuel, \nValidated by Goldman et. al." forState:UIControlStateNormal];
    self.abstractButton.titleLabel.numberOfLines = 2;
    [self findSubviews:self.view];
}

- (void)findSubviews:(UIView*)view {
    
    for (UIView *subview in view.subviews) {
        [self findSubviews:subview];
    }
    
    // Setup hanging-line indentations for bullet points
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setParagraphSpacing:4];
    [paragraphStyle setParagraphSpacingBefore:3];
    [paragraphStyle setFirstLineHeadIndent:0.0f];  // First line is the one with bullet point
    [paragraphStyle setHeadIndent:10.5f];    // Set the indent for given bullet character and size font
    
    if([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel*)view;
        if(label.tag == 1) {
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle
                                     range:NSMakeRange(0, [label.text length])];
            label.attributedText = attributedString;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAbstract:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Abstract"]];
    nav.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissAbstract)];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)dismissAbstract {
    [self dismissViewControllerAnimated:YES completion:nil];
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
