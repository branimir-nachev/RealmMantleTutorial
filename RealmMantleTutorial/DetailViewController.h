//
//  DetailViewController.h
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 17.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleRealm.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ArticleRealm *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

