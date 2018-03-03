//
//  EndpointData.m
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "EndpointData.h"

@implementation EndpointData

NSString *const kName = @"name";
NSString *const kUri = @"uri";
NSString *const kMethod = @"method";
NSString *const kStatus = @"status";

- (EndpointData *) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(self) {
        self.name = [data objectForKey:kName];
        self.uri = [data objectForKey:kUri];
        self.method = [data objectForKey:kMethod];
        self.status = [data objectForKey:kStatus];

    }
    return self;
}


@end
