//
//  EndpointData.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EndpointData : NSObject

/**
 *  Name that identifies the connection
 */
@property NSString *name;
/**
 *  Uri that identifies the connection url
 */
@property NSString *uri;
/**
 *  Method that identifies the method of Uri
 */
@property NSString *method;
/**
 *  Status that identifies the Uri's status
 */
@property BOOL status;

- (EndpointData *) initWithDictionary:(NSDictionary *)data;


@end
