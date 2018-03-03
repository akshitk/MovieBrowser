//
//  EndpointSettingData.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndpointSettingData.h"

@interface EndpointSettingData : NSObject

/**
 *  Name that identifies the connection
 */
//@property NSString *name;
/**
 *  Base url for the connection
 */
@property NSString *baseURL;
/**
 *  Default parameters to be added in every request for the connection
 */
//@property NSDictionary *parameters;
/**
 *  Default headers to be added in every request for the connection
 */
@property NSDictionary *headers;
/**
 *  Cache timeout
 */
@property NSNumber *cacheTimeout;
/**
 *  Request timeout
 */
@property double requestTimeout;

/**
 *  Endpoints included in the connection
 */
@property NSMutableArray *endpoints;

/**
 *  Image Base url for the connection
 */
@property NSString *imageBaseUrl;

/**
 *  Image Base url for the connection
 */
@property NSString *apiKey;

- (EndpointSettingData *) initWithDictionary:(NSDictionary *)data;


@end
