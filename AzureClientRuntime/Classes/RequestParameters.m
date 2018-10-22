//
//  RequestParameters.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "RequestParameters.h"

@implementation RequestParameters

- (instancetype) initWithUrl: (NSString*) url withMethod: (NSString*) method withHeaders: (NSDictionary*) headers withBody: (NSData*) body {
    
    self = [super init];
    if (self) {
        self.url = url;
        self.mehod = method;
        self.headers = [[NSMutableDictionary alloc] initWithDictionary:headers];
        self.body = body;
    }
    
    return self;
}

+ (instancetype) createWithUrl: (NSString*) url withMethod: (NSString*) method withHeaders: (NSDictionary*) headers withBody: (NSData* _Nullable) body {
    RequestParameters* p = [[RequestParameters alloc] initWithUrl:url withMethod:method withHeaders:headers withBody:body];
    return p;
}

-(void)withSpecialHeaders:(NSDictionary*)headers {
    if (headers) {
        [self.headers addEntriesFromDictionary:headers];
    }
}

@end
