//
//  lollyPacket.h
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface lollyPacket : SKSpriteNode
+(NSArray*)contentList;
+(void)addContentSection: (SKSpriteNode*)s;
+(void)createRandomSlider: (SKScene*)s yPos:(float)yVal;
+(int)getBrandValue;
+(void)upgradeBrandValue;
@end
