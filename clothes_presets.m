//
//  clothes_presets.m
//  Candy
//
//  Created by Killian Comerford on 07/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "clothes_presets.h"

@implementation clothes_presets

+(void)addPreset:(NSMutableArray*)presets{
    [presets addObject:@"spr_presets_0"];
    [presets addObject:@"spr_presets_1"];
    [presets addObject:@"spr_presets_2"];
    [presets addObject:@"spr_presets_3"];
}
+(NSArray*)getPresets{
    NSMutableArray *presets = [[NSMutableArray alloc]init];
    [self addPreset:presets];
    return presets;
}
+(NSString*)getCurrentPreset{
    int presetID = [self getCurrentPresetID];
    return [[self getPresets] objectAtIndex:presetID];
}
+(void)setCurrentPresetID:(int)presetID{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:presetID forKey:@"clothes_presets"];
    [nd synchronize];
}
+(int)getCurrentPresetID{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"clothes_preset"];
}
//might need an addDesk methodnot sure as of yet
+(int)getAmountOfDesks{
    return (int)([[self getPresets]count]-1);
}
+(NSString*)getPresetsAtIndex:(int)index{
    return [[self getPresets] objectAtIndex:index];
}
+(NSMutableArray*)getOwnedPresetsByID{
    NSMutableArray *presetsArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"owned_clothes_presets"];
    
    if(arrayToData == nil){
        presetsArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc]init];
    }
    
    presetsArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return presetsArray;
}
+(void)addNewPresetToList:(int)presetID{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *presets = [self getOwnedPresetsByID];
    
    if(presets == nil){
        presets = [[NSMutableArray alloc]init];
    }
    
    NSNumber *newPreset = [NSNumber numberWithInt:presetID];
    
    [presets addObject:newPreset];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:presets];
    
    [nd setObject:arrayToData forKey:@"owned_clothes_presets"];
    [nd synchronize];
}
+(bool)doesOwnPreset:(int)presetID{
    NSNumber *inputID = [NSNumber numberWithUnsignedInt:presetID];
    
    if([[self getOwnedPresetsByID]containsObject:inputID]){
        return true;
    }else{
        return false;
    }
}

@end
