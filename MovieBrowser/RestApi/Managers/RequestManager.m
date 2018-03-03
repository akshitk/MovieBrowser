//
//  RequestManager.m
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "RequestManager.h"
#import "EndpointData.h"
#import "EndpointsManager.h"
#import "WebServiceManager.h"
#import "ServerConstants.h"
#import "URLResponse.h"

@implementation RequestManager

+ (void)requestDataTaskWith:(NSString *)url parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers  completionHandler:(void (^)(id _Nullable, NSError * _Nullable))completionHandler {
    
    EndpointData *endpointConfig = [[EndpointsManager sharedInstance] getEndpointByName:url];
    
    if(!endpointConfig) {
        NSLog(@"%@",kEndpointError);
        return;
    }
    EndpointSettingData *endpointBasicSetting = [EndpointsManager sharedInstance].endpointSettings;
    NSString *requestURI = [NSString stringWithFormat:@"%@%@", endpointBasicSetting.baseURL,endpointConfig.uri];
    requestURI = [self fullURIFromParameterizedURI:requestURI withParameters:[parameters mutableCopy]];
    
    requestURI = [requestURI stringByAppendingString:[NSString stringWithFormat:@"?api_key=%@",endpointBasicSetting.apiKey]];
    NSURL *requestUrl = [NSURL URLWithString:requestURI];

    //requestUrl = [self buildQueryURL:requestUrl withParameters:queryParameters];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:endpointBasicSetting.requestTimeout];
    
    if(parameters && [endpointConfig.method isEqualToString: kRestMethodPOST]) {
        NSError *error;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if(!error) {
            request.HTTPBody = postData;
        }
        
    }
    if(!headers)
        request.allHTTPHeaderFields = endpointBasicSetting.headers;
    else {
        NSMutableDictionary *headersDictionary = [headers mutableCopy];
        [headersDictionary addEntriesFromDictionary:endpointBasicSetting.headers];
        request.allHTTPHeaderFields = headersDictionary;
    }
    request.HTTPMethod = endpointConfig.method;
    
    if(endpointConfig.status) {
        [WebServiceManager requestDataTaskWith:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if(error) {
                completionHandler(nil, error);
            }
            else if(response) {
                if(data) {
                    NSDictionary* responseDictonary = [NSJSONSerialization JSONObjectWithData:data
                                                                                      options:kNilOptions
                                                                                        error:&error];
                    completionHandler(responseDictonary, nil);
                }
            }
        }];
    }
}

+ (nonnull NSString *)fullURIFromParameterizedURI:(NSString * _Nonnull)parameterizedURI
                                   withParameters:(NSMutableDictionary * _Nullable)parameters {
    
    if (parameters == nil) {
        return parameterizedURI;
    }
    
    if ([parameterizedURI rangeOfString:@":"].location == NSNotFound) {
        return parameterizedURI;
    }
    
    __block NSMutableArray *keysToRemove = [NSMutableArray array];
    __block NSString       *fullURI = [NSMutableString stringWithString:parameterizedURI];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //
        NSString *newKey   = [NSString stringWithFormat:@":%@", key];
        NSString *newValue = [NSString stringWithFormat:@"%@", obj];
        
        if ([fullURI rangeOfString:newKey options:NSCaseInsensitiveSearch].location != NSNotFound) {
            fullURI = [fullURI stringByReplacingOccurrencesOfString:newKey withString:newValue options:NSCaseInsensitiveSearch range:NSMakeRange(0, [fullURI length])];
            [keysToRemove addObject:key];
        }
    }];
    
    // remove all parameters that were found in the parameterized URI
    [keysToRemove enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [parameters removeObjectForKey:obj];
    }];
    
    return fullURI;
}

@end

