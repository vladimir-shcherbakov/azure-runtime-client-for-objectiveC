//
//  Note.m
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/3/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//

#import "Note.h"

@implementation Note

static NSDictionary* codingKeys = nil;

+ (void) initCodingKeys {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        codingKeys = @{
                       @"title":@"titileJson",
                       @"author":@"authorJson",
                       @"published":@"publishedJson",
                       };
    });
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    
    if (self = [super init]) {
        [Note initCodingKeys];
        //BOOL res = [decoder containsValueForKey:@"title"];
        self.title = [decoder decodeObjectForKey: [codingKeys objectForKey:@"title"] ];
        self.author = [decoder decodeObjectForKey:[codingKeys objectForKey:@"author"]];
        self.published = [decoder decodeBoolForKey:[codingKeys objectForKey:@"published"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [Note initCodingKeys];
    [encoder encodeObject: self.title forKey: [codingKeys objectForKey:@"title"]];
    [encoder encodeObject: self.author forKey:[codingKeys objectForKey:@"author"]];
    [encoder encodeBool: self.published forKey:[codingKeys objectForKey:@"published"]];
}

@end
