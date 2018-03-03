//
//  AlertUtil.m
//  LawConcierge
//
//  Created by Akshit Bum on 08/01/18.
//  Copyright © 2018 Mindfire Solutions. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil

+ (void)showAlertWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message positiveTitle:(NSString *)pTitle NegativeTitle:(NSString *)nTitle handler:(void (^ __nullable)(NSInteger action))handler {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton;
    if(pTitle) {
        yesButton = [UIAlertAction actionWithTitle:pTitle
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {
                                               if(handler)
                                                   handler(Positive);
                                           }];
    }
    UIAlertAction* noButton;
    if(nTitle) {
        noButton = [UIAlertAction actionWithTitle:nTitle
                                            style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action)
                    {
                        if(handler)
                            handler(Negative);
                    }];
    }
    
    if(yesButton)
        [alert addAction:yesButton];
    if(noButton)
        [alert addAction:noButton];
    
    [controller presentViewController:alert animated:YES completion:nil];
}
@end
