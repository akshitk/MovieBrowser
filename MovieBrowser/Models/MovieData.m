//
//  MovieData.m
//  MovieBrowser
//
//  Created by Akshit Bum on 03/03/18.
//  Copyright © 2018 MB. All rights reserved.
//

#import "MovieData.h"

@implementation MovieData

NSString *const kId = @"id";
NSString *const kPosterPath = @"poster_path";
NSString *const kTitle = @"title";

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(self) {
        self.movieId = [data objectForKey:kId];
        self.posterPath = [data objectForKey:kPosterPath];
        self.title = [data objectForKey:kTitle];
    }
    return self;
}

@end
