#!/bin/bash
# ThuThesis 编译控制工具启动脚本 (Linux/macOS)

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

print_usage() {
    cat << EOF

╔════════════════════════════════════════╗
║   ThuThesis 编译控制工具 v1.0           ║
╚════════════════════════════════════════╝

使用方法: ./compile.sh [命令]

可用命令:
  compile     - 编译论文 (生成 thesis.pdf)
  preview     - 预览论文 (编译并打开 PDF)
  doc         - 编译文档
  clean       - 清理编译文件
  distclean   - 全部清理
  status      - 显示项目状态

示例:
  ./compile.sh compile    # 编译论文
  ./compile.sh preview    # 预览论文

EOF
}

case "${1:-}" in
    compile)
        echo ""
        echo "📖 开始编译论文..."
        cd "$SCRIPT_DIR"
        make thesis
        echo ""
        echo "✓ 论文编译成功"
        ;;
    preview)
        echo ""
        echo "👁️ 打开论文预览..."
        cd "$SCRIPT_DIR"
        make viewthesis
        ;;
    doc)
        echo ""
        echo "📚 编译文档..."
        cd "$SCRIPT_DIR"
        make doc
        ;;
    clean)
        echo ""
        echo "🧹 清理编译文件..."
        cd "$SCRIPT_DIR"
        make clean
        echo "✓ 清理完成"
        ;;
    distclean)
        echo ""
        echo "🗑️ 全部清理..."
        cd "$SCRIPT_DIR"
        make distclean
        echo "✓ 全部清理完成"
        ;;
    status)
        echo ""
        echo "📊 项目状态信息"
        echo "════════════════════════════════════════"
        echo "项目目录: $SCRIPT_DIR"
        echo "主文件: thesis.tex"
        if [ -f "$SCRIPT_DIR/thesis.tex" ]; then
            echo "主文件存在: ✓"
        else
            echo "主文件存在: ✗"
        fi
        echo "════════════════════════════════════════"
        ;;
    *)
        print_usage
        if [ -n "${1:-}" ]; then
            echo "❌ 未知命令: $1"
            exit 1
        fi
        ;;
esac
