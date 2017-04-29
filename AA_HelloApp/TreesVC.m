//
//  TreesVC.m
//  AA_HelloApp
//
//  Created by AppOwiz Team.
//  Copyright (c) 2016 AppOwiz. All rights reserved.

#import "TreesVC.h"
#import "CellVC.h"

@interface TreesVC()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *arr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

- (IBAction)btnHomeTapped:(UIButton *)sender;

@end

@implementation TreesVC

//-----------------------------------------------------------------------

#pragma mark - Memory Management Methods

//-----------------------------------------------------------------------

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-----------------------------------------------------------------------

#pragma mark - Custom Methods

- (void)backTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

//-----------------------------------------------------------------------

#pragma mark - Action Methods

- (IBAction)btnHomeTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-----------------------------------------------------------------------
#pragma mark - UICollectionViewDataSource Method

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}

//-----------------------------------------------------------------------

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CellVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CellVC alloc] init];
    }

//    if (indexPath.row % 2 == 0) {
//        cell.viewContainer.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:88.0/255.0 blue:42.0/255.0 alpha:1.0];
//    } else {
//        cell.viewContainer.backgroundColor = [UIColor colorWithRed:114.0/255.0 green:173.0/255.0 blue:87.0/255.0 alpha:1.0];
//    }
    
    cell.viewContainer.backgroundColor = [UIColor colorWithRed:114.0/255.0 green:173.0/255.0 blue:87.0/255.0 alpha:1.0];
    cell.imageview.image = [UIImage imageNamed:[self.arr objectAtIndex:indexPath.row]];
    cell.imageview.contentMode = UIViewContentModeScaleToFill;
    return cell;
}

//-----------------------------------------------------------------------

#pragma mark - UICollectionViewDelegateFlowLayout Method

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(128, 128); // This is my fixed Cell height
    
}

//-----------------------------------------------------------------------

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainingWidth = screenWidth - (128 * 2);
    return UIEdgeInsetsMake(remainingWidth/2, remainingWidth/3 , remainingWidth/2, remainingWidth/3);
}

//-----------------------------------------------------------------------

#pragma mark - View Life Cycle Methods

//-----------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Trees";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.arr = @[@"christmas",@"coconutTree",@"forest",@"green",@"island",@"leaves",@"tree"];
    self.collectionview.dataSource = self;
    self.collectionview.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backTapped)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

//-----------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//-----------------------------------------------------------------------

@end
