nixDir="$HOME/dotfiles/nixos"
logfile="$nixDir/nixos-switch.log"
function rebuild() {
    _prepare
    _finalize
}

function editconfig() {
    _prepare
    nvim "hosts/default/configuration.nix"
    _finalize
}

function _prepare() {
    set -e
    pushd $nixDir

}

function _finalize() {
    git diff -U0 ./**/*.nix

    echo "NixOS Rebuilding..."
    git add ./**/*
    sudo nixos-rebuild switch --flake "$nixDir/#default" >&$logfile || (
        cat $logfile | grep --color error && false)

    echo "Commiting changes..."

    generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
    date=$(date '+%d.%m.%Y - %H:%M:%S')

    echo "Commit: \"Gen: $generation - $date\""
    git commit -am "Gen: $generation - $date"
    popd
}
