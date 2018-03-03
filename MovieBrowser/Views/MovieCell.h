//
//  MovieCell.h
//  MovieBrowser
//
//  Created by Akshit Bum on 03/03/18.
//  Copyright © 2018 MB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
