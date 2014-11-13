//
//  ChooseViewGroup.m
//  E_Education
//
//  Created by admin on 14-11-11.
//  Copyright (c) 2014年 TFQ. All rights reserved.
//

#import "ChooseViewGroup.h"
#import "ChooseViewStylePulldown.h"
#define tagWithIndex(index) 0xadc-index
#define indexOfChooseView(chooseView) 0xadc-chooseView.tag
@implementation ChooseViewGroup

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    int count=[self.datasource numberOfChooseViewInGroup:self];
    CGFloat spacing=8;
    if([self.datasource respondsToSelector:@selector(spacingOfChooseViewGroup:)])
        spacing=[self.datasource spacingOfChooseViewGroup:self];
    CGFloat leading=0;
    CGFloat width=(self.frame.size.width+spacing)/count-spacing;
    for (int i=0;i<count;i++){
        ChooseView * chooseView=(ChooseView *)[self viewWithTag:tagWithIndex(i)];
        if (!chooseView) {
            
            chooseView=[[ChooseViewStylePulldown alloc] initWithFrame:CGRectZero];
            chooseView.tag=tagWithIndex(i);
            chooseView.datasource=self;
            chooseView.delegate=self;
            [self addSubview:chooseView];
        }
        if ([self.datasource respondsToSelector:@selector(chooseViewGroup:titleOfChooseViewAtIndex:)])
            chooseView.title=[self.datasource chooseViewGroup:self titleOfChooseViewAtIndex:i];
      
        if([self.datasource respondsToSelector:@selector(chooseViewGroup:titleOfChooseViewAtIndex:)])
            width=[self.datasource chooseViewGroup:self widthOfChooseViewAtIndex:i];
        
        chooseView.frame=CGRectMake(leading, 0, width, self.frame.size.height);
        leading+=width+spacing;
    }
}
-(NSInteger)numberOfComponentsInChooseView:(ChooseView *)chooseView{
    return 1;
}
-(NSInteger)chooseView:(ChooseView *)chooseView numberOfRowsInComponent:(NSInteger)componen{
    return [self.datasource chooseViewGroup:self numberOfChooseViewAtIndex:indexOfChooseView(chooseView)] ;
}
-(NSString *)chooseView:(ChooseView *)chooseView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.datasource chooseViewGroup:self valueOfIndex:row atChooseViewOfIndex:indexOfChooseView(chooseView)];
}
-(NSInteger)valueIndexOfChooseViewIndex:(NSInteger)index{
    ChooseView * chooseView=(ChooseView *)[self viewWithTag:tagWithIndex(index)];
    return [chooseView selectedRowInComponent:0];
}
-(void)chooseViewSureButtonClicked:(ChooseView *)chooseView{
    ChooseView*temp = (id)[self viewWithTag:chooseView.tag-1];
    if (temp){
    temp.value = [self.datasource chooseViewGroup:self valueOfIndex:0 atChooseViewOfIndex:indexOfChooseView(temp)];
        [self chooseViewSureButtonClicked:temp];
    }else{
        
    }
}
-(NSString *)valueOfChooseViewIndex:(NSInteger)index{
    ChooseView * chooseView=(ChooseView *)[self viewWithTag:tagWithIndex(index)];

    return chooseView.value;
}
@end
