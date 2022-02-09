# hls2mp4

**hls2mp4** is a command-line tool whoch wrapped with docker image. It converts an online m3u8 playlist to a mp4 file.

Please add the following code to your `bash_rc` file
```bash
hls2mp4()
{
  ! docker system info &>/dev/null && echo 'Error: docker is not running' && return
  ! { docker images | grep hls2mp4 &> /dev/null } && echo 'Error: missing hls2mp4 image' && return

  m3u8Url=$1
  mp4File=$2
  [ -z $1 ] && echo 'Error: missing m3u8 url\n\nUsage:\n  hls2mp4 [m3u8Url] [mp4 filename (optional)]' && return
  [ -z $2 ] && mp4File="output.mp4"

  docker run --rm -v `pwd`:/app/share hls2mp4 $m3u8Url $mp4File
}
```
