# ffmpeg-it

**ffmpeg-it** is a wrapper bash script designed to encode files in the current directory and subdirectories using ffmpeg. It provides a simple command-line interface for encoding midia files with various options.

## Features

- Encode multiple input extensions at once.
- Batch processing in the current directory and subdirectories.
- Recursive search with optional maximum depth.
- Hardware acceleration support via VAAPI.
- Explicit video codec selection (`h264`, `h265`).
- Resolution presets for easy video resizing.
- Quality control via CRF (CPU) or QP (VAAPI).
- Optional preservation of all streams (video, audio, subtitles, metadata).
- Subtitle codec selection.
- Concatenation of multiple inputs into a single output.
- Debug mode to inspect the generated ffmpeg command.
- Pass-through of arbitrary ffmpeg arguments.

## Install
Just execute
```bash
curl -s https://gitlab.com/gphilippi/ffmpeg-it/-/raw/master/install.sh | bash || echo "ERROR: fail to download install script"
```
or, instead, use
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
- `--resolution PRESET`: Resize the video using a predefined resolution preset. (Available presets: `sd` 854x480, `hd`/`720p` 1280x720, `fullhd`/`fhd`/`1080p` 1920x1080, `2k` 2560x1440, `4k` 3840x2160, `phone` 720x1280) 
- `-q, --quality QUALITY_VALUE`: Sets the encoding quality (it uses CRF or QP). 
- `-s, --subscodec`: Select the subtitle codec. Options: dvdsub, none (default: none).
- `--allstreams`: Encode all the available video, audio, subtitles and metadata streams. (default: false)
- `-r, --recursive[=MAXDEPTH]`: Search for video files recursively in subdirectories (default: false). Optionally specify the maximum depth to search (default: no maximum).
- `--concatenate`: Concatenate all input videos into a single output file. All inputs are re-encoded and combined using a filter_complex graph.
- `--debug`: Print the generated ffmpeg command and exit without executing it.
- `--`: All arguments after `--` are passed directly to ffmpeg.

## Examples


1. Encode with H.264 all `.mov` files in the current directory to `.mp4` files using hardware acceleration:
```bash
ffmpeg-it mov -o mp4 -c h264 -a
```

2. Encode all `.mp4` files with H.265, resize to 1080p
```bash
ffmpeg-it mp4 -c h265 --resolution=1080p
```

3. Encode with H.265 all `.mp4` files in the current directory and its subdirectories (with depth 2) using hardware acceleration in device /dev/dri/renderD129 (use `ls /dev/dri/render*` to check available renders):
```bash
ffmpeg-it mp4 -c h265 --acceleration=/dev/dri/renderD129 --recursive=2
```
> Tip: to use optional parameters, use the long option name `--<option>` fallowed by `=<value>` without space between them.

4. Encode all `.avi` files in the current directory and its subdirectories to `.mkv` files using H.265 codec and delete the source files after it:
```bash
ffmpeg-it avi -o mkv -c h265 -r -D
```

5. Encode all `.mkv` files in the current directory to `.mp4` files including all available streams (video, audio, subtitles and metadata), using dvdsub as subtitle codec:
```bash
ffmpeg-it mkv -o mp4 --allstreams -s dvdsub
```

6. To encode all `.mp4`, `.mp3`, `.avi`, `.m4v`, `.3gp` and `.mkv` files in the current directory and all subdirectories, deleting the sources after it, use:
```bash
ffmpeg-it mp4 mp3 avi m4v 3gp mkv -r -D
```
> Useful to reduce disk space usage by these files, but will automatically remove streams.

7. Encode videos while passing custom ffmpeg flags directly:
```bash
ffmpeg-it mp4 -- -movflags +faststart
```

8. Encode using VAAPI with explicit quality control:
```bash
ffmpeg-it mkv -c h264 -a -q 22
```

9. Encode all `.mp4` files with H.264, resize to 720p and inspect the generated command:
```bash
ffmpeg-it mp4 -c h264 --resolution=720p --debug
```

## License

This project is licensed under the GNU General Public License v2.1 - see the [LICENSE](LICENSE) file for details.

## Thanks

This script is one expansion of the [reply](https://stackoverflow.com/a/63137721/13890688) from Marco Eckstein in StackOverflow. 
Thank you Marco :)
