echo setting up development envoirment
echo Installing NeoVim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get install neovim -y
sudo sudo apt-get update

echo Instalando EXUBERANT CTAGS
sudo apt-get install exuberant-ctags -y

echo Installing UNZIP
sudo apt install unzip

echo Installing GOLANG
sudo apt install golang -y

echo Installing Vine Seek
git clone https://github.com/daltonypng/vine-finder
go build ./vine-finder/vine.go
sudo mv ./vine-finder/vine /usr/bin

echo Installing Ripgrep
sudo apt-get install ripgrep

echo Installing gcc compilator
sudo apt-get install gcc 

#ToDo: set condition to install winyank only when -w parameter is passed.
echo Installing yank program for wsl.
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
