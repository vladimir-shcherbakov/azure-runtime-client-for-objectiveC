//
//  AzureRuntimeClient.h
//  RuntimeClient
//
//  Created by Vladimir Shcherbakov on 10/2/18.
//  Copyright © 2018 Vladimir Shcherbakov. All rights reserved.
//
#ifdef __OBJC__
#import <UIKit/UIKit.h>

#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

FOUNDATION_EXPORT double AzureClientRuntimeVersionNumber;
FOUNDATION_EXPORT const unsigned char AzureClientRuntimeVersionString[];

#import <Foundation/Foundation.h>
#import <AzureClientRuntime/Codable.h>
#import <AzureClientRuntime/DefaultErrorModel.h>
#import <AzureClientRuntime/RequestHelper.h>
