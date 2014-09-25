//
//  DreamingObject.m
//  DreamingKit
//
//  Created by swampx on 14-9-25.
//  Copyright (c) 2014年 swampx. All rights reserved.
//

#import "DreamingObject.h"

@implementation DreamingObject

+ (instancetype)sharedObject
{
    // object
    static NSMutableDictionary *dicObject = nil;
    if (!dicObject)
    {
        dicObject = [[NSMutableDictionary alloc] initWithCapacity:1024];
    }
    __block id object = [dicObject objectForKey:NSStringFromClass([self class])];;
    
    
    // once Token
    static NSMutableDictionary *dicOnceToken = nil;
    if (!dicOnceToken)
    {
        dicOnceToken = [[NSMutableDictionary alloc] initWithCapacity:1024];
    }
    NSNumber *numToken = [dicOnceToken objectForKey:NSStringFromClass([self class])];
    dispatch_once_t onceToken = [numToken longValue];
    
    
    dispatch_once(&onceToken, ^{
        
        object = [[self alloc] init];
        
        [dicObject setObject:object forKey:NSStringFromClass([self class])];
    });
    
    [dicOnceToken setObject:@(onceToken) forKey:NSStringFromClass([self class])];
    
    return object;
}

@end
