//
//  MovieListViewController.h
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/12/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AFNetworking.h"
#import "MovieDetailViewController.h"
#import "MovieCell.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "MTReachabilityManager.h"

@interface MovieListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@end
