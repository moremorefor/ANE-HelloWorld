//
//  ANEHelloWorld.m
//  ANEHelloWorld
//
//  Created by moremorefor on 2015/05/27.
//  Copyright (c) 2015年 moremorefor. All rights reserved.
//

#import "ANEHelloWorld.h"

@implementation ANEHelloWorld

@end

#pragma mark - C interface

DEFINE_ANE_FUNCTION(HelloWorldShowAlert) {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Hello World!" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    UIViewController *rootView = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootView presentViewController:alert animated:YES completion:nil];
    
    return nil;
}


#pragma mark - ANE

void HelloWorldContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
                        uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    *numFunctionsToTest = 1;
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*1);
    func[0].name = (const uint8_t*)"HelloWorldShowAlert";
    func[0].functionData = NULL;
    func[0].function = &HelloWorldShowAlert;
    
    *functionsToSet = func;
}
void HelloWorldContextFinalizer(FREContext ctx) {
    return;
}

void HelloWorldInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &HelloWorldContextInitializer;
    *ctxFinalizerToSet = &HelloWorldContextFinalizer;
}
void HelloWorldFinalizer(void* extData) {
    return;
}