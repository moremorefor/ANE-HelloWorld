#!/bin/zsh

# .p12 file
P12=test.p12

# armv7 armv7s
xcodebuild -project ios/ANEHelloWorld/ANEHelloWorld.xcodeproj -configuration Release -sdk iphoneos -target ANEHelloWorld clean build ARCHS="armv7 armv7s" IPHONEOS_DEPLOYMENT_TARGET='8.0' TARGET_BUILD_DIR=../../tmp/ios/build-arm BUILD_PRODUCT_DIR=../../tmp/ios/build-arm
# arm64
xcodebuild -project ios/ANEHelloWorld/ANEHelloWorld.xcodeproj -configuration Release -sdk iphoneos -target ANEHelloWorld clean build ARCHS="arm64" IPHONEOS_DEPLOYMENT_TARGET='8.0' TARGET_BUILD_DIR=../../tmp/ios/build-arm64 BUILD_PRODUCT_DIR=../../tmp/ios/build-arm64
# i386
xcodebuild -project ios/ANEHelloWorld/ANEHelloWorld.xcodeproj -configuration Release -sdk iphonesimulator -target ANEHelloWorld clean build ARCHS="i386" IPHONEOS_DEPLOYMENT_TARGET='8.0' TARGET_BUILD_DIR=../../tmp/ios/build-i386 BUILD_PRODUCT_DIR=../../tmp/ios/build-i386
# x86_64
xcodebuild -project ios/ANEHelloWorld/ANEHelloWorld.xcodeproj -configuration Release -sdk iphonesimulator -target ANEHelloWorld clean build ARCHS="x86_64" IPHONEOS_DEPLOYMENT_TARGET='8.0' TARGET_BUILD_DIR=../../tmp/ios/build-x86_64 BUILD_PRODUCT_DIR=../../tmp/ios/build-x86_64

mkdir tmp

lipo -create tmp/ios/build-arm/libANEHelloWorld.a tmp/ios/build-arm64/libANEHelloWorld.a tmp/ios/build-i386/libANEHelloWorld.a tmp/ios/build-x86_64/libANEHelloWorld.a -output "tmp/libANEHelloWorld.a"

# SWC
acompc -source-path ./actionscript/src -include-classes net.moremorefor.HelloWorldExtension -swf-version=14 -output ./tmp/ANEHelloWorld_ASLIB.swc -external-library-path /Applications/Adobe\ Flash\ CC\ 2014/AIR14.0/frameworks/libs/air/airglobal.swc

# library.swf
unzip -d tmp/ -o tmp/ANEHelloWorld_ASLIB.swc

# ANE
adt -package -storetype pkcs12 -keystore "$P12" -target ane bin/ANEHelloWorld.ane build/extension.xml -swc tmp/ANEHelloWorld_ASLIB.swc -platform iPhone-ARM -C tmp/ . -platform default -C tmp/ .

rm -rf tmp

cp -f bin/ANEHelloWorld.ane example/ANEHelloWorld.ane
