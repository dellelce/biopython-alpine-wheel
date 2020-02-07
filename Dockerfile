# Docker image used to test/develop inside my standard docker environment
FROM dellelce/py-base as build

# Base Packages and wheel build
RUN apk add gcc libc-dev binutils linux-headers && \
    mkdir /wheel && cd /wheel && \
    pip3 install wheel && \
    pip3 wheel numpy biopython

# Deployment
FROM scratch

COPY --from=build /wheel /wheel
