//
//  BaseService.h
//  LawConcierge
//
//  Created by Akshit Bum on 30/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLResponse.h"

@interface BaseService : NSObject

typedef void (^ResponseBlock)(id, NSError*);
typedef void (^RestAPIResponseBlock) (NSData * , NSURLResponse * , NSError *);

@end
