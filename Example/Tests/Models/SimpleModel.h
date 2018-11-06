//
//  SImpleModel.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <AzureClientRuntime/AzureClientRuntime.h>

NS_ASSUME_NONNULL_BEGIN

@interface SimpleModel : NSObject  <AZCodable>

@property NSString* simpleString;
@property NSNumber* simpleNumber;

@end

NS_ASSUME_NONNULL_END
