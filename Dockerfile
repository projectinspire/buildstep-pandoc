FROM progrium/buildstep

# install haskell
RUN apt-get update -y && apt-get install -y haskell-platform

# install pandoc
RUN cabal update && cabal install pandoc

ADD run.sh /run.sh
RUN chmod +x /run.sh

ONBUILD RUN mkdir -p /app
ONBUILD ADD . /app
ONBUILD RUN /build/builder

ENTRYPOINT ["/run.sh"]
