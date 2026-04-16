#!/bin/bash
# Compress skill main script

set -e

USAGE="Usage: $0 [compress|extract|list] [options]

Commands:
  compress <input> <output> [format]  # Compress input to output
  extract <archive> [destination]     # Extract archive to destination  
  list <archive>                      # List archive contents

Formats: zip, tar, tar.gz, tar.bz2, 7z, rar
"

if [ $# -lt 2 ]; then
    echo "$USAGE"
    exit 1
fi

COMMAND=$1
shift

case $COMMAND in
    compress)
        if [ $# -lt 2 ]; then
            echo "compress requires input and output"
            exit 1
        fi
        INPUT=$1
        OUTPUT=$2
        FORMAT=${3:-zip}
        
        case $FORMAT in
            zip)
                zip -r "$OUTPUT" "$INPUT"
                ;;
            tar)
                tar -cf "$OUTPUT" "$INPUT"
                ;;
            tar.gz|tgz)
                tar -czf "$OUTPUT" "$INPUT"
                ;;
            tar.bz2|tbz2)
                tar -cjf "$OUTPUT" "$INPUT"
                ;;
            7z)
                7z a "$OUTPUT" "$INPUT"
                ;;
            rar)
                rar a "$OUTPUT" "$INPUT"
                ;;
            *)
                echo "Unsupported format: $FORMAT"
                exit 1
                ;;
        esac
        echo "Compressed $INPUT to $OUTPUT ($FORMAT)"
        ;;
        
    extract)
        if [ $# -lt 1 ]; then
            echo "extract requires archive path"
            exit 1
        fi
        ARCHIVE=$1
        DEST=${2:-.}
        
        if [ ! -f "$ARCHIVE" ]; then
            echo "Archive not found: $ARCHIVE"
            exit 1
        fi
        
        mkdir -p "$DEST"
        
        case $ARCHIVE in
            *.zip)
                unzip "$ARCHIVE" -d "$DEST"
                ;;
            *.tar)
                tar -xf "$ARCHIVE" -C "$DEST"
                ;;
            *.tar.gz|*.tgz)
                tar -xzf "$ARCHIVE" -C "$DEST"
                ;;
            *.tar.bz2|*.tbz2)
                tar -xjf "$ARCHIVE" -C "$DEST"
                ;;
            *.7z)
                7z x "$ARCHIVE" -o"$DEST"
                ;;
            *.rar)
                unrar x "$ARCHIVE" "$DEST/"
                ;;
            *)
                echo "Unknown archive format for: $ARCHIVE"
                exit 1
                ;;
        esac
        echo "Extracted $ARCHIVE to $DEST"
        ;;
        
    list)
        if [ $# -lt 1 ]; then
            echo "list requires archive path"
            exit 1
        fi
        ARCHIVE=$1
        
        if [ ! -f "$ARCHIVE" ]; then
            echo "Archive not found: $ARCHIVE"
            exit 1
        fi
        
        case $ARCHIVE in
            *.zip)
                unzip -l "$ARCHIVE"
                ;;
            *.tar|*.tar.gz|*.tgz|*.tar.bz2|*.tbz2)
                tar -tvf "$ARCHIVE"
                ;;
            *.7z)
                7z l "$ARCHIVE"
                ;;
            *.rar)
                unrar l "$ARCHIVE"
                ;;
            *)
                echo "Unknown archive format for: $ARCHIVE"
                exit 1
                ;;
        esac
        ;;
        
    *)
        echo "Unknown command: $COMMAND"
        echo "$USAGE"
        exit 1
        ;;
esac