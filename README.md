# hls2mp4

Please add the following code to your bash_rc file
```
hls2mp4()
{
  ! docker system info &>/dev/null && echo 'Error: docker is not running' && return
  ! { docker images | grep hls2mp4 &> /dev/null } && echo 'Error: missing hls2mp4 image' && return

  docker run --rm -v `pwd`:/app/share hls2mp4 $1 $2
}
```