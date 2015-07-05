//
//  ViewController.m
//  Appendicitis
//
//  Created by Michael Spearman on 6/28/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *total_label;
@property int total;
@property NSString *alertTitle;
@property NSString *alertMessage;
@property (weak, nonatomic) IBOutlet UILabel *diagnosis_label;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.total_label.textColor = [UIColor greenColor];
    self.diagnosis_label.textColor = [UIColor greenColor];
    self.diagnosis_label.text = @"Child unlikely to have appendicitis. Sending home with clear instructions when to return is appropriate.";
    self.tabBarController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)displayInfoBox:(id)sender {
    [self getAlertInfo:(NSInteger)((UIButton*)sender).tag];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.alertTitle message:self.alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

}

- (void) getAlertInfo:(NSInteger)tag {
    switch (tag) {
            // Nausea/Vomitting
        case 1:
            self.alertTitle = @"Nausea/Vomitting";
            self.alertMessage = @"An unpleasant sensation often leading to the urge to vomit, now or before coming to see the doctor.";
            break;
            // Anorexia
        case 2:
            self.alertTitle = @"Anorexia";
            self.alertMessage = @"Lack or loss of appetite now or before coming to see the doctor.";
            break;
            // Fever
        case 3:
            self.alertTitle = @"Fever > 38C/100.6F";
            self.alertMessage = @"A body temperature greater than 38C or 100.6 F.";
            break;
            // Migration of Pain
        case 4:
            self.alertTitle = @"Migration of Pain";
            self.alertMessage = @"Pain that is non-persistent and moving from one area to another.";
            break;
            // Leukocytosis
        case 5:
            self.alertTitle = @"Leukocytosis > 10,000";
            self.alertMessage = @"White blood cell count (the leukocyte count) above 10,000 white cells per cubic millimeter of blood.";
            break;
            // Neutrophelia
        case 6:
            self.alertTitle = @"Neutrophilis > 7,500";
            self.alertMessage = @"Neutrophils above 7,500 white cells per cubic millimeter of blood.";
            break;
            // RLQ Tenderness
        case 7:
            self.alertTitle = @"RLQ Tenderness";
            self.alertMessage = @"Pain or discomfort when Right Lower Quadrant is touched.";
            break;
            // Hopping/Percussion Tenderness
        case 8:
            self.alertTitle = @"Hopping/Percussion Tenderness";
            self.alertMessage = @"Pain or discomfort when the child is asked to cough or when examining the abdomen.";
            break;
            // Score
        case 9:
            self.alertTitle = @"What does your score mean?";
            self.alertMessage = @"A score of 5 or 6 is compatible with the diagnosis of acute appendicitis. A score of 7 or 8 indicates a probable appendicitis, and a score of 9 or 10 indicates a very probable acute appendicitis. Likelihood of appendicitis based on symptoms, signs, and lab data.";
            break;
        default:
            break;
    }
}

- (IBAction)symptomSwitched:(id)sender {
    if (((UISwitch *)sender).on)
        self.total+=(int)((UISwitch *)sender).tag;
    else
        self.total-=(int)((UISwitch *)sender).tag;
    
    [self updateScore];
}

- (void)updateScore {
    [self.total_label setText:[NSString stringWithFormat:@"%d", self.total]];
    if (self.total <= 2) {
        self.total_label.textColor = [UIColor greenColor];
        self.diagnosis_label.textColor = [UIColor greenColor];
        self.diagnosis_label.text = @"Child unlikely to have appendicitis. Sending home with clear instructions when to return is appropriate.";
    } else if (self.total <= 6) {
        self.total_label.textColor = [UIColor orangeColor];
        self.diagnosis_label.textColor = [UIColor orangeColor];
        self.diagnosis_label.text = @"Further observation and/or investigation for possible appendicitis is warrented.";
    } else {
        self.total_label.textColor = [UIColor redColor];
        self.diagnosis_label.textColor = [UIColor redColor];
        self.diagnosis_label.text = @"The child has a high likelihood of appendicitis, surgical intervention is warrented.";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
