//
//  AlertUtil.h
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject

+ (void)showAlertWithController:(UIViewController *_Nonnull)controller title:(NSString *_Nullable)title message:(NSString *_Nonnull)message positiveTitle:(NSString *_Nonnull)pTitle NegativeTitle:(NSString *_Nullable)nTitle handler:(void (^ __nullable)(NSInteger action))handler;

@end
