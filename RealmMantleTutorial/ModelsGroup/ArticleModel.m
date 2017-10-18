//
//  ArticleModel.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"snippet":@"snippet",
             @"url":@"web_url"
             };
}

@end
