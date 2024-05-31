FROM quay.io/fedora/fedora-ostree-desktops/base:40
COPY rootfs/ /
RUN rpm-ostree install \
        gdm \
        gnome \
        nautilus \
        distrobox \
        adw-gtk3-theme \
        morewaita-icon-theme \
        system76-scheduler \
        gnome-shell-extension-system76-scheduler \
        gnome-shell-extension-caffeine \
        gnome-shell-extension-dash-to-dock \
        ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts rsms-inter-fonts cascadia-code-fonts \
        gnome-console \
RUN rpm-ostree override remove \
        toolbox
RUN rpm-ostree cleanup -m \
&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl disable NetworkManager-wait-online.service \
&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  rm -rf /tmp /var
RUN rpm -qa | sort
