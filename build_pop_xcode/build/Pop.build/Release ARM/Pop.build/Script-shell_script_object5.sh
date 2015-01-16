#!/bin/bash
set -e
if [ "$CONFIGURATION" = "Release" -o "$CONFIGURATION" = "Release ARM" ]; then echo "skipping for release builds" && exit 0; fi
if [ "$CONFIGURATION" = "Debug" -o "$CONFIGURATION" = "Release" ]; then echo "skipping for x86 builds" && exit 0; fi
PATH="/Applications/Marmalade.app/Contents/tools/gcc/x86/android_osx/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/clang/darwin/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/gcc/darwin/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/usr/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin":$PATH
PATH="/opt/local/bin":$PATH
s3e_plink -o "/Users/David/Downloads/Pop/build_pop_xcode/build/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}/Pop.s3e" --arch=armv6 --compiler=clang -u -d --usemap="/Users/David/Downloads/Pop/build_pop_xcode/build/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}/Pop.map" "${TARGET_BUILD_DIR}/${EXECUTABLE_NAME}"
