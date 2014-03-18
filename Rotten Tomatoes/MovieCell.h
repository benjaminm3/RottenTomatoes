//
//  MovieCell.h
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/16/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

@interface MovieCell : UITableViewCell
@property (nonatomic, strong) Movie *movie;

@end
