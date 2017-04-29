//
//  ViewController.m
//  AA_HelloApp
//
//  Created by AppOwiz Team.
//  Copyright (c) 2016 AppOwiz. All rights reserved.

#import "ViewController.h"
#import "FruitVC.h"
#import "TreesVC.h"
@interface ViewController ()

- (IBAction)btnFruitsTapped:(UIButton *)sender;
- (IBAction)btnTreesTapped:(UIButton *)sender;
@end

@implementation ViewController

//-----------------------------------------------------------------------

#pragma mark - Memory Management Methods

//-----------------------------------------------------------------------

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-----------------------------------------------------------------------
#pragma mark - Action Methods

- (IBAction)btnFruitsTapped:(UIButton *)sender {
    FruitVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Fruits"];
    [self.navigationController pushViewController:controller animated:YES];
}

//-----------------------------------------------------------------------

- (IBAction)btnTreesTapped:(UIButton *)sender {
  
    TreesVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Trees"];
    [self.navigationController pushViewController:controller animated:YES];
}

//-----------------------------------------------------------------------

#pragma mark - View Life Cycle Methods

//-----------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f] };
}

//-----------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//-----------------------------------------------------------------------

@end
