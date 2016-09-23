//
//  ViewController.m
//  RightMenuDemo
//
//  Created by WangLin on 16/9/19.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "ViewController.h"
#import "AERightMenuWindow.h"
#import "MenuViewController.h"

@interface ViewController ()
- (IBAction)onShowMenuTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onShowMenuTapped:(id)sender {
    // Step 1: Create your controllers.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MenuViewController *frontController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    // Step2: Customize by define your own options
    AERightMenuWindowOptions* options = [[AERightMenuWindowOptions alloc] init];
    [options setDropBackColor:kAERightMenuWindowDropBackColor];
    [options setAnimationInterval:kAERightMenuWindowAnimationInterval];
    [options setMenuViewWidthPercentageOfFullScreen:0.80f];
    [[AERightMenuWindow instance] setOptions:options];
    
    // Step3: Show side menu
    [[AERightMenuWindow instance] showMenu:frontController];
}
@end
