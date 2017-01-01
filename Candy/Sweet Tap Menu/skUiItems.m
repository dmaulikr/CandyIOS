//
//  skUiItems.m
//  Candy
//
//  Created by Callum Beckwith on 27/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "skUiItems.h"

@implementation skUiItems
+(void)addSkUI: (SKSpriteNode*)s {
    [self addBuildingIcon:s];
    [self addUpgradeBuildingButton:s];
}
+(void)addBuildingIcon: (SKSpriteNode*)s {
    SKSpriteNode *building = [SKSpriteNode spriteNodeWithImageNamed:@"starterHouse"];
    building.position = CGPointMake(0, s.frame.size.height/2.8);
    building.xScale = 0.5;
    building.yScale = 0.5;
    [s addChild:building];
}
+(void)addUpgradeBuildingButton: (SKSpriteNode*)s {
    SKSpriteNode *buildingUpgButton = [SKSpriteNode spriteNodeWithImageNamed:@"buildingButton"];
    buildingUpgButton.position = CGPointMake(0, s.frame.size.height/1.47);
    SKLabelNode *placeTitle = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    placeTitle.text = @"Old House";
    placeTitle.fontSize = 200.0f;
    placeTitle.fontColor = [SKColor blackColor];
    placeTitle.position = CGPointMake(-buildingUpgButton.frame.size.width/16, -buildingUpgButton.frame.size.height/8);
    [buildingUpgButton addChild:placeTitle];
    [s addChild:buildingUpgButton];
}
@end
