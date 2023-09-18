sudo pacman -Syu

echo "installing login manager sddm'
sudo pacman -S sddm
sudo systemctl enable sddm

echo "installing essentials"
sudo pacman -S bluez blueman bluez-utils archlinux-keyring tar p7zip unrar rsync htop fuse-exfat flac aria2 curl wget xfat-utils ntfs-3g jasper jdk17-openjdk intel-ucode base-devel reflector okular ranger dolphin    

echo "enabling bluetooth"
sudo systemctl enable bluetooth

echo "installing rust, go"
sudo pacman -S rust go zig

echo "installing developement setup packages"
sudo pacman -S nodejs-lts-hydrogen npm yarn pnpm 

echo "global npm dev installs"
npm i -g nx@latest @react-native-community/cli

echo "installing python packages'
sudo pacman -S python python-pip python-django python-fastapi python-flask python-vitualenv

echo "installing basic and essential packages"
sudo pacman -S flatpak firefox vlc thunderbird gimp krita kdenlive libreoffice-fresh elisa obsidian kvantum bat exa ripgrep fzf rofi ttf-cascadia-code-nerd neofetch vim neovim nano alacritty ufw eog

echo "starting up ufw"
sudo systemctl enable ufw
sudo systemctl start ufw

echo "installing bunjs"
curl -fsSL https://bun.sh/install | bash 

echo "installing security tools"
sudo pacman -S aircrack-ng macchanger arp-scan bettercap net-tools p7zip wireshark-cli 

echo "installing solana'
sh -c "$(curl -sSfL https://release.solana.com/v1.16.13/install)"

echo "installing and setting up tauri"
sudo pacman -Syu
sudo pacman -S --needed \
    webkit2gtk \
    base-devel \
    curl \
    wget \
    file \
    openssl \
    appmenu-gtk-module \
    gtk3 \
    libappindicator-gtk3 \
    librsvg \
    libvips
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup update


echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

echo "installing packages with yay"
yay -Sy balena-etcher youtube-dl timeshift

echo "installing aur packages with flatpak"

echo "installing vscode"
yay -S visual-studio-code-bin

echo "installing chrome"
flatpak install flathub com.google.Chrome

echo "installing edge"
flatpak install flathub com.microsoft.Edge

echo "installing brave browser"
flatpak install flathub com.brave.Browser

echo "installing obs studio"
flatpak install flathub com.obsproject.Studio

echo "installing stremio"
flatpak install flathub com.streamio.Streamio

echo "installing qbit torrent"
flatpak install flathub com.qbittorrent.qBittorrent

echo "installing postman"
flatpak install flathub com.getpostman.Postman

echo "installing boxes"
flatpak install flathub org.gnome.Boxes

echo "installing discord"
flatpak install flathub com.discordapp.Discord

echo "installing telegram"
flatpak install flathub org.telegram.desktop

echo "installing spotify"
flatpak install flathub com.spotify.Client

echo "installing mission center"
flathub install flathub io.missioncenter.Missioncenter

echo "installing arduino IDE"
flatpak install flathub cc.arduino.IDE2

echo "installing nuclear music player"
flatpak install flathub org.js.nuclear.Nuclear

echo "installing sublime text 4"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text


echo "installing and setting up android studio"
sudo pacman -S android-tools android-udev android-sdk android-sdk-build-tools android-sdk-platform-tools android-platform android-emulator
yay -S android-studio

echo "setting up rofi"
mkdir ~/.config/rofi  && rofi -dump-config > ~/.config/rofi/config.rasi

echo "setting up installing and setting up wifi driver for tplink"
sudo pacman -S linux linux-headers
git clone "https://github.com/RinCat/RTL88x2BU-Linux-Driver.git" /usr/src/rtl88x2bu-git
sed -i 's/PACKAGE_VERSION="@PKGVER@"/PACKAGE_VERSION="git"/g' /usr/src/rtl88x2bu-git/dkms.conf
dkms add -m rtl88x2bu -v git
dkms autoinstall


