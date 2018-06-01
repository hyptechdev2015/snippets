The Raspbian repos have avonv instead of ffmpeg. If, like me, you want ffmpeg because it has some functionality not available in avconv then you can use static builds. Go to https://ffmpeg.org/download.html#build-linux click the 'Linux Static Builds' link and so on. If you have a Raspberry Pi 3 get the armhf build. If you have one of the first generation Pi you need the armel build. I don't have a Pi 2, but if you do why not try both builds and leave a comment about which one works.

There's a bunch of blogs posts about getting ffmpeg on Raspbian by compiling it from source. I don't know if that'd result in a binary more optimised for the Pi than the static builds referred to above. I've found the performance of the static builds adequate enough that I haven't bothered trying to build it. I suspect that doing little more than a git checkout and build, as all the guides I found described, would result in a binary with the functionality I want. It'd take a while to find out given how long a build would take on the Pi, especially a first generation. Though you could do cross compiling on an x86 machine if you were so inclined.

via: https://www.johnvansickle.com/ffmpeg/

```
#!/bin/bash
# Still to come, see if the script runs with root privileges else exit

# Download FFMPEG static daily build and it's md5

# or exit if not
cd /home/ || exit 2

# 1. get the file
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-armhf-32bit-static.tar.xz

### 2. Check the md5 is correct
#if ! diff <(md5sum ffmpeg-release-armhf-32bit-static.tar.xz) \
#          <(curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-armhf-32bit-static.tar.xz.md5)
#then 
#    printf "%s\n" "md5sum doesn't match..." >&2 
#    exit 1
#fi

# 3. untar
tar -xf /home/ffmpeg-release-armhf-32bit-static.tar.xz

# 4. and so on..
cp /home/ffmpeg-*-static/ff* /usr/bin/
cp /home/ffmpeg-*-static/ff* /usr/local/bin/
cp /home/ffmpeg-*-static/qt-faststart /usr/bin/
cp /home/ffmpeg-*-static/qt-faststart /usr/local/bin/
# Consider change second location to use ln -s
# Remove downloads and do some clean up

rm -fr /home/ffmpeg-*

# 5 ..link
cd /var/airsonic/transcode/
ln -s /usr/bin/ffmpeg
ls -alh

#EOF
```