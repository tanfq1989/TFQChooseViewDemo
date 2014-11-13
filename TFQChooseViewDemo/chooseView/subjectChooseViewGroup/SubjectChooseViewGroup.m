//
//  SubjectChooseViewGroup.m
//  TFQChooseViewDemo
//
//  Created by admin on 14-11-12.
//  Copyright (c) 2014年 TFQ. All rights reserved.
//

#import "SubjectChooseViewGroup.h"
static NSArray* __subjects;

@implementation SubjectChooseViewGroup

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSArray *)locations{
    if (!__subjects) {
        NSString* file=[[NSBundle mainBundle] pathForResource:@"subjects" ofType:nil];
        __subjects=[NSKeyedUnarchiver unarchiveObjectWithFile:file];
    }
    return  __subjects;
}
-(NSInteger)numberOfChooseViewInGroup:(ChooseViewGroup *)chooseViewGroup{
    return 2;
    
}
@end
