//
//  AzureDate.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/8/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "AzureDate.h"

@implementation AZDate
- (instancetype)init {
    return [self initFromString:nil];
}
- (instancetype)initFromString:(NSString *)string {
    return [self initWithFormat:@"yyyy-MM-dd" fromString:string];
}
- (instancetype)initWithFormat:(NSString *)format fromString:string {
    if (self = [super init]) {
        self.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.dateFormat = format;
        _dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        if (string) {
            NSDateComponents *src = [AZDate dateFromString:string withFormatter:_dateFormatter];
            src.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
            self.year = src.year;
            self.month = src.month;
            self.day = src.day;
            self.hour = src.hour;
            self.minute = src.minute;
            self.second = src.second;
        }
    }
    return self;
}
+ (NSDateComponents *)dateFromString:(NSString *)string withFormatter:(NSDateFormatter *)formater {
    NSDate *date = [formater dateFromString:[string uppercaseString]];
    if (date == nil) {
        @throw [NSException exceptionWithName:@"DateFromString"
                                       reason:[NSString stringWithFormat:@"Failed to parse date from the string '%@'", string]
                                     userInfo:nil];
    }
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSCalendarUnit unitFlags = NSCalendarUnitYear  | NSCalendarUnitMonth
        | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [cal components:unitFlags fromDate:date];
    return components;
}
- (nonnull NSString *)toString {
    NSDate* date = [[NSCalendar currentCalendar]dateFromComponents:self];
    return [_dateFormatter stringFromDate:date];
}
@end

@implementation AZDateTimeRfc1123
- (instancetype)initFromString:(NSString*)string {
    
    return [super initWithFormat:@"EEE, dd MMM yyyy HH:mm:ssZ" fromString:string];
}
@end

@implementation AZDateTime
- (instancetype)initFromString:(NSString *)string {
    return [super initWithFormat:@"yyyy-MM-dd'T'HH:mm:ssZ" fromString:string];
}
@end





