//
//  AERightMenuWindow.m
//  RightMenuDemo
//
//  Created by WangLin on 16/9/19.
//  Copyright © 2016年 amberease. All rights reserved.
//

#import "AERightMenuWindow.h"
#import "PureLayout.h"

@implementation AERightMenuWindowOptions



@end

@interface AERightMenuWindow()
{
    AERightMenuWindowOptions* _options;
}
@property (nonatomic,strong) UITapGestureRecognizer* tapGest;
@property (nonatomic,strong) UIView* contentView;
@property (nonatomic,strong) NSLayoutConstraint* beginPinLeftCstrt;
@property (nonatomic,strong) NSLayoutConstraint* endPinRightCstrt;


@end

@implementation AERightMenuWindow


+(instancetype) instance{
    static AERightMenuWindow* result = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        result = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return result;
}

-(AERightMenuWindowOptions*)defaultOptions{
    static AERightMenuWindowOptions* s_defaultOptions = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_defaultOptions = [[AERightMenuWindowOptions alloc] init];
        s_defaultOptions.dropBackColor = kAERightMenuWindowDropBackColor;
        s_defaultOptions.animationInterval = kAERightMenuWindowAnimationInterval;
        s_defaultOptions.menuViewWidthPercentageOfFullScreen = kAERightMenuWindowMenuViewWidthPercentageOfFullScreen;
    });
    return s_defaultOptions;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDropBackTapped:)];
        [self addGestureRecognizer:self.tapGest];
    }
    return self;
}

-(void)setOptions:(AERightMenuWindowOptions *)options{
    _options = options;
}

-(AERightMenuWindowOptions*)options{
    if(!_options){
        return [self defaultOptions];
    }
    return _options;
    
}

-(void)showMenu:(UIViewController*)contentVC{
    [self setRootViewController:contentVC];
    self.contentView = contentVC.view;
    [self makeKeyWindow];
    self.hidden = NO;
    self.backgroundColor =  self.options.dropBackColor;
    [self addSubview:contentVC.view];
    [self updateContentViewPositionForBeginning];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    
    [UIView animateWithDuration:self.options.animationInterval animations:^(void){
        [self updateContentViewPositionForEnd];
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
        
    }];
}



#pragma mark - Help Methods
-(void)onDropBackTapped:(UITapGestureRecognizer*)gest{
    CGPoint pt = [gest locationInView:self.contentView];
    if(pt.x < 0){
        [self hideMenu];
    }
    
}

-(void)hideMenu{
    
    [UIView animateWithDuration:self.options.animationInterval animations:^(void){
        [self restoreContentViewPostionForBeginning];
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    }completion:^(BOOL finished){
        [self.contentView endEditing:YES];
        self.beginPinLeftCstrt = nil;
        self.endPinRightCstrt = nil;
        [self resignKeyWindow];
        self.hidden = YES;
        
        __weak UIViewController* weakVC = self.rootViewController;
        NSNotification* notification = [[NSNotification alloc] initWithName:kAERightMenuWindowHideNotificationKey object:nil userInfo:@{kAERightMenuWindowHideNotificationUserInfoControllerKey:weakVC}];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }];
    self.contentView = nil;
}

-(void)updateContentViewPositionForBeginning{
    [self.contentView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.contentView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    self.beginPinLeftCstrt = [self.contentView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self];
    [self.contentView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self withMultiplier:self.options.menuViewWidthPercentageOfFullScreen];
}

-(void)updateContentViewPositionForEnd{
    [self.beginPinLeftCstrt autoRemove];
    self.endPinRightCstrt = [self.contentView autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

-(void)restoreContentViewPostionForBeginning{
    [self.endPinRightCstrt autoRemove];
    [self.beginPinLeftCstrt autoInstall];
}

@end
