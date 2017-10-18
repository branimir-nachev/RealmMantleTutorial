//
//  ArticleRealm.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "ArticleRealm.h"

@implementation ArticleRealm

-(id) initWithMantleModel:(ArticleModel*) articleModel{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.snippet = articleModel.snippet;
    self.url = articleModel.url;
    
    return self;
    
}

@end
