#!/bin/bash
set -e
PATH="/Applications/Marmalade.app/Contents/tools/gcc/x86/android_osx/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/clang/darwin/bin":$PATH
PATH="/Applications/Marmalade.app/Contents/s3e/gcc/darwin/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/usr/bin":$PATH
PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin":$PATH
PATH="/opt/local/bin":$PATH
cd "/Applications/Marmalade.app/Contents/s3e/tools"
/System/Library/Frameworks/Python.framework/Versions/2.7/Resources/Python.app/Contents/MacOS/Python ./process_map.py "${TARGET_BUILD_DIR}/${EXECUTABLE_NAME}"
