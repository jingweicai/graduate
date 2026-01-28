@echo off
REM ThuThesis 编译控制面板启动脚本 (Windows)

if "%1"=="" (
    echo.
    echo ╔════════════════════════════════════════╗
    echo ║   ThuThesis 编译控制工具 v1.0           ║
    echo ╚════════════════════════════════════════╝
    echo.
    echo 使用方法: compile.bat [命令]
    echo.
    echo 可用命令:
    echo   compile     - 编译论文 (生成 thesis.pdf)
    echo   preview     - 预览论文 (编译并打开 PDF)
    echo   doc         - 编译文档
    echo   clean       - 清理编译文件
    echo   distclean   - 全部清理
    echo   status      - 显示项目状态
    echo.
    echo 示例:
    echo   compile.bat compile    REM 编译论文
    echo   compile.bat preview    REM 预览论文
    echo.
    goto :eof
)

if "%1"=="compile" (
    echo.
    echo 📖 开始编译论文...
    make thesis
    if errorlevel 1 (
        echo.
        echo ✗ 编译失败
        exit /b 1
    )
    echo.
    echo ✓ 论文编译成功
    exit /b 0
)

if "%1"=="preview" (
    echo.
    echo 👁️ 打开论文预览...
    make viewthesis
    exit /b %errorlevel%
)

if "%1"=="doc" (
    echo.
    echo 📚 编译文档...
    make doc
    exit /b %errorlevel%
)

if "%1"=="clean" (
    echo.
    echo 🧹 清理编译文件...
    make clean
    echo ✓ 清理完成
    exit /b 0
)

if "%1"=="distclean" (
    echo.
    echo 🗑️ 全部清理...
    make distclean
    echo ✓ 全部清理完成
    exit /b 0
)

if "%1"=="status" (
    echo.
    echo 📊 项目状态信息
    echo ════════════════════════════════════════
    echo 项目目录: %CD%
    echo 主文件: thesis.tex
    if exist thesis.tex (
        echo 主文件存在: ✓
    ) else (
        echo 主文件存在: ✗
    )
    echo ════════════════════════════════════════
    exit /b 0
)

echo 未知命令: %1
exit /b 1
