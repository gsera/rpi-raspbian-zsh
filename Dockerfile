FROM resin/rpi-raspbian:jessie-20160915

RUN apt-get update && \ 
	apt-get install -y --no-install-recommends \
        build-essential \
        curl \
		wget \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        rsync \
        unzip \
		vim \
		git \
		zsh \
		screen \
		tmux

RUN apt-get install -y --no-install-recommends \
		python3 \
		python3-dev \
		libblas-dev \
		liblapack-dev\
    	libatlas-base-dev \
		gfortran \
        python3-pip \
        tk-dev \
        python3-tk \
        pkg-config \
        libfreetype6-dev \
		libjpeg-dev \
		zlib1g-dev
RUN  apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
        rm get-pip.py

RUN pip install -U --upgrade pip

RUN chsh -s /usr/bin/zsh
# use grml zshrc (https://grml.org/zsh/)
RUN wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
RUN wget -O ~/.zshrc.local  http://git.grml.org/f/grml-etc-core/etc/skel/.zshrc

WORKDIR "/src"

CMD ["/usr/bin/zsh"]
