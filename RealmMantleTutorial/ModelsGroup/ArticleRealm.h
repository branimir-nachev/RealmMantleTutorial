//
//  ArticleRealm.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "Realm.h"
#import "RLMObject.h"
#include "ArticleModel.h"

@interface ArticleRealm : RLMObject

@property NSString *snippet;
@property NSString *url;

-(id) initWithMantleModel:(ArticleModel*) articleModel;
@end
