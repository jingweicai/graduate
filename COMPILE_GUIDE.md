# 📚 ThuThesis 编译和预览指南

## 概述

本指南介绍如何使用新添加的可视化编译和预览工具来管理 ThuThesis 项目的编译过程。

## 🎯 功能特性

### 1. **VS Code 集成任务** 
   - 在 VS Code 中按 `Ctrl+Shift+B` 快速编译论文
   - 支持多个编译目标（论文、文档等）
   - 自动问题匹配和错误高亮

### 2. **Web 可视化控制面板**
   - 美观的图形化界面
   - 实时编译状态显示
   - 编译日志记录

### 3. **命令行编译工具**
   - Python 编译工具 (`compile-tool.py`)
   - Windows 批处理脚本 (`compile.bat`)
   - Linux/macOS Shell 脚本 (`compile.sh`)

### 4. **自动编译预览**
   - 编译后自动打开 PDF 查看器
   - 支持热编译和实时预览

---

## 📖 使用方法

### 方式一：VS Code 集成任务（推荐）

#### 快速编译论文
按 `Ctrl+Shift+B` 或在终端中输入：
```bash
Ctrl+Shift+B
```
这将使用默认编译任务编译论文。

#### 运行特定任务
1. 按 `Ctrl+Shift+P` 打开命令面板
2. 输入 `Tasks: Run Task`
3. 选择需要的任务：
   - 📖 编译论文 (Compile Thesis)
   - 👁️ 预览论文 (Preview Thesis)
   - 📚 编译文档 (Compile Documentation)
   - 🧹 清理编译文件 (Clean)
   - 🗑️ 全部清理 (Distclean)
   - ✨ 生成项目类文件 (Generate Classes)

#### 任务配置位置
`.vscode/tasks.json` - 包含所有编译任务的配置

---

### 方式二：Web 可视化面板

#### 打开面板
在浏览器中打开 `compile-panel.html`：
```bash
# Windows
start compile-panel.html

# macOS
open compile-panel.html

# Linux
xdg-open compile-panel.html
```

#### 面板功能
- **编译功能**
  - 📖 编译论文 - 编译主论文文件
  - 📚 编译文档 - 编译项目文档
  - ✨ 生成类文件 - 生成 .cls 类文件

- **预览功能**
  - 👁️ 预览论文 - 编译并打开 PDF
  - 📄 打开PDF - 直接打开已生成的 PDF

- **文件管理**
  - 🧹 清理编译文件 - 清理临时编译文件
  - 🗑️ 全部清理 - 清理所有编译产物

---

### 方式三：命令行工具

#### Python 编译工具

```bash
# 编译论文
python compile-tool.py compile

# 预览论文
python compile-tool.py preview

# 清理编译文件
python compile-tool.py clean

# 全部清理
python compile-tool.py distclean

# 显示项目状态
python compile-tool.py status
```

**要求**：Python 3.6+

#### Windows 批处理脚本

```batch
# 编译论文
compile.bat compile

# 预览论文
compile.bat preview

# 编译文档
compile.bat doc

# 清理编译文件
compile.bat clean

# 全部清理
compile.bat distclean

# 显示项目状态
compile.bat status

# 显示帮助
compile.bat
```

#### Linux/macOS Shell 脚本

```bash
# 给脚本执行权限（第一次使用）
chmod +x compile.sh

# 编译论文
./compile.sh compile

# 预览论文
./compile.sh preview

# 编译文档
./compile.sh doc

# 清理编译文件
./compile.sh clean

# 全部清理
./compile.sh distclean

# 显示项目状态
./compile.sh status

# 显示帮助
./compile.sh
```

---

## 🔧 编译工作流程

### 典型工作流程

```
1. 编辑论文内容 (data/*.tex)
   ↓
2. 按 Ctrl+Shift+B 编译
   ↓
3. 查看编译结果
   ↓
4. 修复错误（如有）
   ↓
5. 重复编译直到完成
```

### 第一次编译

第一次编译可能需要较长时间（5-10分钟），后续编译会更快。

```bash
# 方式一：VS Code
Ctrl+Shift+B

# 方式二：命令行
compile.bat compile        # Windows
./compile.sh compile       # Linux/macOS
python compile-tool.py compile
```

### 预览论文

编译完成后预览 PDF：

```bash
# 方式一：VS Code 任务
# 运行"预览论文"任务，会自动编译并打开PDF

# 方式二：命令行
compile.bat preview        # Windows
./compile.sh preview       # Linux/macOS
python compile-tool.py preview
```

### 清理编译文件

```bash
# 清理临时编译文件
compile.bat clean          # Windows
./compile.sh clean         # Linux/macOS

# 全部清理（包括PDF）
compile.bat distclean      # Windows
./compile.sh distclean     # Linux/macOS
```

---

## 📊 项目结构

```
.
├── .vscode/
│   ├── tasks.json           # VS Code 编译任务配置
│   └── extensions.json      # 推荐扩展配置
├── compile-panel.html       # Web 可视化控制面板
├── compile-tool.py          # Python 编译工具
├── compile.bat              # Windows 编译脚本
├── compile.sh               # Linux/macOS 编译脚本
│
├── thesis.tex               # 主论文文件
├── data/                    # 论文内容目录
│   ├── abstract.tex
│   ├── chap01-Intro.tex
│   ├── ... (其他章节)
│   └── conclusion.tex
│
├── figures/                 # 图表目录
│   ├── 2022DAC/
│   ├── 2023HPCA/
│   └── ... (其他期刊/会议)
│
├── ref/                     # 参考文献目录
│   ├── refs.bib
│   └── appendix.bib
│
└── Makefile                 # 编译配置文件
```

---

## 🐛 故障排除

### 问题 1：编译失败，提示找不到 xetex

**解决方案**：
- 确保已安装完整的 LaTeX 发行版（如 TeX Live、MiKTeX）
- Windows: 下载并安装 [MiKTeX](https://miktex.org/) 或 [TeX Live](https://www.tug.org/texlive/)
- macOS: 安装 [MacTeX](https://www.tug.org/mactex/)
- Linux: `sudo apt-get install texlive-full` (Ubuntu/Debian)

### 问题 2：编译很慢

**解决方案**：
- 第一次编译是正常的（需要下载所有需要的包）
- 后续编译会快得多
- 尝试运行 `compile.bat clean` 后重新编译

### 问题 3：PDF 预览打不开

**解决方案**：
- 确保已安装 PDF 查看器
- 手动打开 `thesis.pdf` 文件
- 检查编译是否成功完成

### 问题 4：VS Code 任务不显示

**解决方案**：
- 重新加载 VS Code 窗口（`Ctrl+Shift+P` -> Reload Window）
- 确保 `.vscode/tasks.json` 文件存在
- 检查 JSON 语法是否正确

---

## 📝 编辑论文

### 论文结构

主论文文件：`thesis.tex`

章节文件位置：`data/`
- `data/abstract.tex` - 摘要
- `data/chap01-Intro.tex` - 第一章：介绍
- `data/chap02-Background.tex` - 第二章：背景
- ... (其他章节)
- `data/conclusion.tex` - 结论

### 添加图表

图表应存放在 `figures/` 目录下：

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{figures/INTRO/Overview.pdf}
  \caption{项目概览}
  \label{fig:overview}
\end{figure}
```

### 添加参考文献

参考文献存放在 `ref/` 目录下：
- `ref/refs.bib` - 主要参考文献
- `ref/appendix.bib` - 附录参考文献

编辑 `.bib` 文件后重新编译即可。

---

## 🎓 相关资源

- [ThuThesis 官方文档](https://github.com/jingweicai/graduate)
- [LaTeX 官方指南](https://www.latex-project.org/)
- [xetex 文档](http://tug.org/xetex/)
- [清华大学学位论文要求](https://www.tsinghua.edu.cn/)

---

## 📞 支持

如有问题或建议，请：
1. 查看编译输出日志
2. 检查 LaTeX 错误信息
3. 参考项目 README 文件
4. 提交 Issue 到 GitHub 仓库

---

## 📅 版本历史

### v1.0 (2025-01-28)
- ✅ 添加 VS Code 集成任务
- ✅ 创建 Web 可视化控制面板
- ✅ 开发 Python 编译工具
- ✅ 提供 Windows、Linux、macOS 脚本
- ✅ 编写完整使用文档

---

**快乐编写论文！** 📝🎓
