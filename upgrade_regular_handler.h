//
//  upgrade_regular_handler.h
//  Candy
//
//  Created by Killian Comerford on 29/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upgrade_regular_handler : UIImageView
+(void)InitializeUpgrades:(UIScrollView*)view ID:(int)ID yVal:(double)y;
+(void)buttonAction:(id)sender;
+(void)switchTexture:(id)sender;
@end
