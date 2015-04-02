FROM tutum/buildstep

# install haskell
RUN apt-get update -y && apt-get install -y haskell-platform

# install pandoc
RUN cabal update && cabal install pandoc
