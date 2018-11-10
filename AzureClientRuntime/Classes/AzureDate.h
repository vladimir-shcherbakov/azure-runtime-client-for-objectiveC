//
//  AzureDate.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/8/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AZDateString <NSObject>

- (instancetype)initFromString:string;
- (NSString *)toString;

@end

@interface AZDate : NSDateComponents <AZDateString>
{
    @protected NSDateFormatter *_dateFormatter;
}
- (instancetype)initWithFormat:(NSString *)format fromString:string;
@end

@interface AZDateTimeRfc1123 : AZDate
@end

@interface AZDateTime : AZDate
@end

NS_ASSUME_NONNULL_END
