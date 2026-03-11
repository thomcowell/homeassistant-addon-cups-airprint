ARG BUILD_FROM
FROM $BUILD_FROM

LABEL io.hass.version="1.5" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt update \
    && apt install -y --no-install-recommends \
        sudo \
        locales \
        cups \
        cups-filters \
        avahi-daemon \
        libnss-mdns \
        dbus \
        colord \
        printer-driver-all-enforce \
        printer-driver-all \
        printer-driver-brlaser \
        printer-driver-gutenprint \
        openprinting-ppds \
        hpijs-ppds \
        hp-ppd  \
        hplip \
        printer-driver-foo2zjs \
        printer-driver-hpcups \
        printer-driver-escpr \
        cups-pdf \
        gnupg2 \
        lsb-release \
        nano \
        samba \
        bash-completion \
        procps \
        whois \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

# Build SpliX 2.0.1 from source (fixes Samsung M202x band-width bug, merged in commit 62a25031)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git make g++ libcups2-dev libcupsimage2-dev \
    && git clone --depth=1 https://github.com/OpenPrinting/splix.git /tmp/splix \
    && cd /tmp/splix \
    && sed -i \
        -e 's/pkg-config --cflags cups/cups-config --cflags/g' \
        -e 's/pkg-config --libs cups/cups-config --libs/g' \
        rules.mk \
    && make DISABLE_JBIG=1 \
    && make install \
    && rm -rf /tmp/splix \
    && apt-get purge -y git make g++ \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Add Canon cnijfilter2 driver
RUN cd /tmp \
  && if [ "$(arch)" = 'x86_64' ]; then ARCH="amd64"; else ARCH="arm64"; fi \
  && curl https://gdlp01.c-wss.com/gds/0/0100012300/02/cnijfilter2-6.80-1-deb.tar.gz -o cnijfilter2.tar.gz \
  && tar -xvf ./cnijfilter2.tar.gz cnijfilter2-6.80-1-deb/packages/cnijfilter2_6.80-1_${ARCH}.deb \
  && mv cnijfilter2-6.80-1-deb/packages/cnijfilter2_6.80-1_${ARCH}.deb cnijfilter2_6.80-1.deb \
  && apt install ./cnijfilter2_6.80-1.deb

COPY rootfs /

# Add user and disable sudo password checking
RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
&& sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

EXPOSE 631

RUN chmod a+x /run.sh

CMD ["/run.sh"]
