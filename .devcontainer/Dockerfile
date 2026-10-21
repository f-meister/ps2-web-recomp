# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required build tools, C++20 Clang compiler, Python, 7-Zip, and native dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    lld \
    cmake \
    ninja-build \
    python3 \
    python3-pip \
    p7zip-full \
    git \
    curl \
    ca-certificates \
    libsdl2-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Set Clang as the default C/C++ compiler as preferred by ps2-web-recomp
ENV CC=clang
ENV CXX=clang++
