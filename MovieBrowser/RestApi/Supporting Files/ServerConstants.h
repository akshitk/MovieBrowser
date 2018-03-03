//
//  ServerConstants.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#ifndef ServerConstants_h
#define ServerConstants_h

typedef enum {
    RestMethodGET = 0,
    RestMethodPOST,
    RestMethodPUT,
    RestMethodDELETE
} RestMethodType;

static NSString * const kMethodNotDefined = @"Method is not defined";
static NSString * const kEndpointError = @"Endpoint is not working properly";
static NSString * const kRestMethodPOST = @"POST";
static NSString * const kBearer = @"Bearer";
static NSString * const kAuthorization = @"Authorization";
#define kSuccessStatusCode 200
#endif /* ServerConstants_h */
