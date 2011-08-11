//
//  FixtureHelpers.m
//  Magical Record
//
//  Created by Saul Mora on 7/15/11.
//  Copyright 2011 Magical Panda Software LLC. All rights reserved.
//

#import "FixtureHelpers.h"
#import "JSONKit.h"

@implementation FixtureHelpers

+ (id) dataFromPListFixtureNamed:(NSString *)fixtureName
{
    NSString *resource = [[NSBundle mainBundle] pathForResource:fixtureName ofType:@"plist"];
    NSData *plistData = [NSData dataWithContentsOfFile:resource];
    
    return [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListImmutable format:nil error:nil];
}

+ (id) dataFromJSONFixtureNamed:(NSString *)fixtureName
{
    NSString *resource = [[NSBundle mainBundle] pathForResource:fixtureName ofType:@"json"];

#ifdef __IPHONE_5_0
    NSInputStream *inputStream = [NSInputStream inputStreamWithFileAtPath:resource];
    [inputStream open];
    
    return [NSJSONSerialization JSONObjectWithStream:inputStream options:0 error:nil];
#else
    NSData *jsonData = [NSData dataWithContentsOfFile:resource];
    return [jsonData objectFromJSONData];
#endif
    
}

@end