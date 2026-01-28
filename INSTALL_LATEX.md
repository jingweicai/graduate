# 📦 LaTeX 环境安装指南

由于自动下载遇到网络问题，请按以下步骤手动安装 MiKTeX。

## 方案 A：MiKTeX（推荐，快速轻量）

### 步骤 1：下载安装程序
1. 访问 [MiKTeX 官方网站](https://miktex.org/download)
2. 点击 "Windows" 或直接下载：
   - **完整版**: https://miktex.org/download/ctan/systems/win32/miktex/tm/miktexsetup-latest.exe
   - **便携版**: https://miktex.org/download/ctan/systems/win32/miktex/tm/miktexsetup-portable.zip

### 步骤 2：安装
1. 运行下载的安装程序
2. 选择安装路径（默认即可）
3. 点击 "安装" 并等待完成
4. 重启计算机

### 步骤 3：验证安装
打开 PowerShell 并运行：
```powershell
xetex --version
latexmk --version
```

如果显示版本号，说明安装成功！

---

## 方案 B：TeX Live（功能完整，但文件较大）

### 步骤 1：下载
访问 [TeX Live 官方](https://www.tug.org/texlive/) 并下载 Windows 版本

### 步骤 2：安装
运行安装程序并按照提示完成

### 步骤 3：验证
```powershell
xetex --version
```

---

## 方案 C：通过 WSL (Windows Subsystem for Linux)

如果您已安装 WSL2：

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install texlive-full latexmk

# 验证
xetex --version
```

---

## 安装完成后

### 测试编译
回到项目目录后，运行：

```powershell
cd "c:\Users\Admin\Desktop\ThuThesis__Tsinghua_University_Thesis"
make thesis
```

首次编译需要 5-10 分钟以下载必需的包，这是正常的。

### 快速预览
编译完成后，您可以用以下方式预览：

```powershell
make viewthesis    # 编译并打开 PDF
# 或
./compile.bat preview
```

---

## 🆘 常见问题

### Q: 安装后仍然找不到 xetex？
**A**: 重启计算机或 PowerShell，让系统更新 PATH 变量。

### Q: 编译时下载包很慢？
**A**: 这是第一次编译的正常行为。可以在 MiKTeX 设置中配置国内镜像源以加快速度。

### Q: 还有其他问题？
**A**: 
- 查看编译错误信息
- 确保项目文件夹路径不含中文
- 尝试清理后重新编译：`make distclean && make thesis`

---

## 📝 完成安装后的下一步

1. ✅ 安装 LaTeX 环境
2. 测试编译：`make thesis`
3. 打开预览：`make viewthesis`
4. 开始编辑论文内容

祝编写论文顺利！🎓
