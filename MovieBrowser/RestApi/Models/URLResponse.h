//
//  URLResponse.h
//  LawConcierge
//
//  Created by Akshit Bum on 30/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLResponse : NSObject

@property NSInteger statusCode;
@property NSString* message;
@property id result;
- (URLResponse *) initWithDictionary:(NSDictionary *)data;
@end
