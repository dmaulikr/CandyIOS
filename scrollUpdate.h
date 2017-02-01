//
//  scrollUpdate.h
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface scrollUpdate : UIView
+(void)initializeScroll:(UIScrollView*)s uiView:(UIView*)v;
+(void)Show:(UIView*)v;
+(void)Hide:(UIView*)v;
+(void)initializeRegularScroll:(SKScene*)s;
+(void)initializeSpecialScroll:(SKScene*)s;
+(void)switchMenu;
@end
