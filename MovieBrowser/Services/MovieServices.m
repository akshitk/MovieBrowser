//
//  MovieServices.m
//  MovieBrowser
//
//  Created by Akshit Bum on 03/03/18.
//  Copyright © 2018 MB. All rights reserved.
//

#import "MovieServices.h"
#import "RequestManager.h"
#import "EndpointsManager.h"

@implementation MovieServices

NSString *const kResults = @"results";

+ (instancetype) sharedInstance {
    static MovieServices *movieServices;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        movieServices = [[MovieServices alloc] init];
    });
    return movieServices;
}

- (void) getMovieList:(ResponseBlock)completionHandler {
    [ProgressHUD showHUDAddedTo:kWindowView animated:YES];
    [RequestManager requestDataTaskWith:@"get-popular-movie" parameters:nil headers:nil completionHandler:^(id response, NSError *error) {
        [ProgressHUD hideHUDForView:kWindowView animated:YES];
        completionHandler([response objectForKey:kResults], error);
    }];
}

@end
