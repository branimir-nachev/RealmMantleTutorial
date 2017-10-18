//
//  ArticleListResponseModel.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "MTLModel.h"
#import "ArticleModel.h"

@interface ArticleListResponseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,copy) NSArray *articles;
@property (nonatomic,copy) NSString *status;

@end
