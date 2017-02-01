//
//  unlock_upgrade.m
//  Candy
//
//  Created by Killian Comerford on 26/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "unlock_upgrade.h"
#import "money.h"

NSInteger unlockValues[10];

@implementation unlock_upgrade
+(void)fetchUnlockValue:(long)upgradeID returnValue:(long)returnVal{
    //the number between the square brackets represents which upgrade it is
    unlockValues[0] = 10;
    unlockValues[1] = 11;
    unlockValues[2] = 12;
    unlockValues[3] = 13;
    unlockValues[4] = 14;
    unlockValues[5] = 15;
    unlockValues[6] = 16;
    
    returnVal = unlockValues[upgradeID];
}
+(void)update_background:(UIImageView*)backImg upgradeID:(long)ID{
    //changes the background depending on whether or not the upgrade is available
    long UnlockVal;
    [self fetchUnlockValue:ID returnValue:UnlockVal];
    long moneyVal = [money getBalanceAsString].integerValue;
    
    if(moneyVal >= UnlockVal){
        backImg.image = [UIImage imageNamed:@"unlock_cost_green"];
    }
    else backImg.image = [UIImage imageNamed:@"unlock_cost_red"];
}
@end
