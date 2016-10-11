//
//  KTAlertController.h
//  KTAlertController
//
//  Created by 上海易裁 on 16/8/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KTAlertControllerAnimationType)
{
    KTAlertControllerAnimationTypeDownUp             // 从下往上滑出
};

@interface KTAlertController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, assign) KTAlertControllerAnimationType animationType;

+ (instancetype)payControllerWithTitle:(NSString *)title;

@end
