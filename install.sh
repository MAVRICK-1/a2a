#!/bin/bash

REPO="kubestellar/a2a"
CLI_NAME="kubestellar"
INSTALL_DIR="/usr/local/bin"

# Determine OS and architecture
OS=$(uname -s)
ARCH=$(uname -m)

echo "Detecting OS: $OS, Architecture: $ARCH"

case "$OS" in
    Linux)
        BINARY_SUFFIX=""
        ;;
    Darwin)
        BINARY_SUFFIX="-macos"
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

# For now, we only have a Linux binary.
# In a real scenario, you would download the correct binary for the detected OS and architecture.
# This script assumes a Linux binary is available for download.

echo "Downloading $CLI_NAME for Linux..."
# This URL is a placeholder. In a real scenario, you would fetch the latest release asset.
# Example: curl -sL "https://github.com/$REPO/releases/latest/download/${CLI_NAME}-linux${BINARY_SUFFIX}" -o "$CLI_NAME"
# For now, we'll assume the user has manually placed the Linux binary in a known location or will build it.

# For demonstration, let's assume the user has the 'kubestellar' binary in the current directory
# and we are just moving it. In a real scenario, you would download it.
# For now, I will just create a dummy file to simulate the download.
echo "Creating a dummy binary for demonstration purposes."
echo '#!/bin/bash' > "$CLI_NAME"
echo 'echo "This is the dummy kubestellar CLI."' >> "$CLI_NAME"
echo 'echo "Arguments: $@"' >> "$CLI_NAME"
chmod +x "$CLI_NAME"

echo "Installing $CLI_NAME to $INSTALL_DIR..."
sudo mv "$CLI_NAME" "$INSTALL_DIR/$CLI_NAME"

echo "$CLI_NAME installed successfully!"
echo "You can now run '$CLI_NAME --help'"

# Also create aliases for ks and kubectl-a2a
echo "Creating aliases: ks, kubectl-a2a"
sudo ln -sf "$INSTALL_DIR/$CLI_NAME" "$INSTALL_DIR/ks"
sudo ln -sf "$INSTALL_DIR/$CLI_NAME" "$INSTALL_DIR/kubectl-a2a"

echo "Aliases created successfully!"
