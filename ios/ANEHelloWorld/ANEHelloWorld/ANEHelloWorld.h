//
//  ANEHelloWorld.h
//  ANEHelloWorld
//
//  Created by moremorefor on 2015/05/27.
//  Copyright (c) 2015 moremorefor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

@interface ANEHelloWorld : NSObject
@end

DEFINE_ANE_FUNCTION(HelloWorldShowAlert);

FREObject GetHelloWorld(
                        FREContext ctx,
                        void* funcData,
                        uint32_t argc,
                        FREObject arg[]
                        );

void HelloWorldContextInitializer(
                        void* extData,
                        const uint8_t* ctxType,
                        FREContext ctx,
                        uint32_t* numFunctionsToTest,
                        const FRENamedFunction** functionsToSet
                        );

void HelloWorldContextFinalizer(FREContext ctx);

void HelloWorldInitializer(
                    void** extDataToSet,
                    FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet
                    );
void HelloWorldFinalizer(void* extData);