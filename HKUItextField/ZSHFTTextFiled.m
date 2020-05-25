//
//  FTTextFiled.m
//  Encounter
//
//  Created by 方涛 on 2017/2/21.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "ZSHFTTextFiled.h"
#import "UITextField+Blocks.h"
#import "UIView+Frame.h"
#import "UILabel+Style.h"
@interface ZSHFTTextFiled()<UITextFieldDelegate>

@end
@implementation ZSHFTTextFiled
-(void)loadViews
{
    
}
-(void)layoutViews{
    
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//
//    self.tf.layer.borderColor = [AppStyleConfiguration ColorWithNavigationBackgroundColor].CGColor;
//}
//
//
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    self.tf.layer.borderColor = [UIColor colorWithHexString:@"#F4F4F4"].CGColor;
//}

//左边文字，右边textfiled
-(void)creatTextFiledWithLeftString:(NSString*)str {
    
    self.backgroundColor=[UIColor clearColor];
    _lab =[UILabel labelWithSize:[UIFont systemFontOfSize:HKFontFlaot(14)] withColor:[UIColor lightGrayColor] withText:str];
    CGSize size =[self sizeForNoticeTitle:str font:HKFontFlaot(14)];
    _tf=[UITextField new];
    [_tf setTintColor:[UIColor blackColor]];
    _tf.textColor=[UIColor blackColor];
    _tf.font=[UIFont systemFontOfSize:HKFontFlaot(14)];
    [self addSubview:_lab];
    [self addSubview:_tf];
    _tf.delegate = self;
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(@0);
        make.height.equalTo(@30);
        make.width.equalTo(@(size.width+10));
    }];
    [_tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(size.width+15));
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}


/**
 *  根据文字返回size
 */
- (CGSize)sizeForNoticeTitle:(NSString*)text font:(CGFloat )font{
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat maxWidth = screen.size.width;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    
    CGSize textSize = CGSizeZero;
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
        NSStringDrawingUsesFontLeading;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:font], NSParagraphStyleAttributeName : style };
        
        CGRect rect = [text boundingRectWithSize:maxSize
                                         options:opts
                                      attributes:attributes
                                         context:nil];
        textSize = rect.size;
    }
    else{
//        textSize = [text sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:maxSize lineBreakMode:NSLineBreakByCharWrapping];
        
    }
    return textSize;
}

//左边图片，右边textfiled；
-(void)creatTextFiledWithImage:(NSString*)img{
    
    self.backgroundColor=[UIColor clearColor];
    self.tf=[UITextField new];
    [self.tf setTintColor:[UIColor grayColor]];
    self.tf.textColor=[UIColor blackColor];
    self.tf.font=[UIFont systemFontOfSize:HKFontFlaot(14)];
    [self addSubview:self.tf];
    self.tf.leftViewMode = UITextFieldViewModeAlways;
     UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:img]];
    
    [imageView setWidth:imageView.image.size.width+20];
    imageView.contentMode = UIViewContentModeCenter;
    
    self.tf.leftView = imageView;

    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];

}
//添加底部线条
-(UIView *)line{
    if (!_line.superview) {
        _line=[UIView new];
        _line.backgroundColor=[UIColor lightGrayColor];;
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.height.equalTo(@(1));
            make.bottom.equalTo(@0);
        }];
    }
    return _line;
}
//设置手机号类型
-(void)phone{
    self.tf.keyboardType=UIKeyboardTypeNumberPad;
    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 11 && string.length) {
            return NO;
        }else{
            return  [self validateNumber:string];
        }
        return YES;
    }];

}
//设置验证码类型textfiled 带按钮
-(void)checkCode{
    self.codeBtn= [UIButton buttonWithTitle:@"发送验证码" withImageName:nil withBGColor:[UIColor clearColor] Withlayer:YES];
    self.codeBtn.titleLabel.font= [UIFont systemFontOfSize:HKFontFlaot(12)];
    self.codeBtn.layer.cornerRadius= 5;
    [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@-5);
        make.height.equalTo(@25);
        make.width.equalTo(@100);
    }];

    self.tf.keyboardType=UIKeyboardTypeNumberPad;
    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 6 && string.length)
        {
            return NO;
        }else{
            return  [self validateNumber:string];
        }
        return YES;
    }];
    
}

//判断字符串是否是纯数字
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

//设置PassWord textfiled 带按钮
-(void)wangjiPassWord{
    
    self.codeBtn= [UIButton buttonWithTitle:@"忘记密码" withImageName:nil withBGColor:[UIColor clearColor] Withlayer:YES];
    self.codeBtn.titleLabel.font= [UIFont systemFontOfSize:HKFontFlaot(12)];
    [self.codeBtn setTitleColor:[UIColor blackColor]  forState:UIControlStateNormal];
    [self addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@-5);
        make.height.equalTo(@25);
        make.width.equalTo(@80);
    }];
    
//    self.tf.keyboardType = UIKeyboardTypeNumberPad;
//    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
//        if (textField.text.length >= 6 && string.length)
//        {
//            return NO;
//        }else{
//            return  [MyControl validateNumber:string];
//        }
//        return YES;
//    }];
    
}



//密码类型textfiled 带按钮
-(void)pwdTextFiledWithBtnOpenImg:(UIImage*)openImg CloseImg:(UIImage*)closeImg{
    self.tf.keyboardType=UIKeyboardTypeASCIICapable;
    self.tf.secureTextEntry=YES;
    self.eyeBtn =[[UIButton alloc] init];
    [self.eyeBtn setImage:closeImg forState:UIControlStateNormal];
    [self.eyeBtn setImage:openImg forState:UIControlStateSelected];

    [self.eyeBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        NSString *tempPWStr = self.tf.text;
        self.tf.text = @"";
        self.tf.secureTextEntry=!self.tf.secureTextEntry;
        self.eyeBtn.selected=!self.eyeBtn.selected;
        self.tf.text = tempPWStr;
    }];
    [self addSubview:self.eyeBtn];
    [self.eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@(-5));
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
    }];

    [self.tf setShouldChangeCharactersInRangeBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        if (textField.text.length >= 30 && string.length) {
            return NO;
        }
        return YES;
    }];
    
}
//手机号验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
// 正则匹配用户密码6-12位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,30}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

@end

