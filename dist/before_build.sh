#!/bin/bash -e

if [ "$BUILD_OS" == "linux" ]; then
        sudo apt-get update
        sudo apt-get install -y libasound2-dev libjack-jackd2-dev libpulse-dev libpulse0
        wget http://lv2plug.in/spec/lv2-1.14.0.tar.bz2
        tar xjf lv2-1.14.0.tar.bz2 
        pushd lv2-1.14.0 && ./waf configure && ./waf build && sudo ./waf install && popd
elif [ "$BUILD_OS" == "macos" ]; then
        security create-keychain -p travis sl-build.keychain
        security list-keychains -s ~/Library/Keychains/sl-build.keychain
        security unlock-keychain -p travis ~/Library/Keychains/sl-build.keychain
        security set-keychain-settings ~/Library/Keychains/sl-build.keychain
        #security import ./dist/keychain/apple.cer -k ~/Library/Keychains/sl-build.keychain -A
        #security import ./dist/keychain/cert.cer -k ~/Library/Keychains/sl-build.keychain -A
        security import ./dist/keychain/cert_2020.p12 -k ~/Library/Keychains/sl-build.keychain -P $KEY_PASSWORD_2020 -A
        security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k travis sl-build.keychain
fi
