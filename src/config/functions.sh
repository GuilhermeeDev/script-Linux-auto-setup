#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2154
source ./config/.env

function install_all_dependencies(){
    echo "Deseja instalar todas as dependências necessárias para rodar o programa? (S/N)"; read op

    op=$(echo "$op" | tr '[:upper:]' '[:lower:]')

    if [ "$op" = "s" ] || [ "$op" = "sim" ]; then
        $pktmanager install curl jq git git-lfs
        echo "Dependencias instaladas!"
    else
        echo -e "O programa rodará de maneira limitada!\nPara ter acesso a todas as funções, instale as dependências do programa."
    fi
}

function install_jq(){
    if ! command jq --version >/dev/null 2>&1; then
        echo "Pacote 'jq' não encontrado, deseja instala-lo?(S/N)"; read op
        
        op=$(echo "$op" | tr '[:upper:]' '[:lower:]')
        if [ "$op" = "s" ] || [ "$op" = "sim" ]; then
            $pktmanager install jq
            echo -e "jq instalado com sucesso!\nFuncionalidade de construir o config.json habilitada!"
        else
            echo -e "jq não sera instalado!\nFunção de construir o config.json desabilitada!"
        fi

    else
        echo -e "jq já está instalado — função de construir o config.json habilitada."
    fi
}

#Construindo o obj config.json, mas somentes após a instalação do "jq"
function construct_json_obj(){
    jq -n \
    --arg user "$user" \
    --arg packageManager "$pktmanager" \
    --arg distro "$distro" \
    --arg id "$id" \
    --arg version "$version" \
    '{"user":$user, "packageManager":$packageManager, "distro":$distro, "distro_id":$id, "version":$version}' > ./config/vars/config.json
}

function construct_dev_json(){
    jq -n \
    '[
  {
    "status": "on",
    "name": "git",
    "version": "[*]"
  },{
    "status": "on",
    "name": "git-lfs",
    "version": "[*]"
  },{
    "status": "on",
    "name": "curl",
    "version": "[*]"
  },{
    "status": "on",
    "name": "cmake",
    "version": "[*]"
  },{
    "status": "on",
    "name": "pkg-config",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gdb",
    "version": "[*]"
  },{
    "status": "on",
    "name": "lldb",
    "version": "[*]"
  },{
    "status": "on",
    "name": "valgrid",
    "version": "[*]"
  },{
    "status": "on",
    "name": "python3",
    "version": "[*]"
  },{
    "status": "on",
    "name": "python3-pip",
    "version": "[*]"
  },{
    "status": "on",
    "name": "python3-env",
    "version": "[*]"
  },{
    "status": "on",
    "name": "jupyter-notebook",
    "version": "[*]"
  },{
    "status": "on",
    "name": "nodejs",
    "version": "[*]"
  },{
    "status": "on",
    "name": "npm",
    "version": "[*]"
  },{
    "status": "on",
    "name": "yarn",
    "version": "[*]"
  },{
    "status": "on",
    "name": "pnpm",
    "version": "[*]"
  },{
    "status": "on",
    "name": "default-jdk",
    "version": "[*]"
  },{
    "status": "on",
    "name": "maven",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gradle",
    "version": "[*]"
  },{
    "status": "on",
    "name": "postgresql",
    "version": "[*]"
  },{
    "status": "on",
    "name": "sqlite3",
    "version": "[*]"
  },{
    "status": "on",
    "name": "mysql-client",
    "version": "[*]"
  },{
    "status": "on",
    "name": "redis",
    "version": "[*]"
  },{
    "status": "on",
    "name": "redis-tools",
    "version": "[*]"
  },{
    "status": "on",
    "name": "docker.io",
    "version": "[*]"
  },{
    "status": "on",
    "name": "docker-compose",
    "version": "[*]"
  },{
    "status": "on",
    "name": "podman",
    "version": "[*]"
  },{
    "status": "on",
    "name": "kubectl",
    "version": "[*]"
  },{
    "status": "on",
    "name": "virtual-box",
    "version": "[*]"
  },{
    "status": "on",
    "name": "qemu-system",
    "version": "[*]"
  },{
    "status": "on",
    "name": "dotnet-sdk-8.0",
    "version": "[*]"
  },{
    "status": "on",
    "name": "golang-go",
    "version": "[*]"
  },{
    "status": "on",
    "name": "rustc",
    "version": "[*]"
  },{
    "status": "on",
    "name": "cargo",
    "version": "[*]"
  },{
    "status": "on",
    "name": "php",
    "version": "[*]"
  },{
    "status": "on",
    "name": "php-cli",
    "version": "[*]"
  },{
    "status": "on",
    "name": "composer",
    "version": "[*]"
  },{
    "status": "on",
    "name": "ruby",
    "version": "[*]"
  },{
    "status": "on",
    "name": "ruby-dev",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gem",
    "version": "[*]"
  },{
    "status": "on",
    "name": "httpie",
    "version": "[*]"
  },{
    "status": "on",
    "name": "nmap",
    "version": "[*]"
  },{
    "status": "on",
    "name": "ansible",
    "version": "[*]"
  },{
    "status": "on",
    "name": "terraform",
    "version": "[*]"
  },{
    "status": "on",
    "name": "awscli",
    "version": "[*]"
  },{
    "status": "on",
    "name": "azure-cli",
    "version": "[*]"
  },{
    "status": "on",
    "name": "google-cloud-cli",
    "version": "[*]"
  },{
    "status": "on",
    "name": "snapd",
    "version": "[*]"
  }]' > ./config/vars/dev.packages.json
}

function construct_basic_json(){
    jq -n \
    '[
  {
    "status": "on",
    "name": "xorg",
    "version": "[*]"
  },{
    "status": "on",
    "name": "curl",
    "version": "[*]"
  },{
    "status": "on",
    "name": "unzip",
    "version": "[*]"
  },{
    "status": "on",
    "name": "zip",
    "version": "[*]"
  },{
    "status": "on",
    "name": "htop",
    "version": "[*]"
  },{
    "status": "on",
    "name": "build-essential",
    "version": "[*]"
  },{
    "status": "on",
    "name": "linux-headers-generic",
    "version": "[*]"
  },{
    "status": "on",
    "name": "wget",
    "version": "[*]"
  },{
    "status": "on",
    "name": "neofetch",
    "version": "[*]"
  },{
    "status": "on",
    "name": "nano",
    "version": "[*]"
  },{
    "status": "on",
    "name": "vim",
    "version": "[*]"
  },{
    "status": "on",
    "name": "ufw",
    "version": "[*]"
  },{
    "status": "on",
    "name": "rar",
    "version": "[*]"
  },{
    "status": "on",
    "name": "unrar",
    "version": "[*]"
  },{
    "status": "on",
    "name": "tar",
    "version": "[*]"
  },{
    "status": "on",
    "name": "firefox",
    "version": "[*]"
  },{
    "status": "on",
    "name": "net-tools",
    "version": "[*]"
  },{
    "status": "on",
    "name": "network-manager",
    "version": "[*]"
  },{
    "status": "on",
    "name": "openssh-client",
    "version": "[*]"
  },{
    "status": "on",
    "name": "vlc",
    "version": "[*]"
  },{
    "status": "on",
    "name": "ffmpeg",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gstramer1.0-plugins-bad",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gstramer1.0-plugins-god",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gstramer1.0-libav",
    "version": "[*]"
  },{
    "status": "on",
    "name": "flatpack",
    "version": "[*]"
  },{
    "status": "on",
    "name": "libreoffice",
    "version": "[*]"
  },{
    "status": "on",
    "name": "okular",
    "version": "[*]"
  },{
    "status": "on",
    "name": "evince",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gimp",
    "version": "[*]"
  },{
    "status": "on",
    "name": "steam",
    "version": "[*]"
  },{
    "status": "on",
    "name": "mesa-vulkan-drivers",
    "version": "[*]"
  },{
    "status": "on",
    "name": "clamav",
    "version": "[*]"
  },{
    "status": "on",
    "name": "gnupg",
    "version": "[*]"
  },{
    "status": "on",
    "name": "lsd",
    "version": "[*]"
  },{
    "status": "on",
    "name": "fzf",
    "version": "[*]"
  },{
    "status": "on",
    "name": "tldr",
    "version": "[*]"
  }]' > ./config/vars/basic.packages.json
}

function install_basicPackages(){
    echo -e "Os pacotes baixados serão:\n\
    1. xorg\n\
    2. curl\n\
    3. unzip\n\
    4. zip\n\
    5. htop\n\
    6. build-essential\n\
    7. linux-headers-generic\n\
    8. wget\n\
    9. neofetch\n\
    10. nano\n\
    11. vim\n\
    12. ufw\n\
    13. rar\n\
    14. unrar\n\
    15. tar\n\
    16. firefox\n\
    17. net-tools\n\
    18. network-manager\n\
    19. openssh-client\n\
    20. vlc\n\
    21. ffmpeg\n\
    22. gstramer1.0-plugins-bad\n\
    23. gstramer1.0-plugins-god\n\
    24. gstramer1.0-libav\n\
    25. flatpack\n\
    26. libreoffice\n\
    27. okular\n\
    28. evince\n\
    29. gimp\n\
    30. steam\n\
    31. mesa-vulkan-drivers\n\
    32. clamav\n\
    33. gnupg\n\
    34. lsd\n\
    35. fzf\n\
    36. tldr"
}

function install_devPackages(){
    echo -e "Os pacotes baixados serão:\n\
    1. git\n\
    2. git-lfs\n\
    3. curl\n\
    4. cmake\n\
    5. pkg-config\n\
    6. gdb\n\
    7. lldb\n\
    8. valgrid\n\
    9. python3\n\
    10. python3-pip\n\
    11. python3-env\n\
    12. jupyter-notebook\n\
    13. nodejs\n\
    14. npm\n\
    15. yarn\n\
    16. pnpm\n\
    17. default-jdk\n\
    18. maven\n\
    19. gradle\n\
    20. postgresql\n\
    21. sqlite3\n\
    22. mysql-client\n\
    23. redis\n\
    24. redis-tools\n\
    25. docker.io\n\
    26. docker-compose\n\
    27. podman\n\
    28. kubectl\n\
    29. virtual-box\n\
    30. qemu-system\n\
    31. dotnet-sdk-8.0\n\
    32. golang-go\n\
    33. rustc\n\
    34. cargo\n\
    35. php\n\
    36. php-cli\n\
    37. composer\n\
    38. ruby\n\
    39. ruby-dev\n\
    40. gem\n\
    41. httpie\n\
    42. nmap\n\
    43. ansible\n\
    44. terraform\n\
    45. awscli\n\
    46. azure-cli\n\
    47. google-cloud-cli\n\
    48. snapd"
}

function install_packages_lfs(){
    echo ""
}

function safe_delete() {
    [[ -z "$1" ]] && { echo "ERRO: Caminho vazio para delete"; return 1; }
    [[ "$1" == "/" ]] && { echo "ERRO: PERIGO: não vou deletar /"; return 1; }
    rm -rf "$1" >/dev/null 2>&1
}