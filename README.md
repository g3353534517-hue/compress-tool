# Compress Tool 📦

A powerful command-line tool for compressing and extracting archive files. Supports multiple formats including ZIP, TAR, TAR.GZ, 7Z, and RAR.

## Features ✨

- **Multiple Formats**: Handle ZIP, TAR, TAR.GZ, TAR.BZ2, 7Z, RAR
- **Easy Compression**: One-command compression with automatic format detection
- **Smart Extraction**: Extract any supported archive format to specified directory
- **Content Listing**: Preview archive contents without extraction
- **Cross-Platform**: Works on Linux, macOS, and Windows (WSL)

## Installation 🔧

### Prerequisites

Install required compression tools:

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

### Install Compress Tool

```bash
# Clone the repository
git clone https://github.com/your-username/compress-tool.git
cd compress-tool

# Make the script executable
chmod +x scripts/compress.sh

# Optional: Add to PATH for global access
sudo ln -s $(pwd)/scripts/compress.sh /usr/local/bin/compress-tool
```

## Usage 🚀

### Basic Commands

```bash
# Compress a directory or file
./scripts/compress.sh compress <input> <output> [format]

# Extract an archive
./scripts/compress.sh extract <archive> [destination]

# List archive contents
./scripts/compress.sh list <archive>
```

### Examples

#### Compression Examples

```bash
# Create ZIP archive (default)
./scripts/compress.sh compress my-folder/ backup.zip

# Create TAR.GZ archive
./scripts/compress.sh compress my-folder/ backup.tar.gz tar.gz

# Create 7Z archive (best compression)
./scripts/compress.sh compress my-folder/ backup.7z 7z

# Create TAR archive
./scripts/compress.sh compress my-file.txt archive.tar tar
```

#### Extraction Examples

```bash
# Extract to current directory
./scripts/compress.sh extract backup.zip

# Extract to specific directory
./scripts/compress.sh extract backup.tar.gz /path/to/extract/

# Extract 7Z archive
./scripts/compress.sh extract archive.7z ./extracted/
```

#### List Contents

```bash
# View ZIP contents
./scripts/compress.sh list backup.zip

# View TAR.GZ contents
./scripts/compress.sh list backup.tar.gz
```

## Supported Formats 📋

| Format | Extension | Command |
|--------|-----------|---------|
| ZIP | `.zip` | `compress input output.zip` |
| TAR | `.tar` | `compress input output.tar tar` |
| TAR.GZ | `.tar.gz`, `.tgz` | `compress input output.tar.gz tar.gz` |
| TAR.BZ2 | `.tar.bz2`, `.tbz2` | `compress input output.tar.bz2 tar.bz2` |
| 7Z | `.7z` | `compress input output.7z 7z` |
| RAR | `.rar` | `compress input output.rar rar` |

## Advanced Usage 💡

### Auto-format Detection

The tool automatically detects format based on file extension when extracting:

```bash
./scripts/compress.sh extract any-archive-file.*
```

### Batch Processing

Process multiple files with shell scripting:

```bash
# Compress all directories in current folder
for dir in */; do
    ./scripts/compress.sh compress "$dir" "${dir%/}.zip"
done
```

## Error Handling ⚠️

Common issues and solutions:

- **"Command not found"**: Install required compression tools (see Installation)
- **"Permission denied"**: Check file permissions or use `sudo`
- **"Corrupted archive"**: Archive may be incomplete or damaged
- **"Disk full"**: Ensure sufficient disk space for extraction

## Contributing 🤝

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author 👤

Created with ❤️ by [Your Name]

---

**Note**: This tool wraps standard compression utilities (`zip`, `tar`, `7z`, `rar`) providing a unified interface for common archive operations.