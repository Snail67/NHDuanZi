//
//  MyLog.h
//  MyLog
//
//  Created by sunshukang on 15-9-17.
//  Copyright (c) 2015年 sunshukang. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define NSLog(format, ...) ([MyLog output:__FILE__ lineNumber:__LINE__ input:(format), ## __VA_ARGS__])
#else
#define NSLog(format, ...)
#endif

@interface MyLog : NSObject

+ (void)output:(const char*)fileName lineNumber:(int)lineNumber input:(NSString*)input, ...;

@end

@interface NSArray (Log)

@end

@interface NSDictionary (Log)

@end
