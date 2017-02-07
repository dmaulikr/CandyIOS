//
//  clothes_presets.h
//  Candy
//
//  Created by Killian Comerford on 07/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface clothes_presets : SKScene
+(void)addPreset:(NSMutableArray*)presets;
+(NSArray*)getPresets;
+(NSString*)getCurrentPreset;
+(void)setCurrentPresetID:(int)presetID;
+(int)getCurrentPresetID;
+(int)getAmountOfDesks;
+(NSString*)getPresetsAtIndex:(int)index;
+(NSMutableArray*)getOwnedPresetsByID;
+(void)addNewPresetToList:(int)presetID;
+(bool)doesOwnPreset:(int)presetID;
@end
