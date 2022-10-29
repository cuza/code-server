FROM ubuntu:22.04
RUN apt-get update && apt-get install -y wget && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
VOLUME [ "/var/lib/code-server" ]
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/usr/local/bin/code-server", "serve", "--accept-server-license-terms", "--random-name", "--server-data-dir", "var/lib/code-server" ]
