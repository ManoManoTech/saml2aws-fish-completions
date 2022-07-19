# Specify fish version to use during build
# docker build -t <image> --build-arg FISH_VERSION=<version>
ARG FISH_VERSION
FROM andreiborisov/fish:${FISH_VERSION}

# Redeclare ARG so its value is available after FROM (cf. https://github.com/moby/moby/issues/34129#issuecomment-417609075)
ARG FISH_VERSION
RUN printf "\nBuilding \e[38;5;27mFish-%s\e[m\n\n" ${FISH_VERSION}

# Install dependencies
USER root
RUN apk add \
    --no-cache \
    coreutils \
    gawk \
    gzip \
    tar

# Install saml2aws
RUN mkdir -p "/usr/local/bin/" \
    && CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1) \
    && curl -Ls https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz | tar -xzv -C /usr/local/bin \
    && chmod u+x /usr/local/bin/saml2aws 

USER nemo

# Copy source code
COPY --chown=nemo:nemo . /tmp/app/
WORKDIR /tmp/app/
SHELL ["/usr/local/bin/fish", "-c"]
RUN fisher install /tmp/app

ENTRYPOINT ["fish", "-c"]
CMD ["fishtape tests/*.test.fish"]
