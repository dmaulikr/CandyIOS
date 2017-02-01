//
//  upgrade_regular_handler.m
//  Candy
//
//  Created by Killian Comerford on 29/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "upgrade_regular_handler.h"
#import "add_upgrade_regular.h"
#import "money.h"

@implementation upgrade_regular_handler

+(void)InitializeUpgrades:(UIScrollView*)view ID:(int)ID yVal:(double)y{
    //backImage
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0,y,view.frame.size.width, view.frame.size.width/4)];
    back.image = [UIImage imageNamed:@"upgradeBar"];
    
    
    //upgradeProgressTexture
    UIImageView *upgradeProgress = [[UIImageView alloc] initWithFrame:CGRectMake(29*(view.frame.size.width/128),y+3*(view.frame.size.width/128),6*(view.frame.size.width/128), 24*(view.frame.size.width/128))];
    upgradeProgress.tag = 450+ID;
    
    
    //this code fetches the image used depending on which upgrade it is on
    NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%i", ID];
    long upgrd = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
    upgradeValue = [NSString stringWithFormat:@"upgradeProgress%li",upgrd];
    upgradeProgress.image = [UIImage imageNamed:upgradeValue];
    
    
    //UpgradeButton
    SEL aSel = @selector(buttonAction:);
    UIButton *upgradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [upgradeButton addTarget:self action:aSel forControlEvents:UIControlEventTouchUpInside];
    [upgradeButton setTitle:@""forState:UIControlStateNormal];
    upgradeButton.frame = CGRectMake(85*(view.frame.size.width/128), y+ 3*(view.frame.size.width/128), 40*(view.frame.size.width/128), 24*(view.frame.size.width / 128));
    [upgradeButton setImage:[UIImage imageNamed:@"upgradeButton"] forState:UIControlStateNormal];
    [upgradeButton setImage:[UIImage imageNamed:@"upgradeButtonPressed"] forState:UIControlStateSelected];
    upgradeButton.tag = 400+ID;
    
    //Upgrade Image
    UIImageView *upgradeImage = [[UIImageView alloc] initWithFrame:CGRectMake(5*(view.frame.size.width/128),y+4*(view.frame.size.width/128),22*(view.frame.size.width/128), 20*(view.frame.size.width/128))];
    
    //Upgrade Text
    UIFont *infoFont = [UIFont fontWithName:@"Coder's-Crux" size:17];
    UILabel *infoText = [[UILabel alloc]initWithFrame:CGRectMake(38*(view.frame.size.width/128), y+4*(view.frame.size.width/128), 37*(view.frame.size.width/128), 8*(view.frame.size.width/128))];
    infoText.font = infoFont;
    infoText.text = @"test";
    
    
    //Upgrade Money Text
    UIFont *moneyFont = [UIFont fontWithName:@"Coder's-Crux" size:22];
    UILabel *moneyText = [[UILabel alloc]initWithFrame:CGRectMake(49*(view.frame.size.width/128), y+17*(view.frame.size.width/128), 37*(view.frame.size.width/128), 8*(view.frame.size.width/128))];
    moneyText.font = moneyFont;
    moneyText.tag = 60000+ID;
    
    
    //changing the values depending on the upgrade
    [add_upgrade_regular addUpgrade:ID upgradeImage:upgradeImage upgradeText:infoText];
    [add_upgrade_regular fetchMoneyValue:ID moneyTextBox:moneyText];
    
    
    //Adding them to the scene
    [view addSubview:back];
    [view addSubview:upgradeProgress];
    
    [view addSubview:upgradeButton];
    
    [view addSubview:infoText];
    [view addSubview:moneyText];
    [view addSubview:upgradeImage];
}

+(void)buttonAction:(id)sender{
    //initialize variables needed
    UIButton *upgradeButton = (UIButton*)sender;
    UIView *view = (UIView*)[sender superview];
    long newID = upgradeButton.tag - 400;
    long barID = 450+newID;
    long moneyTextID = 60000 + newID;
    UILabel *moneyText = (UILabel*)[view viewWithTag:moneyTextID];
    
    [add_upgrade_regular fetchMoneyValue:newID moneyTextBox:moneyText];
    long unlockVal = moneyText.text.integerValue;
    long moneyVal = [money getBalanceAsString].integerValue;
    
    if(moneyVal >= unlockVal){
        //changes the button texture for .2 seconds
        upgradeButton.selected = !upgradeButton.selected;
        SEL selTemp = @selector(switchTexture:);
        [self performSelector:selTemp withObject:upgradeButton afterDelay:0.2];
        
        //changes the NSValue for the upgrade when the button is pressed
        NSString *upgradeValue = [NSString stringWithFormat:@"CurrentValue%li",newID];
        long upgradeProgress = [[NSUserDefaults standardUserDefaults] integerForKey:upgradeValue];
        if(upgradeProgress < 7){
            upgradeProgress++;
        }
        [[NSUserDefaults standardUserDefaults] setInteger:upgradeProgress forKey:upgradeValue];
        
        //handles all the updates when the upgrade button is pressed
        [add_upgrade_regular fetchMoneyValue:newID moneyTextBox:moneyText];
        [add_upgrade_regular upgradeActions:newID];
        
        //changes the progress bar image
        NSString *newTexture = nil;
        newTexture = [NSString stringWithFormat:@"upgradeProgress%li",upgradeProgress];
        UIImageView *progressbar = (UIImageView*)[view viewWithTag:barID];
        [progressbar setImage:[UIImage imageNamed:newTexture]];
        
        [money addBalance:-(int)unlockVal];
    }
    else{
        //what happens if they dont have sufficient funds
        //needs to be added
    }
}
+(void)switchTexture:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}
@end
