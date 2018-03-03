//
//  EndpointsManager.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndpointSettingData.h"
#import "EndpointData.h"

@interface EndpointsManager : NSObject

@property EndpointSettingData *endpointSettings;
@property NSMutableDictionary *mappedEndpoints;
+ (instancetype) sharedInstance;
- (void) loadEndpointSettings;
- (EndpointData *) getEndpointByName:(NSString *)name;
- (NSString *) getBaseImageUrl;
- (NSString *) getApiKey;
@end
