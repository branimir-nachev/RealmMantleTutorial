//
//  SessionManager.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 17.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface SessionManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
