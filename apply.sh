#!/bin/bash
set -e

# 获取当前脚本所在目录（patches/）
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TOP_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

KERNEL_SRC="$TOP_DIR/kernel/linux-4.9"

echo "===> Applying kernel patches..."
git -C "$KERNEL_SRC" reset --hard
git -C "$KERNEL_SRC" clean -fd
git -C "$KERNEL_SRC" apply "$SCRIPT_DIR/kernel"/*.patch || true
git -C "$KERNEL_SRC" --no-pager diff

echo

UBOOT_SRC="$TOP_DIR/brandy/brandy-2.0/u-boot-2018"
echo "===> Applying u-boot patches..."
git -C "$UBOOT_SRC" reset --hard
git -C "$UBOOT_SRC" clean -fd
git -C "$UBOOT_SRC" apply "$SCRIPT_DIR/u-boot"/*.patch || true
git -C "$UBOOT_SRC" --no-pager diff

echo
echo "===> All patches processed."
