//
//  taps.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "taps.h"
#import "coinBarSprite.h"
#import "money.h"
#import "combo.h"
#import "comboBar.h"
#import "comboTimer.h"
#import "defaultSweet.h"
#import "nodeToParticle.h"
#import "menuHandler.h"
#import "sweetnessSlider.h"
#import "determineSweetTap.h"
#import "fiftyTapBonus.h"
#import "messageSprite.h"

@implementation taps
+(void)onPressed: (SKScene *)s location:(CGPoint)p {
    SKNode *obj = [s nodeAtPoint:p];
    if([menuHandler getCurrentMenu] == 4){
        if(![messageSprite isMessageVisable]){
            [coinBarSprite updateText:s];
            [determineSweetTap spawn:s location:p];
            [fiftyTapBonus tapCollector:s];
            [fiftyTapBonus onTouchofBonus:(SKSpriteNode*)obj scene:s];
        }else {
            [messageSprite removeAllMessageBoxes:s];
        }
    }
}
+(void)onRelease: (SKScene*)s {
    
}
+(void)onMovement: (SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    [sweetnessSlider moveSlider:(SKSpriteNode*)n location:p];
}
@end
