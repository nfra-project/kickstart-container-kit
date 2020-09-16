## CKit shoud stay a LTS Relese before to provide backwards compatibility to glibc
FROM ubuntu:18.04
LABEL   maintainer="Matthias Leuffen <m@tth.es>" \
        org.infracamp.flavor.tag="${DOCKER_TAG}" \
        org.infracamp.flavor.name="${IMAGE_NAME}"

ADD /kickstart /kickstart

## Ignore ubuntu tools and other stuff for this image.
RUN chmod -R 755 /kickstart \
    && /kickstart/_int_build/install-ckit.sh \
    && /kickstart/flavor/build.d/30-setup-user-rights.sh \
    && rm -rf /var/lib/apt/lists/*

##
## ENV is not exported to importing container. Defaults
## are set on top of entrypoint.sh (like DEV_UID, DEV_TTY,...)


# Use for debugging:
#ENTRYPOINT ["/bin/bash"]

## Don't append standalone parameter - only in projects
WORKDIR /opt
ENTRYPOINT ["/kickstart/run/entrypoint.sh"]

