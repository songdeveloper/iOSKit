


#import "WEHelper.h"

@implementation WEHelper

 //计算字符串大小
+ (CGSize)sizeWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing boundingRectWithSize:(CGSize)boundingSize font:(UIFont *)font
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjects:@[font] forKeys:@[NSFontAttributeName]];
        
    CGSize contentSize = [text boundingRectWithSize:boundingSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return contentSize;
}

+ (NSString *)commaNumberStringWithNumber:(NSInteger)number
{
    NSString *resultStr = @"";
    if (number<1000) {
        resultStr = [NSString stringWithFormat:@"%ld",(long)number];
    } else if (number<1000000&&number>=1000) {
            NSString * sss = [NSString stringWithFormat:@"%ld",(long)number];
            NSString * bbb = [sss substringFromIndex:1];
        if ([bbb integerValue]/100 == 0) {
            resultStr = [NSString stringWithFormat:@"%ld,%@",(long)number/1000,bbb];
        }else {
            resultStr = [NSString stringWithFormat:@"%ld,%ld",(long)number/1000,(long)number%1000];
        }
    } else if (number<1000000000&&number>=1000000) {
        resultStr = [NSString stringWithFormat:@"%ld,%ld,%ld",(long)number/1000000,(long)number/1000,(long)number%1000];
    } else if (number>=1000000000) {
        resultStr = [NSString stringWithFormat:@"%ld,%ld,%ld,%ld",(long)number/1000000000,(long)number/1000000,(long)number/1000,(long)number%1000];
    }
    return resultStr;
}
# pragma mark - 根据网络返回的数据检测图片类型的方法，比较严谨
+ (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {                return @"webp";
            }
            return nil;
    }
    return nil;
}
@end
#pragma mark - 字符串非空判断

@implementation NSString(isValueable)

+ (BOOL)isValueableString:(NSString *)string {
    
    BOOL isValueableString = NO;
    if (string != nil && (NSNull *)string != [NSNull null] && ![@"" isEqualToString:string]) {
        isValueableString = YES;
    }
    return isValueableString;
}

@end
#pragma mark - 字符串时间格式转换

@implementation NSString (WETimeString)

+ (NSString*)fullTimeStringWithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%04ld/%02ld/%02ld  %02ld:%02ld",(long)[component year],(long)[component month],(long)[component day],(long)[component hour],(long)[component minute]];
    return string;
}

+ (NSString *)YMDTimeStringWithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%04ld/%02ld/%02ld",(long)[component year],(long)[component month],(long)[component day]];
    return string;
}

+ (NSString *)YMTimeStringWithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%04ld.%02ld",(long)[component year],(long)[component month]];
    return string;
}

+ (NSString*)MDTimeStringWithTime:(NSString *)time
{
    if ([time isEqualToString:@""]) {
        return time;
    }else {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%02ld月%02ld日",(long)[component month],(long)[component day]];
    return string;
    }
}

+ (NSString*)MTimeStringWithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%02ld",(long)[component month]];
    return string;
}


+(NSDateComponents*)componentWithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    return component;
}


+(NSString*)timeStringStyle1WithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSInteger t_year=[component year];
    
    NSString*string=nil;
    
    long long distance= -[date timeIntervalSinceNow];
    if(distance<60) {
        string=@"刚刚";
    }
    else if(distance<60*60) {
        string=[NSString stringWithFormat:@"%lld分钟前",distance/60];
    }
    else if(distance<60*60*24) {
        string=[NSString stringWithFormat:@"%lld小时前",distance/60/60];
    }
    else if(distance<60*60*24*7) {
        string=[NSString stringWithFormat:@"%lld天前",distance/60/60/24];
    }
    else if(year==t_year) {
        string=[NSString stringWithFormat:@"%ld月%ld日",(long)month,(long)day];
    }
    else {
        string=[NSString stringWithFormat:@"%ld年%ld月%ld日",(long)year,(long)month,(long)day];
    }
    return string;
    
}


+(NSString*)timeStringStyle3WithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
//    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
//    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
//    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    
//    NSInteger year=[component year];
//    NSInteger month=[component month];
//    NSInteger day=[component day];
    
//    NSDate * today=[NSDate date];
//    component=[calendar components:unitFlags fromDate:today];
    
//    NSInteger t_year=[component year];
    
    NSString*string=nil;
    
    long long distance= [date timeIntervalSinceNow];
//    if(distance<60) {
//        string=[NSString stringWithFormat:@"%lld秒后",distance];
////    }
    if(distance<60*60) {
        string=[NSString stringWithFormat:@"%lld",distance/60];
    }
    else
        if(distance<60*60*24) {
        string=[NSString stringWithFormat:@"%lld",distance/60/60];
    }
    else {
        string=[NSString stringWithFormat:@"%lld",distance/60/60/24];
    }
//    else if(year==t_year) {
//        string=[NSString stringWithFormat:@"%d月%d日",month,day];
//    }
//    else {
//        string=[NSString stringWithFormat:@"%d年%d月%d日",year,month,day];
//    }
    return string;
    
}

+(NSString*)timeStringStyle2WithTime:(NSString *)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date = [formatter dateFromString:time];
    
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    NSInteger hour=[component hour];
    NSInteger minute=[component minute];
    NSInteger week=[component weekOfMonth];
    NSInteger weekday=[component weekday];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSInteger t_year=[component year];
    NSInteger t_month=[component month];
    NSInteger t_day=[component day];
    NSInteger t_week=[component weekOfMonth];
    
    NSString*string=nil;
    if(year==t_year&&month==t_month&&day==t_day)
    {
        if(hour<6&&hour>=0)
            string=[NSString stringWithFormat:@"凌晨 %ld:%02ld",(long)hour,(long)minute];
        else if(hour>=6&&hour<12)
            string=[NSString stringWithFormat:@"上午 %ld:%02ld",(long)hour,(long)minute];
        else if(hour>=12&&hour<18)
            string=[NSString stringWithFormat:@"下午 %ld:%02ld",(long)hour-12,(long)minute];
        else
            string=[NSString stringWithFormat:@"晚上 %ld:%02ld",(long)hour-12,(long)minute];
    }
    else if(year==t_year&&week==t_week)
    {
        NSString * daystr=nil;
        switch (weekday) {
            case 1:
                daystr=@"日";
                break;
            case 2:
                daystr=@"一";
                break;
            case 3:
                daystr=@"二";
                break;
            case 4:
                daystr=@"三";
                break;
            case 5:
                daystr=@"四";
                break;
            case 6:
                daystr=@"五";
                break;
            case 7:
                daystr=@"六";
                break;
            default:
                break;
        }
        string=[NSString stringWithFormat:@"周%@ %02ld:%02ld",daystr,(long)hour,(long)minute];
    }
    else if(year==t_year)
        string=[NSString stringWithFormat:@"%02ld月%ld02日",(long)month,(long)day];
    else
        string=[NSString stringWithFormat:@"%04ld年%02ld月%02ld日",(long)year,(long)month,(long)day];
    
    return string;
}

//  获取剩余天数
+ (NSString *)getSurplusDaysWithCreatDate:(NSString *)creatDate fundDuration:(NSString *)fundDuration
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate * date = [dateFormatter dateFromString:creatDate];
    NSTimeInterval before = [date timeIntervalSince1970] * 1;
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970] * 1;
    NSTimeInterval cha = before - now;
    return [NSString stringWithFormat:@"%d", ((int)(cha / 86400))>0?((int)(cha / 86400)):0];
}



@end

#pragma mark - 16进制颜色(html颜色值)字符串转为UIColor

@implementation UIColor (HexColor)

+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // 字符串cString应该是6-8个长度，如果小于6，返回黑色
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    //
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    //
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end

#pragma mark - 使用color生成图片

@implementation UIImage (WEColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end

#pragma mark - 正则表达式

@implementation NSString (WERegexString)

//邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^1[34578][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}
//车型
+ (BOOL)validateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}
//用户名
+ (BOOL)validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{4,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}
//密码
+ (BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
//昵称
+ (BOOL)validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^([\u4E00-\u9FA5]+|[a-zA-Z]+)$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}
//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//银行卡
+ (BOOL)validateBankCardNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
//银行卡后四位
+ (BOOL)validateBankCardLastNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length != 4) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{4})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}
//CVN
+ (BOOL)validateCVNCode: (NSString *)cvnCode
{
    BOOL flag;
    if (cvnCode.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{3})";
    NSPredicate *cvnCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [cvnCodePredicate evaluateWithObject:cvnCode];
}
//month
+ (BOOL)validateMonth: (NSString *)month
{
    BOOL flag;
    if (month.length != 2) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"(^(0)([0-9])$)|(^(1)([0-2])$)";
    NSPredicate *monthPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [monthPredicate evaluateWithObject:month];
}
//year
+ (BOOL)validateYear: (NSString *)year
{
    BOOL flag;
    if (year.length != 2) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^([1-3])([0-9])$";
    NSPredicate *yearPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [yearPredicate evaluateWithObject:year];
}
//verifyCode
+ (BOOL)validateVerifyCode: (NSString *)verifyCode
{
    BOOL flag;
    if (verifyCode.length != 6) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{6})";
    NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [verifyCodePredicate evaluateWithObject:verifyCode];
}
// 邮政编码
+ (BOOL)validateZipCode:(NSString *)zipCode
{
    BOOL flag;
    if (zipCode.length != 6) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^[1-9]\\d{5}$";
    NSPredicate *zipCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [zipCodePredicate evaluateWithObject:zipCode];
}

@end
