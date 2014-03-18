//
//  Movie.h
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/12/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cast.h"

@interface Movie : NSObject
@property (nonatomic, strong) NSString *thumbnailUrl;
@property (nonatomic, strong) NSString *posterUrl;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *criticsConsensus;
@property (nonatomic, strong) NSString *mpaaRating;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *runtime;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSArray *cast;
@property (strong, nonatomic) NSString *audienceRating;
@property (strong, nonatomic) NSString *criticsRating;
@property (strong, nonatomic) NSString *audienceScore;
@property (strong, nonatomic) NSString *criticsScore;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;
@end
