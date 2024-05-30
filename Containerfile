FROM quay.io/fedora-ostree-desktops/base:40
COPY rootfs/ /
#RUN rpm-ostree override remove $(< /tmp/base-packages)
RUN rpm-ostree cleanup -m \
#&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl disable NetworkManager-wait-online.service \
#&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  rm -rf /tmp /var
