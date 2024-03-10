# ffmpeg-it

**ffmpeg-it** is a wrapper bash script designed to encode files in the current directory and subdirectories using ffmpeg. It provides a simple command-line interface for encoding midia files with various options.

## Features

- Encode files using ffmpeg.
- Specify input and output file extensions.
- Optionally delete source files after encoding.
- Enable hardware acceleration for encoding.
- Choose between different video codecs (h264, h265, none).
- Search for files recursively in subdirectories.

## Install
```bash
make install
```

## Usage

```bash
ffmpeg-it [-i|--input-extension SOURCE_EXTENSION] 
                          [-o|--output-extension OUTPUT_EXTENSION] 
                          [-D|--delete] 
                          [-a|--acceleration [DEVICE]]
                          [-c|--codec {h264|h265|none}]
                          [-r|--recursive [MAXDEPTH]]
```
### Options

- `-i, --input-extension`: Specify the input video file extension (default: mp4).
- `-o, --output-extension`: Specify the output video file extension (default: mp4).
- `-D, --delete`: Delete source files after encoding (default: false).
- `-a, --acceleration`: Enable hardware acceleration for encoding. Optionally specify the device render (default: /dev/dri/renderD128).
- `-c, --codec`: Select the video codec. Options: h264, h265, none (default: h264).
- `-r, --recursive`: Search for video files recursively in subdirectories (default: false). Optionally specify the maximum depth to search.

## Examples

1. Encode all `.mov` files in the current directory to `.mp4` files using hardware acceleration:
```bash
ffmpeg-it -i mov -o mp4 -a
```

2. Encode all `.mp4` files in the current directory and its subdirectories (with depth 2) to `.mp4` files using hardware acceleration:
```bash
ffmpeg-it -i mp4 -o mp4 -a -r 2
```

3. Encode all `.avi` files in the current directory and its subdirectories to `.mkv` files using H.265 codec and delete the source files after encoding:
```bash
ffmpeg-it -i avi -o mkv -c h265 -r -D
```

4. Encode all `.wmv` files in the current directory and its subdirectories to `.avi` files without hardware acceleration:
```bash
ffmpeg-it -i wmv -o avi -a none -r
```

## License

This project is licensed under the GNU General Public License v2.1 - see the [LICENSE](LICENSE) file for details.