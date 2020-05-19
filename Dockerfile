FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV LIVESTREAM_KEY "unset"

RUN apt-get update

RUN apt-get install -y \
  libgstreamer1.0-0 \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-libav \
  gstreamer1.0-doc \
  gstreamer1.0-tools \
  gstreamer1.0-x \
  gstreamer1.0-alsa \
  gstreamer1.0-gl \
  gstreamer1.0-gtk3 \
  gstreamer1.0-qt5 \
  gstreamer1.0-pulseaudio

CMD gst-launch-1.0 \
  videotestsrc ! \
  x264enc ! \
  queue ! \
  flvmux streamable=true ! \
  rtmpsink sync=false location=rtmps://global-live.mux.com:443/app/$LIVESTREAM_KEY