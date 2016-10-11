//
//  KTAlertController.m
//  KTAlertController
//
//  Created by 上海易裁 on 16/8/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KTAlertController.h"
#import "KTDownUpAnimationController.h"

@interface KTAlertController ()<UIViewControllerTransitioningDelegate>
/** 当前选中的Item */
@property (nonatomic, weak) UIButton *seletedItem;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *cancelText;
@property (nonatomic, copy) NSString *buttonText;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) void (^buttonAction)();
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *verticalLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelButtonLeftConstraint;

@end

@implementation KTAlertController

- (IBAction)aliPayBtnClicked:(UIButton *)sender {
    self.seletedItem.selected = NO;
    self.seletedItem = sender;
    self.seletedItem.selected = YES;
}
- (IBAction)weChatBtnClicked:(UIButton *)sender {
    self.seletedItem.selected = NO;
    self.seletedItem = sender;
    self.seletedItem.selected = YES;
}

+ (instancetype)payControllerWithTitle:(NSString *)title
{
    
    KTAlertController *payAlert = [[KTAlertController alloc] init];
    payAlert.transitioningDelegate = payAlert;
    payAlert.modalPresentationStyle = UIModalPresentationCustom;
    payAlert.titleText = title;
    
    return payAlert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = self.titleText;
    self.descriptionLabel.text = self.descriptionText;
    [self.cancelButton setTitle:self.cancelText forState:UIControlStateNormal];
    [self.button setTitle:self.buttonText forState:UIControlStateNormal];
    if (self.buttonText.length == 0) {
        self.button.hidden = YES;
        self.verticalLineView.hidden = YES;
        self.cancelButtonLeftConstraint.constant = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(UIButton *)sender {
    if (sender == self.button && self.buttonAction) {
            self.buttonAction();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- UIViewControllerTransitioningDelegate --

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    switch (self.animationType) {
            case KTAlertControllerAnimationTypeDownUp:
            return [[KTDownUpAnimationController alloc] init];
            break;
        default:
            break;
    }
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    switch (self.animationType) {
            case KTAlertControllerAnimationTypeDownUp:
            return [[KTDownUpAnimationController alloc] init];
            break;
        default:
            break;
    }
}
@end
