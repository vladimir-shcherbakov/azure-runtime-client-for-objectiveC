//
//  BaseModel.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "SimpleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject <AZCodable>

@property NSArray<SimpleModel*>* baseArray;
@property NSDictionary<NSString*,SimpleModel*>* baseDict;
@property NSNumber* baseNumber;
@property NSString* baseString;
@property SimpleModel* baseSimpleModel;

@end

NS_ASSUME_NONNULL_END
