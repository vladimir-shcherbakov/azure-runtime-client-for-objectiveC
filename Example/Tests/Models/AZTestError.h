//
//  AZTestError.h
//  AzureClientRuntime_Tests
//
//  Created by Vladimir Shcherbakov on 11/10/18.
//  Copyright © 2018 vladimir-shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AzureClientRuntime/AzureClientRuntime.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Error body.
 */
@interface AZTestErrorBase : NSObject <AZCodable>
/**
 * The code property.
 */
@property NSString *code;
/**
 * The message property.
 */
@property NSString *message1;
@end

/**
 * Error information returned by the API.
 */
@interface AZTestError : NSObject <AZCodable>
/**
 * The error property.
 */
@property AZTestErrorBase *error;
@end

NS_ASSUME_NONNULL_END
