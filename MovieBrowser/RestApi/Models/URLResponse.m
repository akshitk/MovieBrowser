//
//  URLResponse.m
//  LawConcierge
//
//  Created by Akshit Bum on 30/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "URLResponse.h"

NSString *const kStatusCode = @"statusCode";
NSString *const kMessage = @"message";
NSString *const kResult = @"result";

@implementation URLResponse

- (URLResponse *) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(self) {
        self.statusCode = [[data objectForKey:kStatusCode] integerValue];
        self.message = [data objectForKey:kMessage];
        self.result = [data objectForKey:kResult];
    }
    return self;
}

@end
