//
//  Movie.m
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/12/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "Movie.h"


@implementation Movie
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.id = dictionary[@"id"];
        self.thumbnailUrl = [dictionary[@"posters"] valueForKey:@"thumbnail"];
        self.synopsis = dictionary[@"synopsis"];
        self.mpaaRating = dictionary[@"mpaa_rating"];
        self.title = dictionary[@"title"];
        self.runtime = dictionary[@"runtime"];
        self.year = dictionary[@"year"];
        self.releaseDate = [dictionary[@"release_dates"] valueForKey:@"theater"];
        self.criticsConsensus = dictionary[@"critics_consensus"];
        self.audienceRating = [dictionary[@"ratings"] valueForKey:@"audience_rating"];
        self.criticsRating = [dictionary[@"ratings"] valueForKey:@"critics_rating"];
        self.audienceScore = [dictionary[@"ratings"] valueForKey:@"audience_score"];
        self.criticsScore = [dictionary[@"ratings"] valueForKey:@"critics_score"];
        self.cast = [Cast castWithArray:dictionary[@"abridged_cast"]];
        self.posterUrl = [dictionary[@"posters"] valueForKey:@"original"];
    }
    
    return self;
}


+ (NSArray *)moviesWithArray:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    
    return movies;
}

@end
