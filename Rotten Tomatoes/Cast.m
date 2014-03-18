//
//  Cast.m
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/14/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "Cast.h"

@implementation Cast
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.characters = dictionary[@"characters"];
    }
    
    return self;
}


+ (NSArray *)castWithArray:(NSArray *)array {
    NSMutableArray *casts = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Cast *cast = [[Cast alloc] initWithDictionary:dictionary];
        [casts addObject:cast];
    }
    
    return casts;
}
@end
