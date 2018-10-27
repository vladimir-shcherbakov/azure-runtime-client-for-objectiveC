//
//  Codable.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coder.h"
#import "AzureDate.h"
#import "AzureTypes.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Codable <NSObject>

- (void)encodeWithCoder:(id<Coder>)encoder;
- (nullable instancetype)initWithDecoder:(id<Coder>)decoder;

@end

NS_ASSUME_NONNULL_END
