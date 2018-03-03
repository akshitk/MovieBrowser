//
//  RequestManager.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

+ (void)requestDataTaskWith:(NSString * _Nonnull)url parameters:(NSDictionary *_Nullable)parameters headers:(NSDictionary *_Nullable)headers  completionHandler:(void (^ _Nullable)(id _Nullable, NSError * _Nullable))completionHandler;

@end
