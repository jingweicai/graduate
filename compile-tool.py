#!/usr/bin/env python3
"""
ThuThesis 编译控制工具
提供命令行界面和自动化编译功能
"""

import os
import sys
import subprocess
import json
from pathlib import Path
from datetime import datetime
import argparse

class ThesisCompiler:
    def __init__(self):
        self.project_dir = Path(__file__).parent
        self.build_dir = self.project_dir / "build"
        self.thesis_file = self.project_dir / "thesis.tex"
        self.log_file = self.project_dir / ".compile_log.json"
        
    def log_compile(self, target, status, time_taken):
        """记录编译信息"""
        logs = self._load_logs()
        logs.append({
            "timestamp": datetime.now().isoformat(),
            "target": target,
            "status": status,
            "time": time_taken
        })
        with open(self.log_file, 'w') as f:
            json.dump(logs, f, indent=2)
    
    def _load_logs(self):
        """加载编译日志"""
        if self.log_file.exists():
            with open(self.log_file) as f:
                return json.load(f)
        return []
    
    def compile_thesis(self):
        """编译论文"""
        print("📖 开始编译论文...")
        result = subprocess.run(
            ["make", "thesis"],
            cwd=self.project_dir,
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            print("✓ 论文编译成功")
            return True
        else:
            print("✗ 编译失败")
            print(result.stderr)
            return False
    
    def preview_thesis(self):
        """预览论文"""
        print("👁️ 打开论文预览...")
        result = subprocess.run(
            ["make", "viewthesis"],
            cwd=self.project_dir,
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            print("✓ 预览已打开")
            return True
        else:
            print("✗ 预览失败")
            return False
    
    def clean(self):
        """清理编译文件"""
        print("🧹 清理编译文件...")
        result = subprocess.run(
            ["make", "clean"],
            cwd=self.project_dir,
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            print("✓ 清理完成")
            return True
        else:
            print("✗ 清理失败")
            return False
    
    def distclean(self):
        """全部清理"""
        print("🗑️ 全部清理...")
        result = subprocess.run(
            ["make", "distclean"],
            cwd=self.project_dir,
            capture_output=True,
            text=True
        )
        
        if result.returncode == 0:
            print("✓ 全部清理完成")
            return True
        else:
            print("✗ 全部清理失败")
            return False
    
    def status(self):
        """显示项目状态"""
        print("\n📊 项目状态信息")
        print("=" * 50)
        print(f"项目目录: {self.project_dir}")
        print(f"主文件: {self.thesis_file.name}")
        print(f"主文件存在: {'✓' if self.thesis_file.exists() else '✗'}")
        
        # 显示最近编译记录
        logs = self._load_logs()
        if logs:
            print("\n最近编译记录:")
            for log in logs[-3:]:
                print(f"  [{log['timestamp']}] {log['target']}: {log['status']} ({log['time']}s)")
        else:
            print("\n还没有编译记录")
        print("=" * 50 + "\n")

def main():
    parser = argparse.ArgumentParser(
        description='ThuThesis 编译控制工具',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python compile-tool.py compile    # 编译论文
  python compile-tool.py preview    # 预览论文
  python compile-tool.py clean      # 清理文件
  python compile-tool.py status     # 显示状态
        """
    )
    
    parser.add_argument('action', 
                        choices=['compile', 'preview', 'clean', 'distclean', 'status'],
                        help='要执行的操作')
    
    args = parser.parse_args()
    compiler = ThesisCompiler()
    
    if args.action == 'compile':
        success = compiler.compile_thesis()
        sys.exit(0 if success else 1)
    elif args.action == 'preview':
        success = compiler.preview_thesis()
        sys.exit(0 if success else 1)
    elif args.action == 'clean':
        success = compiler.clean()
        sys.exit(0 if success else 1)
    elif args.action == 'distclean':
        success = compiler.distclean()
        sys.exit(0 if success else 1)
    elif args.action == 'status':
        compiler.status()

if __name__ == '__main__':
    main()
