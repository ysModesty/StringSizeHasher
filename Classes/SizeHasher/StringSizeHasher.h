//
// Created by ysModesty on 2013/06/02.
// Copyright (c) 2013 ysModesty. All rights reserved.
// License is MIT
//
// ---Notice---
// using NSString+Hashes.h
//    Created by Klaus-Peter Dudas on 26/07/2011.
//    Copyright: Do whatever you want with this, i.e. Public Domain
// ---Notice---
//

#import <Foundation/Foundation.h>

@interface StringSizeHasher : NSObject
+(void)hashSize:(CGSize)size withStr:(NSString *)aStr;
+(CGSize)getHashedSizeWithString:(NSString *)aStr;
@end