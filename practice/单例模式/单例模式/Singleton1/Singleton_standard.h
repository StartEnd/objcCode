//
//  Singleton_standard.h
//  单例模式
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton_standard : NSObject<NSCopying>

+ (instancetype)sharedInstanse;

@end
