//
//  scrollUpdate.m
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "scrollUpdate.h" 
#import "AddItem.h"
#import "upgrade_regular_handler.h"
#import "upgrade_special_handler.h"

UIScrollView* scrollRegular = nil;
UIScrollView* scrollSpecial = nil;

NSInteger regularUpgrades = 6;
NSInteger specialUpgrades = 3;

UIImageView *img1 = nil;
@implementation scrollUpdate
+(void)initializeRegularScroll:(SKScene*)s{
    scrollRegular = [[UIScrollView alloc]initWithFrame:CGRectMake(s.view.frame.size.width / 19, s.view.frame.size.height / 4.2, 8.95*(s.view.frame.size.width /10), 2.38*(s.view.frame.size.height / 4))];
    [scrollRegular setContentSize:CGSizeMake(scrollRegular.frame.size.width, (regularUpgrades+1)*32*(scrollRegular.frame.size.width / 128))];
    scrollRegular.backgroundColor = [UIColor colorWithRed:121.0f/255.0f green:75.0f/255.0f blue:148.0f/255.0f alpha:1];
    scrollRegular.tag = 1;
    scrollRegular.hidden = true;
    [scrollRegular setShowsVerticalScrollIndicator:NO];
    [s.view addSubview:scrollRegular];
    
    //this adds the items to the uiScrollView(scrollRegular)
    for(int i = 0; i<= regularUpgrades; i++){
        [upgrade_regular_handler InitializeUpgrades:scrollRegular ID:i yVal:i*(scrollRegular.frame.size.width/4)];
    }
}
+(void)initializeSpecialScroll:(SKScene*)s{
    scrollSpecial = [[UIScrollView alloc]initWithFrame:CGRectMake(s.view.frame.size.width / 19, s.view.frame.size.height / 4.2, 8.95*(s.view.frame.size.width /10), 2.38*(s.view.frame.size.height / 4))];
    
    [scrollSpecial setContentSize:CGSizeMake(scrollSpecial.frame.size.width, (specialUpgrades+1)*32*(scrollSpecial.frame.size.width / 128))];
    scrollSpecial.backgroundColor = [UIColor colorWithRed:87.0f/255.0f green:195.0f/255.0f blue:88.0f/255.0f alpha:1];
    scrollSpecial.tag = 10000;
    scrollSpecial.hidden = true;
    [scrollSpecial setShowsVerticalScrollIndicator:NO];
    
    [s.view addSubview:scrollSpecial];
    
    //this adds the items to the uiScrollView(scrollSpecial)
    for(int i = 0; i<= specialUpgrades; i++){
        [upgrade_special_handler InitializeUpgrades:scrollSpecial ID:i yVal:i*(scrollSpecial.frame.size.width/4)];
    }
}
+(void)initializeScroll:(UIScrollView*)s uiView:(UIView*)v{
    
}
+(void)Show:(UIView*)v{
    UIScrollView *updateView = (UIScrollView*)[v viewWithTag:1];
    updateView.hidden = false;
    
}
+(void)Hide:(UIView*)v{
    UIScrollView *updateView = (UIScrollView*)[v viewWithTag:1];
    updateView.hidden = true;
    UIScrollView *specialView = (UIScrollView*)[v viewWithTag:10000];
    specialView.hidden = true;
    
}
+(void)switchMenu{
    if(!scrollRegular.hidden){
        scrollSpecial.hidden = false;
        scrollRegular.hidden = true;
    }
    else if(!scrollSpecial.hidden){
        scrollRegular.hidden = false;
        scrollSpecial.hidden = true;
    }
}
@end
