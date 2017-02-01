//
//  unlock_upgrade.h
//  Candy
//
//  Created by Killian Comerford on 26/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface unlock_upgrade : UIImageView
+(void)fetchUnlockValue:(long)upgradeID returnValue:(long)returnVal;
+(void)update_background:(UIImageView*)backImg upgradeID:(long)ID;
@end
