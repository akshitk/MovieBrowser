//
//  WebServiceManager.m
//  LawConcierge
//
//  Created by Akshit Bum on 09/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+ (void)downloadTaskWith:(NSString *)url completionHandler:(void (^)(NSURL * _Nonnull, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    NSURL *downloadUrl = [NSURL URLWithString:url];
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession]
                                               downloadTaskWithURL:downloadUrl completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                       if(completionHandler)
                                                           completionHandler(location, response, error);
                                                   });
                                               }];

    [downloadTask resume];
}

+ (void)requestDataTaskWith:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(completionHandler) {
                    completionHandler(data, response, error);
            }

        });
    }];
    [dataTask resume];
}

+ (void)uploadTaskWith:(NSURLRequest *)request data:(NSData *)data completionHandler:(void (^)(NSData * _Nonnull, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
            fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                                    if(completionHandler)
                                        completionHandler(data, response, error);
                                    });
                            }];

    [uploadTask resume];
}

@end
