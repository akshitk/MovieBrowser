//
//  MovieServices.h
//  MovieBrowser
//
//  Created by Akshit Bum on 03/03/18.
//  Copyright © 2018 MB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@interface MovieServices : BaseService
+ (instancetype) sharedInstance;
- (void) getMovieList:(ResponseBlock)completionHandler;

@end
