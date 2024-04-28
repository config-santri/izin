#!/bin/bash
clear
#===============================================
             # VARIABLE PENTING #
#===============================================
export USERNAME="vpnvip"
export REPO="izin"
export EMAIL="scvipvpn@gmail.com"
PASSWORD="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"
export BRANCH="main"
export FILE="registrasi.txt"
export REPO_SET="https://raw.githubusercontent.com/petapaan/labang/main"
export BG="\e[1;97;101m"
export RED='\e[0;31m'
export CYAN='\033[1;36m'
export GREEN='\e[1;32m'
export NC='\e[0m'
clear
#===============================================
                 # functions #
#===============================================
clonerepo() {
    echo -e "${GREEN}Sedang proses...${NC}"
    sleep 2
    git clone https://github.com/$USERNAME/$REPO.git > /dev/null 2>&1
    mv $REPO .$REPO
}
#===============================================
delclone() {
    cd
#    cd key
    rm -rf .$REPO
    rm -rf .gitconfig
    }
#===============================================
update() {
    git add $FILE
    git config --global user.email "$EMAIL"
    git config --global user.name "$USERNAME"
    git commit -m "izinip" > /dev/null 2>&1
    echo -e "$REPO" | git push https://$REPO:$PASSWORD@github.com/$USERNAME/$REPO.git > /dev/null 2>&1
    cd
 #   cd key
    rm -rf .$REPO
}
#===============================================
get_key() {
while true; do
    read -rp " Masukkan key kamu: " inputan
    REPOKEY="https://raw.githubusercontent.com/$USERNAME/key/main"
    key1=$(wget -qO- $REPOKEY/key_berkali2 | grep "$inputan" | awk '{print $2}')
    key2=$(wget -qO- $REPOKEY/key_sekali | grep "$inputan" | awk '{print $2}')
    tgl1=$(wget -qO- $REPOKEY/key_berkali2 | grep "$inputan" | awk '{print $3}')
    tgl2=$(wget -qO- $REPOKEY/key_sekali | grep "$inputan" | awk '{print $3}')
    if [[ "${inputan}" == "${key1}" ]]; then
        tgl="$tgl1"
        break
    elif [[ "${inputan}" == "${key2}" ]]; then
        tgl="$tgl2"
        break
    else
        echo -e " ${RED}Key yang anda masukkan salah!${NC}"
    fi
done
}
#===============================================
dilarang() {
    # warna
    tebal='\033[1;1m'
    merah='\033[1;31m'
    hijau='\033[1;32m'
    kuning='\033[1;33m'
    biru='\033[1;34m'
    mgnt='\033[1;35m'
    CYAN='\033[1;36m'
    NC='\e[0m'
    BG='\e[41m'
    lebar=40
    myip=$(wget -qO- ipv4.icanhazip.com)
    penyamaan() {
        lebar_judul=${#judul}
        peluasan=$(( (lebar - lebar_judul) /2 -1 ))
        padding=""
        for ((i=0; i<peluasan; i++)); do
            padding+=" "
        done
    }
    cetak_judul() {
        printf "${CYAN}%s${NC}${BG}%s${tebal}%s%s${NC}${CYAN}%s%s\n" "║" "$padding" "$judul" "$padding" "║"
    }
    cetak() {
    lebarjudul=${#judul}
    if (( lebarjudul % 2 == 1 )); then
        printf "${CYAN}%s${warna}%s%s%s${NC}${CYAN}%s%s\n" "║" "$padding" "$judul" "$padding" " " "║"
    else
        printf "${CYAN}%s${warna}%s%s%s${NC}${CYAN}%s%s\n" "║" "$padding" "$judul" "$padding" "║"
    fi
    }
    judul1() {
        warna="${tebal}${merah}"
        judul="PERIZINAN DILARANG"
        penyamaan
    }
    judul2() {
        warna="${NC}"
        judul="IP KAMU : $myip"
        penyamaan
    }
    judul3() {
        warna="${merah}"
        judul="Tidak mendapatkan izin"
        penyamaan
    }
    judul4() {
        warna="${NC}"
        judul="Silahkan hubungi Admin"
        penyamaan
    }
    judul5() {
        warna="${NC}"
        judul="Telegram : @alawivpn"
        penyamaan
    }
    echo -e "$CYAN╔══════════════════════════════════════╗${NC}"
    judul1
    cetak_judul
    echo -e "$CYAN╚══════════════════════════════════════╝${NC}"
    echo -e "$CYAN╔══════════════════════════════════════╗${NC}"
    judul2
    cetak
    judul3
    cetak
    judul4
    cetak
    judul5
    cetak
    echo -e "$CYAN╚══════════════════════════════════════╝${NC}"
}
#===============================================
add_ip() {
    current_date=$(date +"%Y-%m-%d")
    user=$(cat /usr/bin/user)
    #user=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 9 | head -n 1)
    ip=$(wget -qO- ipv4.icanhazip.com)
    tanggal=$(date -d "$current_date +${tgl} days" +"%Y-%m-%d")
    echo -e "### ${user} ${tanggal} ${ip}" >> $FILE
}
#===============================================
del_key() {
    REPO="key"
    FILE="key_sekali"
    git clone https://github.com/$USERNAME/$REPO.git > /dev/null 2>&1
    mv $REPO .$REPO
    cd .$REPO
    sed -i "/$inputan/d" $FILE
    update
    delclone
}
notiftelegram() {
tanggal_sekarang=$(date +%Y-%m-%d)
tanggal=$(date -d "$tanggal_sekarang +30 days" +%Y-%m-%d)
ip=$(wget -qO- ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
export CHATID="6331389328"
export KEY="7097156228:AAF4Qav6b_8ag9iaKwhdIF1E9tOpSDiQUzI"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
export user="${user}"
export tanggal="${tanggal}"
export ip="${ip}"
export domain="${domain}"
python3 - <<END
import os
import requests
# Mendapatkan nilai variabel bash menggunakan os.getenv()
CHATID = os.getenv('CHATID')
KEY = os.getenv('KEY')
TIME = os.getenv('TIME')
URL = os.getenv('URL')
user = os.getenv('user')
tanggal = os.getenv('tanggal')
ip = os.getenv('ip')
domain = os.getenv('domain')
# Fungsi untuk mengirim pesan ke bot Telegram
def kirim_pesan(pesan):
    TOKEN = KEY  # Ganti dengan token API bot Telegram Anda
    chat_id = CHATID  # Ganti dengan ID obrolan atau username penerima pesan

    url = f'https://api.telegram.org/bot{TOKEN}/sendMessage'
    params = {
        'chat_id': chat_id,
        'text': pesan,
        'parse_mode': 'HTML'  # Menggunakan HTML untuk formatting teks
}

    response = requests.post(url, params=params)
    return response.json()
#proses kirim teks/pesan ken bot
pesan = f"""
━━━━━━━━━━━━━━━━━━━━━
<b>PERPANJANGAN IZIN SCRIPT PREM</b>
━━━━━━━━━━━━━━━━━━━━━
<code>USERNANE   :</code> <code>{user}</code>
<code>IP VPS     :</code> <code>{ip}</code>
<code>DOMAIN     :</code> <code>{domain}</code>
<code>EXP SCRIPT :</code> <code>{tanggal}</code>
━━━━━━━━━━━━━━━━━━━━━
"""
kirim_pesan(pesan)
END
}
#===============================================
             # MEMULAI PROSESNYA #
#===============================================
dilarang
get_key
clonerepo
cd .$REPO
add_ip
update
notiftelegram
delclone
del_key
