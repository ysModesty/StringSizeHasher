//
// Created by ysModesty on 2013/06/02.
// Copyright (c) 2013 ysModesty. All rights reserved.
// License is MIT

#import "StringSizeHasher.h"
#import "NSString+Hashes.h"

@implementation StringSizeHasher

static NSLock *lockHash;

//initialize (lock object)
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lockHash = [NSLock new];
    });
}
//get hash managing object ( initialize when first call)
+(NSMutableDictionary *)getHasher
{
    static NSMutableDictionary *sizeHasherByStr;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizeHasherByStr = @{}.mutableCopy;
    });

    return sizeHasherByStr;
}
//CGSize hash by NSString
+(void)hashSize:(CGSize)size withStr:(NSString *)aStr
{
    if (aStr == nil || ![aStr isKindOfClass:[NSString class]] || aStr.length <= 0 ) {
        return;
    }
    [lockHash lock];
    [[self getHasher] setObject:[NSValue valueWithCGSize:size] forKey:[aStr sha512]];
    [lockHash unlock];
}
//get hashed CGSize by NSString
+(CGSize)getHashedSizeWithString:(NSString *)aStr
{
    if (aStr == nil || ![aStr isKindOfClass:[NSString class]] || aStr.length <= 0 ) {
        return CGSizeZero;
    }
    [lockHash lock];
    NSValue *value = [[self getHasher] objectForKey:[aStr sha512]];
    [lockHash unlock];
    return value.CGSizeValue;
}



@end