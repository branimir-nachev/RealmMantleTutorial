//
//  APIManager.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "SessionManager.h"
#import "ArticleListRequestModel.h"
#import "ArticleListResponseModel.h"

@interface APIManager : SessionManager
- (NSURLSessionDataTask*) getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel success:(void (^)(ArticleListResponseModel *responseModel))success failure:(void (^)(NSError *error))failure;
@end
