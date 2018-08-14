//
//  Singleton_standard.m
//  单例模式--标准单例
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "Singleton_standard.h"

@implementation Singleton_standard

static Singleton_standard *instanse = nil;

+ (instancetype)sharedInstanse {
    if(instanse == nil) {
        instanse = [[Singleton_standard alloc] init];
    }
    return instanse;
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    if(instanse == nil) {
        instanse = [super allocWithZone:zone];
    }
    return instanse;
}


@end
