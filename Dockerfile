FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y --no-install-recommends \
 fontconfig texlive-bibtex-extra texlive-fonts-extra texlive-fonts-recommended texlive-latex-base texlive-latex-extra transfig librsvg2-2 wget python3 python3-pip vim librsvg2-bin lmodern texlive-lang-french make \
 && rm -rf /var/lib/apt/lists/*
RUN wget --no-check-certificate https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-1-amd64.deb \
   && dpkg -i pandoc* && rm pandoc* && apt-get clean
RUN pip3 install setuptools 
RUN pip3 install pandoc-latex-fontsize pandoc-numbering
RUN mkdir /src
VOLUME [/src]
WORKDIR /src
CMD ["bash"]