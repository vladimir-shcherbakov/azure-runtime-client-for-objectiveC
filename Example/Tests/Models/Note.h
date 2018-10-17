//
//  Note.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/3/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <AzureClientRuntime/AzureClientRuntime.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSObject <NSCoding>

@property NSString * title;
@property NSString * author;
@property BOOL published;

@end

NS_ASSUME_NONNULL_END
