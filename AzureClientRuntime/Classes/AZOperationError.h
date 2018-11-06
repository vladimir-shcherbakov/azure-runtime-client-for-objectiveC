//
//  OperationError.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/7/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString OpDamain;

@interface AZOperationError : NSObject

@property OpDamain* domain;
@property NSString* reason;

+ (instancetype) errorWithDomain: (OpDamain*) domain withReason: (NSString*) reason;

@end

NS_ASSUME_NONNULL_END
