#!/bin/bash

# Exit on error
set -e

# Install mise if not already installed
if ! command -v mise &>/dev/null; then
  bash "$(dirname "${BASH_SOURCE[0]}")/../terminal/mise.sh"
fi

# Install Swift dependencies for Linux
sudo apt-get update
sudo apt-get install -y binutils git gnupg2 libc6-dev libcurl4-openssl-dev \
  libedit2 libgcc-9-dev libpython3.8 libsqlite3-0 libstdc++-9-dev \
  libxml2-dev libz3-dev pkg-config tzdata unzip zlib1g-dev

# Note: Swift on Linux has limited mise support
# Using official Swift installation method
SWIFT_VERSION="5.9.2"
SWIFT_URL="https://download.swift.org/swift-${SWIFT_VERSION}-release/ubuntu2004/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-ubuntu20.04.tar.gz"

# Download and install Swift
cd /tmp
wget "$SWIFT_URL" -O swift.tar.gz
tar xzf swift.tar.gz
sudo mv "swift-${SWIFT_VERSION}-RELEASE-ubuntu20.04" /opt/swift
sudo ln -sf /opt/swift/usr/bin/swift /usr/local/bin/swift
sudo ln -sf /opt/swift/usr/bin/swiftc /usr/local/bin/swiftc

# Create Swift package template
SWIFT_TEMPLATE_DIR="$HOME/.swift-package-template"
if [ ! -d "$SWIFT_TEMPLATE_DIR" ]; then
  mkdir -p "$SWIFT_TEMPLATE_DIR"
  cat >"$SWIFT_TEMPLATE_DIR/Package.swift" <<'EOF'
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: []),
        .testTarget(
            name: "MyPackageTests",
            dependencies: ["MyPackage"]),
    ]
)
EOF
fi

# Clean up
rm -f /tmp/swift.tar.gz

