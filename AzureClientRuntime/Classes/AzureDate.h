//
//  AzureDate.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/8/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DateString <NSObject>

- (instancetype) initFromString: string;
- (NSString*) toString;

@end





@interface Date : NSDateComponents <DateString>

{
    @protected NSDateFormatter* _dateFormatter;
}

- (instancetype) initWithFormat: (NSString*) format fromString: string;

@end




@interface DateTimeRfc1123 : Date
@end




@interface DateTime : Date
@end



NS_ASSUME_NONNULL_END
