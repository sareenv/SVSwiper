#!/bin/bash

# SVSwiper Build Script
# Simple script to build the iOS Swift package

echo "🔨 Building SVSwiper for iOS..."
echo ""

# Build for iOS Simulator
swift build --sdk $(xcrun --sdk iphonesimulator --show-sdk-path) \
    -Xswiftc "-target" \
    -Xswiftc "arm64-apple-ios14.0-simulator"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build completed successfully!"
else
    echo ""
    echo "❌ Build failed!"
    exit 1
fi
