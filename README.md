# ffmpeg-it

**ffmpeg-it** is a wrapper bash script designed to encode files in the current directory and subdirectories using ffmpeg. It provides a simple command-line interface for encoding midia files with various options.

## Features

- Specify a list of input extensions to encode.
- Enable hardware acceleration for encoding.
- Optionally delete source files after encoding.
- Choose between different video codecs (h264, h265, none).
- Encode files recursively in subdirectories.

## Install
```bash
make install
```

## Usage

```bash
ffmpeg-it --help
```
### Options

- `-h, --help`: show usage message
- `-o, --output-extension`: Specify the output video file extension (default: same as source file).
- `-D, --delete`: Delete source files after encoding (default: false).
- `-a, --acceleration`: Enable hardware acceleration for encoding (default: false). Optionally specify the device render (default: /dev/dri/renderD128).
- `-c, --codec`: Select the video codec. Options: h264, h265, none (default: h264).
- `-r, --recursive`: Search for video files recursively in subdirectories (default: false). Optionally specify the maximum depth to search (default: no maximum).

## Examples


1. Encode all `.mov` files in the current directory to `.mp4` files using hardware acceleration:
```bash
ffmpeg-it mov -o mp4 -a
```

2. Encode all `.mp4` files in the current directory and its subdirectories (with depth 2) using hardware acceleration in device /dev/dri/renderD129 (dedicated GPU):
```bash
ffmpeg-it mp4 --acceleration=/dev/dri/renderD129 --recursive=2
```
> Tip: to use optional parameters, use the long option name `--<option>` fallowed by `=<value>` without space between them.

3. Encode all `.avi` files in the current directory and its subdirectories to `.mkv` files using H.265 codec and delete the source files after encoding:
```bash
ffmpeg-it avi -o mkv -c h265 -r -D
```

4. To encode with h264 all `.mp4`, `.avi`, `.m4v`, `.3gp` and `.mkv` files in the current directory and all subdirectories use:
```bash
ffmpeg-it mp4 avi m4v 3gp mkv -r -D
```
> Useful for trying to reduce disk space usage by these files

5. Encode all `.wmv` files in the current directory to `.mp4` files without force a codec:
```bash
ffmpeg-it wmv -o mp4 -c none
```

## License

This project is licensed under the GNU General Public License v2.1 - see the [LICENSE](LICENSE) file for details.

## Thanks

This script is one expansion of the [reply](https://stackoverflow.com/a/63137721/13890688) from Marco Eckstein in StackOverflow. 
Thank you Marco :)
