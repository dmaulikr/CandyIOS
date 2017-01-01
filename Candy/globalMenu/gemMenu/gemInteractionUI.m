//
//  gemInteractionUI.m
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemInteractionUI.h"
#import "gems.h"
#import "gemPotData.h"

@implementation gemInteractionUI
+(void)addInteractionUI: (SKSpriteNode*)s {
    [self addBackingSprite:s];
    [self addGemPot:s];
    [self addGemLabelValues:s];
}
+(void)addBackingSprite: (SKSpriteNode*)s {
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"gemBase"];
    back.name = @"gemBacking";
    back.position = CGPointMake(0, -s.frame.size.height/2.85);
    back.zPosition = 12;
    [s addChild:back];
}
+(void)addGemPot: (SKSpriteNode*)s {
    SKSpriteNode *pot = [SKSpriteNode spriteNodeWithImageNamed:@"gemBag"];
    pot.name = @"gemBag";
    pot.position = CGPointMake(0, -s.frame.size.height/1.4);
    pot.zPosition = 13;
    [s addChild:pot];
}
+(void)onInteraction: (SKSpriteNode*)s pos:(CGPoint)loc {
    if([s.name isEqualToString:@"gemBacking"]){
        if([gems getMiniGems] > 0){
            SKSpriteNode *ui = (SKSpriteNode*)[s parent];
            SKSpriteNode *gemPot = (SKSpriteNode*)[ui childNodeWithName:@"gemBag"];
            
            [self miniGemAnimation:ui bagNode:gemPot touchPos:loc];
        }

    }
}
+(void)miniGemAnimation: (SKSpriteNode*)s bagNode:(SKSpriteNode*)bagNode touchPos:(CGPoint)pos {
    SKSpriteNode *miniGem = [SKSpriteNode spriteNodeWithImageNamed:@"miniGems"];
    miniGem.position = pos;
    miniGem.zPosition = 15;
    [s addChild:miniGem];
    
    CGPoint bagPos = bagNode.position;
    SKAction *moveMiniGem = [SKAction moveTo:CGPointMake(bagPos.x, bagPos.y+bagNode.frame.size.height/8) duration:0.3];
    
    [miniGem runAction:moveMiniGem completion:^{
        [gemPotData addGems:1 scene:s];
        [miniGem removeFromParent];
    }];
    
    
}
+(void)addGemLabelValues: (SKSpriteNode*)s {
    SKLabelNode *gemValue = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKLabelNode *miniGemValue = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKLabelNode *tapToTrade = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    
    gemValue.name = @"label_gemValue";
    miniGemValue.name = @"label_miniGemValue";
    
    tapToTrade.zRotation = -M_PI/8;
    
    tapToTrade.position = CGPointMake(s.frame.size.width/2, 0);
    gemValue.position = CGPointMake(s.frame.size.width/2.2, s.frame.size.height/2.9);
    miniGemValue.position = CGPointMake(-s.frame.size.width/2.2, s.frame.size.height/2.9);
    
    tapToTrade.zPosition = 14;
    miniGemValue.zPosition = 14;
    gemValue.zPosition = 14;
    
    tapToTrade.fontSize = 100.0f;
    miniGemValue.fontSize = 140.0f;
    gemValue.fontSize = 140.0f;
    
    tapToTrade.fontColor = [SKColor blackColor];
    miniGemValue.fontColor = [SKColor blackColor];
    gemValue.fontColor = [SKColor blackColor];
    
    tapToTrade.text = @"TAP TO TRADE";
    gemValue.text = [gems getGemsAsString];
    miniGemValue.text = [gems getMiniGemsAsString];
    
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.4];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.4];
    SKAction *runBoth = [SKAction sequence:@[shrink, grow]];
    SKAction *repeat = [SKAction repeatActionForever:runBoth];
    
    [s addChild:tapToTrade];
    
    [tapToTrade runAction:repeat];
    
    [s addChild:gemValue];
    [s addChild:miniGemValue];
    
    
}
+(void)potAnimation: (SKSpriteNode*)s gemValue:(int)gemNo {
    
    SKSpriteNode *gem = [SKSpriteNode spriteNodeWithImageNamed:@"gem"];
    SKLabelNode *amount = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKAction *moveUp = [SKAction moveToY:0 duration:0.6];
    SKAction *fadeItem = [SKAction fadeOutWithDuration:0.6];
    SKAction *growItem = [SKAction scaleBy:2 duration:0.4];
    
    if(gemNo == 15){
        gem.position = CGPointMake(0, -s.frame.size.height/1.5);
        gem.zPosition = 16;
        gem.xScale = 1.5;
        gem.yScale = 1.5;
        [s addChild:gem];
        
        [gem runAction:moveUp];
        [gem runAction:growItem completion:^{
            [gem runAction:fadeItem completion:^{
                [gem removeFromParent];
                [gems addGems:1];
                [self refreshLabelNodes:s];
            }];
        }];

    }else {
        amount.position = CGPointMake(0, -s.frame.size.height/1.5);
        amount.fontSize = 200.0f;
        amount.fontColor = [SKColor whiteColor];
        amount.zPosition = 16;
        amount.text = [gemPotData getGemsAsString];
        
        [s addChild:amount];
        
        [amount runAction:moveUp];
        [amount runAction:fadeItem completion:^{
            [amount removeFromParent];
        }];
    }
}
+(void)refreshLabelNodes: (SKSpriteNode*)s {
    SKLabelNode *gemV = (SKLabelNode*)[s childNodeWithName:@"label_gemValue"];
    SKLabelNode *miniV = (SKLabelNode*)[s childNodeWithName:@"label_miniGemValue"];
    
    gemV.text = [gems getGemsAsString];
    miniV.text = [gems getMiniGemsAsString];
}
@end
