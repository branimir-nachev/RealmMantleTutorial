//
//  ArticleListResponseModel.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "ArticleListResponseModel.h"

@implementation ArticleListResponseModel


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"articles":@"response.docs",
             @"status":@"status"
             };
}

+ (NSValueTransformer *) articlesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ArticleModel.class];
}

@end
