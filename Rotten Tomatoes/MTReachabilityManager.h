//
//  MTReachabilityManager.h
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/16/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reachability;


@interface MTReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark -
#pragma mark Shared Manager
+ (MTReachabilityManager *)sharedManager;

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;
+ (BOOL)isUnreachable;
+ (BOOL)isReachableViaWWAN;
+ (BOOL)isReachableViaWiFi;

@end
