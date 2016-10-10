

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WEHelper : NSObject

// 计算字符串大小
+ (CGSize)sizeWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing boundingRectWithSize:(CGSize)boundingSize font:(UIFont *)font;

// 123,000
+ (NSString *)commaNumberStringWithNumber:(NSInteger)number;

/// 检测图片类型的方法，是jpeg还是png，或者是gif，webp，这个方法SDWebImage中也有NSData的分类
///
/// @param data 网络图片或本地图片网络请求返回来的数据
///
/// @return 图片类型
+ (NSString *)contentTypeForImageData:(NSData *)data;

@end

#pragma mark - 字符串非空判断

@interface NSString (isValueable)

+ (BOOL)isValueableString:(NSString *)string;

@end
#pragma mark - 字符串时间格式转换

@interface NSString (WETimeString)

// 2014-08-16 22:30
+ (NSString*)fullTimeStringWithTime:(NSString *)time;

// 2014/08/06
+ (NSString *)YMDTimeStringWithTime:(NSString *)time;

// 2014.08
+ (NSString *)YMTimeStringWithTime:(NSString *)time;

// 07-08
+ (NSString*)MDTimeStringWithTime:(NSString *)time;

//获取月份
+ (NSString*)MTimeStringWithTime:(NSString *)time;

+(NSDateComponents*)componentWithTime:(NSString *)time;

//3分钟前、2小时前、一周前
+(NSString*)timeStringStyle1WithTime:(NSString *)time;

//凌晨、上午、下午、晚上、周一
+(NSString*)timeStringStyle2WithTime:(NSString *)time;

+(NSString*)timeStringStyle3WithTime:(NSString *)time;



@end

#pragma mark - 16进制颜色(#ffffff)字符串转为UIColor

@interface UIColor (HexColor)

+(UIColor *)hexStringToColor:(NSString *)stringToConvert;

@end

#pragma mark - 使用color生成图片

@interface UIImage (WEColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

#pragma mark - 正则表达式

@interface NSString (WERegexString)

//邮箱
+ (BOOL)validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo;
//车型
+ (BOOL)validateCarType:(NSString *)CarType;
//用户名
+ (BOOL)validateUserName:(NSString *)name;
//密码
+ (BOOL)validatePassword:(NSString *)passWord;
//昵称
+ (BOOL)validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
//银行卡
+ (BOOL)validateBankCardNumber: (NSString *)bankCardNumber;
//银行卡后四位
+ (BOOL)validateBankCardLastNumber: (NSString *)bankCardNumber;
//CVN
+ (BOOL)validateCVNCode: (NSString *)cvnCode;
//month
+ (BOOL)validateMonth: (NSString *)month;
//year
+ (BOOL)validateYear: (NSString *)year;
//verifyCode
+ (BOOL)validateVerifyCode: (NSString *)verifyCode;
// 邮政编码
+ (BOOL)validateZipCode:(NSString *)zipCode;


@end


