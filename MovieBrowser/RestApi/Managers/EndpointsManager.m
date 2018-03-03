//
//  EndpointsManager.m
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "EndpointsManager.h"

@implementation EndpointsManager

+ (instancetype) sharedInstance {
    static EndpointsManager *endpointManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        endpointManager = [[EndpointsManager alloc] init];
    });
    return endpointManager;
}

- (void) loadEndpointSettings {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"EndpointsSetting" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    NSError* error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions error:&error];
    if (error != nil) {
        NSLog(@"%@",error.description);
    }
    else {
        self.endpointSettings = [[EndpointSettingData alloc] initWithDictionary:result];
        self.mappedEndpoints = [[NSMutableDictionary alloc] init];
        for(EndpointData *data in self.endpointSettings.endpoints) {
            [self.mappedEndpoints setObject:data forKey:data.name];
        }
    }
}

- (EndpointData *) getEndpointByName:(NSString *)name {
    return [self.mappedEndpoints objectForKey:name];
}

- (NSString *) getBaseImageUrl {
    return self.endpointSettings.imageBaseUrl;
}

- (NSString *) getApiKey {
    return self.endpointSettings.apiKey;
}

@end
