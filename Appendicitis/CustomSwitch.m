//
//  CustomSwitch.m
//  Appendicitis
//
//  Created by Michael Spearman on 7/2/15.
//  Copyright (c) 2015 Michael Spearman. All rights reserved.
//

#import "CustomSwitch.h"

@interface CustomSwitch(){
    BOOL previousValue;
}
@end

@implementation CustomSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        previousValue = self.isOn;
    }
    return self;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    previousValue = self.isOn;
    self.exclusiveTouch = YES;
}


- (void)setOn:(BOOL)on animated:(BOOL)animated{
    
    [super setOn:on animated:animated];
    previousValue = on;
}


-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    if(previousValue != self.isOn){
        for (id targetForEvent in [self allTargets]) {
            for (id actionForEvent in [self actionsForTarget:targetForEvent forControlEvent:UIControlEventValueChanged]) {
                [super sendAction:NSSelectorFromString(actionForEvent) to:targetForEvent forEvent:event];
            }
        }
        previousValue = self.isOn;
    }
}

@end