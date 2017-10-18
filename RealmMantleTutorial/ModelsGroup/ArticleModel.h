//
//  ArticleModel.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 18.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface ArticleModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,copy) NSString *snippet;
@property (nonatomic,copy) NSString *url;

@end
