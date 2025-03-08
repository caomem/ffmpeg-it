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
- `-a, --acceleration`: Enable hardware acceleration for encoding (default: false). Optionally specify the device render (default: the first one available). Use `ls /dev/dri/render*` to check available renders.
- `-c, --codec`: Select the video codec. Options: h264, h265, none (default: none).
- `-s, --subscodec`: Select the subtitle codec. Options: dvdsub, none (default: none).
- `--allstreams`: Encode all the available video, audio, subtitles and metadata streams. (default: false)
- `-r, --recursive`: Search for video files recursively in subdirectories (default: false). Optionally specify the maximum depth to search (default: no maximum).
- `--concatenate`: *Beta* option to concatenate all video inputs in the same output.mp4 file using h265 and crf 35 (compression).

## Examples


1. Encode with H.264 all `.mov` files in the current directory to `.mp4` files using hardware acceleration:
```bash
ffmpeg-it mov -o mp4 -c h264 -a
```

2. Encode with H.265 all `.mp4` files in the current directory and its subdirectories (with depth 2) using hardware acceleration in device /dev/dri/renderD129 (use `ls /dev/dri/render*` to check available renders):
```bash
ffmpeg-it mp4 -c h265 --acceleration=/dev/dri/renderD129 --recursive=2
```
> Tip: to use optional parameters, use the long option name `--<option>` fallowed by `=<value>` without space between them.

3. Encode all `.avi` files in the current directory and its subdirectories to `.mkv` files using H.265 codec and delete the source files after it:
```bash
ffmpeg-it avi -o mkv -c h265 -r -D
```

4. Encode all `.mkv` files in the current directory to `.mp4` files including all available streams (video, audio, subtitles and metadata), using dvdsub as subtitle codec:
```bash
ffmpeg-it mkv -o mp4 --allstreams -s dvdsub
```

1. To encode all `.mp4`, `.mp3`, `.avi`, `.m4v`, `.3gp` and `.mkv` files in the current directory and all subdirectories, deleting the sources after it, use:
```bash
ffmpeg-it mp4 mp3 avi m4v 3gp mkv -r -D
```
> Useful to reduce disk space usage by these files, but will automatically remove streams.

## License

This project is licensed under the GNU General Public License v2.1 - see the [LICENSE](LICENSE) file for details.

## Thanks

This script is one expansion of the [reply](https://stackoverflow.com/a/63137721/13890688) from Marco Eckstein in StackOverflow. 
Thank you Marco :)
