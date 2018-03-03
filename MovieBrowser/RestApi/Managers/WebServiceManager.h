//
//  WebServiceManager.h
//  LawConcierge
//
//  Created by Akshit Bum on 09/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceManager : NSObject

+ (void)downloadTaskWith:(NSString *_Nonnull)url completionHandler:(void (^_Nonnull)(NSURL * _Nonnull, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler;

+ (void)requestDataTaskWith:(NSURLRequest *_Nonnull)request completionHandler:(void (^_Nullable)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler;

+ (void)uploadTaskWith:(NSURLRequest *_Nonnull)request data:(NSData *_Nonnull)data completionHandler:(void (^_Nullable)(NSData * _Nonnull, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler;

@end
