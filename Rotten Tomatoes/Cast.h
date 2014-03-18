//
//  Cast.h
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/14/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cast : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSArray *characters;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)castWithArray:(NSArray *)array;

@end
