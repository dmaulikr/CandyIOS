//
//  upgrade_handler_regular.h
//  Candy
//
//  Created by Killian Comerford on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface upgrade_handler_regular : UIImageView
+(void)InitializeRegularUpgrade:(UIScrollView*)s ID:(int)ID yPos:(int)y;
+(void)buttonAction:(id)sender;
+(void)switchTexture:(id)sender;
@end
