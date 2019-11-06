FROM moul/kernel-builder

RUN apt-get update && apt-get 	install -y 			\
    imagemagick     \
    graphviz        \
    dvipng          \
    fonts-dejavu    \
    fonts-noto-cjk  \
    latexmk         \
    librsvg2-bin    \
    virtualenv      \
    texlive-xetex   \
    flex            \
    bison           \
    libelf-dev      
# Update gcc to ver 8
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get 	install -y \
    gcc-8   \
    g++-8
# Now we have 2 versions of gcc: version 5 from moul/kernel-builder and version 8 that we just installed
# Set version 8 as default gcc:
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 90 --slave /usr/bin/g++ g++ /usr/bin/g++-8