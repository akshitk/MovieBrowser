//
//  EndpointSettingData.m
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "EndpointSettingData.h"
#import "EndpointData.h"

@implementation EndpointSettingData

NSString *const kEndpointName = @"name";
NSString *const kEndpointStatus = @"status";
NSString *const kEndpointBasicSettings = @"basic_settings";
NSString *const kEndpointBaseUrl = @"base_url";
NSString *const kEndpointImageBaseUrl = @"image_base_url";
NSString *const kApiKey = @"api_key";
NSString *const kEndpointAuthTokenHeaderName = @"auth_token_header_name";
NSString *const kEndpointAuthTokenHeaderValuePattern = @"auth_token_header_value_pattern";
NSString *const kEndpointParameters = @"parameters";
NSString *const kEndpointHeaders = @"headers";
NSString *const kEndpoints = @"endpoints";
//NSString *const kEndpointCacheTimeout = @"cache_timeout";
NSString *const kEndpointRequestTimeout = @"request_timeout";


- (EndpointSettingData *) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if(self) {
        NSDictionary *basicSettings = [data objectForKey:kEndpointBasicSettings];
        self.baseURL = [basicSettings objectForKey:kEndpointBaseUrl];
        self.imageBaseUrl = [basicSettings objectForKey:kEndpointImageBaseUrl];
        self.apiKey = [basicSettings objectForKey:kApiKey];
        self.headers = [basicSettings objectForKey:kEndpointHeaders];
        //self.cacheTimeout = [basicSettings objectForKey:kEndpointCacheTimeout];
        self.requestTimeout = [[basicSettings objectForKey:kEndpointRequestTimeout] doubleValue];
        NSArray *endpoints = [data objectForKey:kEndpoints];
        self.endpoints = [[NSMutableArray alloc] init];
        
        for(NSDictionary *dict in endpoints) {
            [self.endpoints addObject: [[EndpointData alloc] initWithDictionary:dict]];
        }
        
    }
    return self;
}


@end
