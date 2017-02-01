//
//  add_upgrade_special.m
//  Candy
//
//  Created by Killian Comerford on 29/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "add_upgrade_special.h"
#import "sweetDrawData.h"

NSInteger moneyValues[7];
//TO ADD A NEW UPGRADE: ADD THE IMAGE AND TEXT IN THE *ADDUPGRADE* METHOD,
//THEN ADD THE MONEY VALUES FOR THAT UPGRADE IN THE *FETCHMONEYVALUE* METHOD
//MAKE SURE THERE ARE ENOUGH UPGRADE SPACES IN THE ADDITEM CLASS
//THE ACTIONS THAT NEED TO BE DONE WHEN THE UPGRADE IS USED
//CAN BE EDITED IN THE *UPGRADEACTIONS* METHOD

@implementation add_upgrade_special

+(void)addUpgrade:(long)upgradeID upgradeImage:(UIImageView*)box upgradeText:(UILabel*)txt{
    //upgrade 0
    //upgrade_SlotsUnlocked
    if(upgradeID == 0){
        [box setImage:[UIImage imageNamed:@"upgrade_test"]];
        txt.text = @"test1";
    }
    //upgrade 1
    //upgrade_UsableWorkStations
    if(upgradeID == 1){
        [box setImage:[UIImage imageNamed:@"upgrade_jawbreaker"]];
        txt.text = @"somethingRather";
    }
    //upgrade 2
    //upgrade_Chew
    if(upgradeID == 2){
        [box setImage:[UIImage imageNamed:@"upgrade_wrapped"]];
        txt.text = @"lmao";
    }
}

//THIS METHOD IS SIMPLY PUT IN TO REDUCE THE NEED FOR COPIED CODE
+(void)setMoney:(long)i text:(UILabel*)txt i0:(int)i0 i1:(int)i1 i2:(int)i2 i3:(int)i3 i4:(int)i4 i5:(int)i5 i6:(int)i6{
    moneyValues[0] = i0;
    moneyValues[1] = i1;
    moneyValues[2] = i2;
    moneyValues[3] = i3;
    moneyValues[4] = i4;
    moneyValues[5] = i5;
    moneyValues[6] = i6;
    //changes the value of the money in the UILabel
    if(i < 7){
        long money = moneyValues[i];
        txt.text = [NSString stringWithFormat:@"%ld",money];
    }
    else [txt setText:@"COMPLETE"];
}

+(void)fetchMoneyValue:(long)upgradeID moneyTextBox:(UILabel*)text{
    //finds the upgrade Progress of the current upgrade(1-7 usually)
    NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValueSpecial%li",upgradeID];
    long upgradeProgress = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    //upgrade 0
    if(upgradeID == 0){
        [self setMoney:upgradeProgress text:text i0:10 i1:20 i2:30 i3:40 i4:50 i5:60 i6:70];
    }
    //upgrade 1
    if(upgradeID == 1){
        [self setMoney:upgradeProgress text:text i0:11 i1:21 i2:31 i3:41 i4:51 i5:61 i6:71];
    }
    //upgrade 2
    if(upgradeID == 2){
        [self setMoney:upgradeProgress text:text i0:12 i1:22 i2:32 i3:42 i4:52 i5:62 i6:72];
    }
}

+(void)upgradeActions:(long)upgradeID{
    //finds the upgrade Progress of the current upgrade
    //NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%li",upgradeID];
    //long upgradeProgress = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    
    //upgrade0
    if(upgradeID == 0){

    }
    //upgrade1
    if(upgradeID == 1){
        
    }
    //upgrade2
    if(upgradeID == 2){
        
    }
}


@end
