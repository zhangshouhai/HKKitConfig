//
//  FTTextFiled.h
//  Encounter
//
//  Created by 方涛 on 2017/2/21.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "UIButoon+Style.h"
#import "UITextField+Blocks.h"
#import "UIView+Frame.h"
#import "UILabel+Style.h"

@interface ZSHFTTextFiled : BaseTableViewCell
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic,strong)UITextField *tf;
@property(nonatomic,strong)UIView *line;//添加底部线条
@property(nonatomic,strong)UIButton *eyeBtn;
@property(nonatomic,strong)UIButton *codeBtn;


//创建左边文字，右边textfiled
-(void)creatTextFiledWithLeftString:(NSString*)str;
//创建左边图片，右边textfiled；
-(void)creatTextFiledWithImage:(NSString*)img;
//设置手机号类型
-(void)phone;

//设置忘记密码 带按钮
-(void)wangjiPassWord;
//设置验证码类型textfiled 带按钮
-(void)checkCode;
//密码类型textfiled 带按钮
-(void)pwdTextFiledWithBtnOpenImg:(UIImage*)openImg CloseImg:(UIImage*)closeImg;
//手机号验证
+ (BOOL) validateMobile:(NSString *)mobile;
// 正则匹配用户密码6-12位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;

@end
