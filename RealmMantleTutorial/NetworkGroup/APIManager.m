//
//  APIManager.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "APIManager.h"

static NSString *const kArticlesListPath = @"/svc/search/v2/articlesearch.json";
static NSString *const kApiKey = @"059575082d6a4d5fb2de7268b0a7111d";

@implementation APIManager

- (NSURLSessionDataTask*) getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel success:(void (^)(ArticleListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure {
    
    NSDictionary *parameters = [MTLJSONAdapter JSONDictionaryFromModel:requestModel error:nil];
    NSMutableDictionary *parametersWithKey = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [parametersWithKey setObject:kApiKey forKey:@"api-key"];
    
    return [self GET:kArticlesListPath parameters:parametersWithKey progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDictionary = (NSDictionary*) responseObject;
        
        NSError *error;
        ArticleListResponseModel *list = [MTLJSONAdapter modelOfClass:[ArticleListResponseModel class] fromJSONDictionary:responseDictionary error:&error];
        success(list);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure (error);
    }];
}

@end
