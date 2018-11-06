//
//  OperationError.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/7/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "AZOperationError.h"

@implementation AZOperationError

+ (instancetype) errorWithDomain: (OpDamain*) domain withReason: (NSString*) reason {
    AZOperationError* oe = [AZOperationError new];
    oe.domain = domain;
    oe.reason = reason;
    return oe;
}

@end
