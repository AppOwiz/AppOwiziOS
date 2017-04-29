//
//  FruitVC.m
//  AA_HelloApp
//
//  Created by AppOwiz Team.
//  Copyright (c) 2016 AppOwiz. All rights reserved.

#import "FruitVC.h"

@interface FruitVC() <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *arr;

@end

@implementation FruitVC

//-----------------------------------------------------------------------

#pragma mark - Memory Management Methods

//-----------------------------------------------------------------------

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-----------------------------------------------------------------------

#pragma mark - Custom Methods

- (void)backBtnTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

//-----------------------------------------------------------------------

#pragma mark - UITableViewDataSourceDelegate Methods

//-----------------------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//-----------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

//-----------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"%ld%ld", (long)indexPath.section, (long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:114.0/255.0 green:173.0/255 blue:87.0/255 alpha:1.0];
    } else {
        cell.backgroundColor = [UIColor colorWithRed:221.0/255 green:88/255.0 blue:42.0/255 alpha:1.0];;
    }
    
    cell.imageView.image = [UIImage imageNamed:[self.arr objectAtIndex:indexPath.row]];
    cell.textLabel.text =   [NSString stringWithFormat:@"%@",[[self.arr objectAtIndex:indexPath.row] capitalizedString]];
    
    return cell;
}

//-----------------------------------------------------------------------

#pragma mark - UITableView Delegate Methods

//-----------------------------------------------------------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//-----------------------------------------------------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


//-----------------------------------------------------------------------

#pragma mark - View Life Cycle Methods

//-----------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Fruits";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.arr = @[@"apple", @"banana", @"coconut", @"grapes", @"pineapple", @"strawberry"];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnTapped)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

//-----------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//-----------------------------------------------------------------------

@end
