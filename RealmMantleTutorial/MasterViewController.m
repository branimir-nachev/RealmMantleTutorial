//
//  MasterViewController.m
//  RealmMantleTutorial
//
//  Created by Branimir Nachev on 17.10.17 г..
//  Copyright © 2017 г. Branimir Nachev. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ArticleListRequestModel.h"
#import "ArticleModel.h"
#import "ArticleListResponseModel.h"
#import "APIManager.h"
#import "ArticleRealm.h"

@interface MasterViewController ()

@property RLMResults *articles;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
// ----------------------------------------------------------------------------
    
    ArticleListRequestModel *requestModel = [ArticleListRequestModel new];
    requestModel.query = @"Basketball";
    requestModel.articlesFromDate = [[ArticleListRequestModel dateFormater] dateFromString:@"20171016"];
    requestModel.articlesFromDate = [[ArticleListRequestModel dateFormater] dateFromString:@"20171018"];
    
    [[APIManager sharedManager] getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel success:^(ArticleListResponseModel *responseModel) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @autoreleasepool {
                RLMRealm *realm = [RLMRealm defaultRealm];
                [realm beginWriteTransaction];
                [realm deleteAllObjects];
                [realm commitWriteTransaction];
                
                [realm beginWriteTransaction];
                for (ArticleModel *article in responseModel.articles) {
                    ArticleRealm *articleRealm = [[ArticleRealm alloc] initWithMantleModel:article];
                    [realm addObject:articleRealm];
                }
                [realm commitWriteTransaction];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    RLMRealm *realmMainTread = [RLMRealm defaultRealm];
                    RLMResults *articles = [ArticleRealm allObjectsInRealm:realmMainTread];
                    self.articles = articles;
                    [self.tableView reloadData];
                    NSLog(@"The number is %d",(int) [self.articles count]);
                    
                });
            }
        });
    } failure:^(NSError *error) {
        self.articles = [ArticleRealm allObjects];
        [self.tableView reloadData];
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ArticleRealm *object = self.articles[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ArticleRealm *object = self.articles[indexPath.row];
    cell.textLabel.text = [object snippet];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}


@end
