//
//  AERightMenuWindow.h
//  RightMenuDemo
//
//  Created by WangLin on 16/9/19.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AERightMenuWindowOptions : NSObject
@property (nonatomic,strong) UIColor* dropBackColor;
@property (nonatomic,assign) CGFloat menuViewWidthPercentageOfFullScreen;
@property (nonatomic,assign) CGFloat animationInterval;
@end

@interface AERightMenuWindow : UIWindow
+(instancetype) instance;
@property (nonatomic,strong) AERightMenuWindowOptions* options;
//-(void)setOptions:(AERightMenuWindowOptions*)options;
-(void)showMenu:(UIViewController*)contentVC;
@end
