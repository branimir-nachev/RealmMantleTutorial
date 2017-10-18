//
//  ArticleListRequestModel.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "Mantle.h"

@interface ArticleListRequestModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,copy) NSString *query;
@property (nonatomic,copy) NSDate *articlesFromDate;
@property (nonatomic,copy) NSDate *articlesToDate;

+ (NSDateFormatter *) dateFormater;

@end
