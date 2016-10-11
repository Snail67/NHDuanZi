//
//  MyLog.m
//  MyLog
//
//  Created by sunshukang on 15-9-17.
//  Copyright (c) 2015年 sunshukang. All rights reserved.
//

#import "MyLog.h"

@implementation MyLog
+ (void)output:(const char*)fileName
       lineNumber:(int)lineNumber
            input:(NSString*)input, ...{
    va_list argList;
    NSString *filePath, *formatStr;
    filePath = [[NSString alloc] initWithBytes:fileName
                                        length:strlen(fileName)
                                      encoding:NSUTF8StringEncoding];
    va_start(argList, input);
    formatStr = [[NSString alloc] initWithFormat:input
                                       arguments:argList];
    va_end(argList);
    printf("%s\n",[[NSString stringWithFormat:@"%@[%d] %@", [filePath lastPathComponent], lineNumber, formatStr] UTF8String]);
}
@end


@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    return strM;
    
    
    
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [strM appendString:@"}\n"];
    return strM;
}

@end
