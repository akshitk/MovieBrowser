//
//  MovieViewController.m
//  MovieBrowser
//
//  Created by Akshit Bum on 03/03/18.
//  Copyright © 2018 MB. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieServices.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[MovieServices sharedInstance] getMovieList:^(id result, NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CollectinView Delegate Methd
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 6;
//}
//
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    HomeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeViewCellIdentifier forIndexPath:indexPath];
//    cell.title.text = [[UtilityManager getArrayFromPlist:kHomeMenuFile] objectAtIndex:indexPath.row];
//    return cell;
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((collectionView.frame.size.width/2-5), collectionView.frame.size.height/3 + 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
   
}



@end
