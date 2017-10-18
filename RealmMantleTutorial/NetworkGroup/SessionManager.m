//
//  SessionManager.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 17.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "SessionManager.h"

static NSString *const kBaseURL = @"https://api.nytimes.com";

@implementation SessionManager

-(id) init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

+(id) sharedManager {
    static SessionManager *_sharedManager = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

@end
