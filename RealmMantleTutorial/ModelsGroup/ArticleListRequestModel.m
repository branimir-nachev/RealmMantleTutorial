//
//  ArticleListRequestModel.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "ArticleListRequestModel.h"

@implementation ArticleListRequestModel

+ (NSDateFormatter *) dateFormater {
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"yyyyMMdd";
    return dateFormater;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"query":@"q",
             @"articlesFromDate":@"begin_date",
             @"articlesToDate":@"end_date"
             };
}

+ (NSValueTransformer *) articlesFromDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormater] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormater] stringFromDate:date];
    }];
}

+ (NSValueTransformer *) articlesToDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormater] dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[self dateFormater] stringFromDate:date];
    }];
}

@end
