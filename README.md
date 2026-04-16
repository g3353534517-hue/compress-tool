# Compress Tool 📦

一个强大的命令行工具，用于压缩和解压归档文件。支持多种格式，包括 ZIP、TAR、TAR.GZ、7Z 和 RAR。

## 功能特性 ✨

- **多格式支持**: 处理 ZIP、TAR、TAR.GZ、TAR.BZ2、7Z、RAR
- **简单压缩**: 一键压缩，自动格式检测
- **智能解压**: 解压任何支持的归档格式到指定目录
- **内容预览**: 在不解压的情况下查看归档内容
- **跨平台**: 支持 Linux、macOS 和 Windows (WSL)

## 安装 🔧

### 先决条件

安装所需的压缩工具：

**Ubuntu/Debian:**
```bash
sudo apt install zip unzip tar gzip p7zip-full unrar
```

**macOS (Homebrew):**
```bash
brew install zip unzip gnu-tar p7zip unrar
```

**CentOS/RHEL:**
```bash
sudo yum install zip unzip tar gzip p7zip-plugins unrar
```

### 安装 Compress Tool

```bash
# 克隆仓库
git clone https://github.com/your-username/compress-tool.git
cd compress-tool

# 赋予脚本执行权限
chmod +x scripts/compress.sh

# 可选：添加到 PATH 以便全局访问
sudo ln -s $(pwd)/scripts/compress.sh /usr/local/bin/compress-tool
```

## 使用方法 🚀

### 基本命令

```bash
# 压缩目录或文件
./scripts/compress.sh compress <输入> <输出> [格式]

# 解压归档文件
./scripts/compress.sh extract <归档文件> [目标目录]

# 列出归档内容
./scripts/compress.sh list <归档文件>
```

### 使用示例

#### 压缩示例

```bash
# 创建 ZIP 归档（默认）
./scripts/compress.sh compress my-folder/ backup.zip

# 创建 TAR.GZ 归档
./scripts/compress.sh compress my-folder/ backup.tar.gz tar.gz

# 创建 7Z 归档（最佳压缩率）
./scripts/compress.sh compress my-folder/ backup.7z 7z

# 创建 TAR 归档
./scripts/compress.sh compress my-file.txt archive.tar tar
```

#### 解压示例

```bash
# 解压到当前目录
./scripts/compress.sh extract backup.zip

# 解压到指定目录
./scripts/compress.sh extract backup.tar.gz /path/to/extract/

# 解压 7Z 归档
./scripts/compress.sh extract archive.7z ./extracted/
```

#### 查看内容

```bash
# 查看 ZIP 内容
./scripts/compress.sh list backup.zip

# 查看 TAR.GZ 内容
./scripts/compress.sh list backup.tar.gz
```

## 支持的格式 📋

| 格式 | 扩展名 | 命令 |
|--------|-----------|---------|
| ZIP | `.zip` | `compress input output.zip` |
| TAR | `.tar` | `compress input output.tar tar` |
| TAR.GZ | `.tar.gz`, `.tgz` | `compress input output.tar.gz tar.gz` |
| TAR.BZ2 | `.tar.bz2`, `.tbz2` | `compress input output.tar.bz2 tar.bz2` |
| 7Z | `.7z` | `compress input output.7z 7z` |
| RAR | `.rar` | `compress input output.rar rar` |

## 高级用法 💡

### 自动格式检测

工具在解压时会根据文件扩展名自动检测格式：

```bash
./scripts/compress.sh extract any-archive-file.*
```

### 批量处理

使用 shell 脚本处理多个文件：

```bash
# 压缩当前文件夹中的所有目录
for dir in */; do
    ./scripts/compress.sh compress "$dir" "${dir%/}.zip"
done
```

## 错误处理 ⚠️

常见问题及解决方案：

- **"Command not found"**: 安装所需的压缩工具（参见安装部分）
- **"Permission denied"**: 检查文件权限或使用 `sudo`
- **"Corrupted archive"**: 归档文件可能不完整或已损坏
- **"Disk full"**: 确保有足够的磁盘空间进行解压

## 贡献 🤝

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

## 许可证 📄

本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件。

## 作者 👤

由 [Your Name] 创建 ❤️

---

**注意**: 此工具封装了标准压缩工具 (`zip`, `tar`, `7z`, `rar`)，为常见的归档操作提供统一接口。