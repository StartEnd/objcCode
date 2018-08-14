//
//  main.m
//  单例模式
//
//  Created by Mr.Song on 2018/8/7.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton_standard.h"
#import "Singleton_thread.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Singleton_standard *s1 = [[Singleton_standard alloc] init];
        Singleton_standard *s2 = [Singleton_standard sharedInstanse];
        NSLog(@"---地址对比-----\n%@\n%@\n-----------",s1,s2);
        
        Singleton_thread   *s3 = [Singleton_thread sharedInstance];
        Singleton_thread   *s4 = [[Singleton_thread alloc] init];
        NSLog(@"---地址对比-----\n%@\n%@\n-----------",s3,s4);
    }
    return 0;
}


