FROM philcryer/min-wheezy

ARG RACKET_VERSION=6.11
ARG RACKET_INSTALLER_URL=https://mirror.racket-lang.org/installers/$RACKET_VERSION/racket-$RACKET_VERSION-x86_64-linux.sh

ENV SHELL /bin/bash

RUN apt-get update && \
    apt-get install -y wget sqlite3 ca-certificates openssl && \
    rm -rf /var/lib/apt/lists/*


RUN wget --output-document=racket-install.sh -q $RACKET_INSTALLER_URL && \
    echo "yes\n1\n" | /bin/bash racket-install.sh && \
    rm racket-install.sh

# RUN raco setup
# RUN raco pkg config --set catalogs "https://download.racket-lang.org/releases/$RACKET_VERSION/catalog/" "https://pkg-build.racket-lang.org/server/built/catalog/" "https://pkgs.racket-lang.org" "https://planet-compats.racket-lang.org"
