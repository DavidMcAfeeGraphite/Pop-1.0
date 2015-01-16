#!/bin/bash
set -e
if [ "$CONFIGURATION" = "Debug" -o "$CONFIGURATION" = "Debug ARM" ]; then echo "skipping for debug builds" && exit 0; fi
if [ "$CONFIGURATION" = "Debug ARM" -o "$CONFIGURATION" = "Release ARM" ]; then echo "skipping for arm builds" && exit 0; fi
PATH="/Applications/Marmalade.app/Contents/tools/gcc/x86/android_osx/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/clang/darwin/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/gcc/darwin/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/usr/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin":$PATH
PATH="/opt/local/bin":$PATH
cd "/Applications/Marmalade.app/Contents/s3e/loader/osx"
/usr/bin/python ./postlink.py "${TARGET_BUILD_DIR}/${EXECUTABLE_NAME}" "/Users/David/Downloads/Pop/build_pop_xcode/build/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}/Pop.s86"
