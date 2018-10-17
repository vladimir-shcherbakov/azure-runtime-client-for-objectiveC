//
//  ComplexModel.h
//  RuntimeClientTests
//
//  Created by Vladimir Shcherbakov on 10/4/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "BaseModel.h"
#import "SimpleModel.h"


NS_ASSUME_NONNULL_BEGIN

//@class SimpleModel;

@interface ComplexModel : BaseModel <Codable>

//@property NSString* string;
@property SimpleModel* complexSimpleModel;
@property NSArray<SimpleModel*>* comlexArray;
@property NSDictionary<NSString*, SimpleModel*>* complexDict;

@end

NS_ASSUME_NONNULL_END
