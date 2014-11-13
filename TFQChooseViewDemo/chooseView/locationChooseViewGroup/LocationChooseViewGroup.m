//
//  LocationChooseViewGroup.m
//  TFQChooseViewDemo
//
//  Created by admin on 14-11-11.
//  Copyright (c) 2014年 TFQ. All rights reserved.
//

#import "LocationChooseViewGroup.h"
static NSArray* __locations;

@interface LocationChooseViewGroup()<ChooseViewGroupDatasource,ChooseViewGroupDelegate>{
}
@property (nonatomic,readonly)NSArray*locations;

@end
@implementation LocationChooseViewGroup
-(NSArray *)locations{
    if (!__locations) {
        NSString* file=[[NSBundle mainBundle] pathForResource:@"locations" ofType:nil];
        __locations=[NSKeyedUnarchiver unarchiveObjectWithFile:file];
    }
    return  __locations;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.delegate=self;
        self.datasource=self;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate=self;
        self.datasource=self;
    }
    return self;
}

-(NSInteger)numberOfChooseViewInGroup:(ChooseViewGroup *)chooseViewGroup{
    return 3;
    
}

-(NSString *)chooseViewGroup:(ChooseViewGroup *)chooseViewGroup valueOfIndex:(NSInteger)index atChooseViewOfIndex:(NSInteger)chooseViewIndex
{
    id value=[[self chooseViewGroup:chooseViewGroup subDataWithIndex:chooseViewIndex] objectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return  value;
    }else if ([value isKindOfClass:[NSDictionary class]]){
        return [[value allKeys] objectAtIndex:0];
    }
    return nil;
}
-(NSInteger)chooseViewGroup:(ChooseViewGroup *)chooseViewGroup numberOfChooseViewAtIndex:(NSInteger)index
{
    return [self chooseViewGroup:chooseViewGroup subDataWithIndex:index].count;
}

-(NSArray*)chooseViewGroup:(ChooseViewGroup *)chooseViewGroup subDataWithIndex:(NSInteger)index{
    id temp;
    if (index) {
        temp=[self chooseViewGroup:chooseViewGroup subDataWithIndex:index-1];
        int i=[chooseViewGroup valueIndexOfChooseViewIndex:index-1];
        
        temp=[[self chooseViewGroup:chooseViewGroup subDataWithIndex:index-1]  objectAtIndex:i];
        temp= [temp objectForKey:[[temp keyEnumerator]nextObject]];
        
    }else{
        temp=self.locations;
    }
    return temp;
}
@end
