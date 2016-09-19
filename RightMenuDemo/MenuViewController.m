//
//  MenuViewController.m
//  RightMenuDemo
//
//  Created by WangLin on 16/9/19.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

- (IBAction)onActionTapped:(id)sender;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onActionTapped:(id)sender {
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Title" message:@"Action Content here!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
@end
