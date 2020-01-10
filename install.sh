#!/bin/bash

echo "Instalando dependencias..."

sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo "Creando bash_profile aliases para el recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"



#Instalando go
if [[ -z "$GOPATH" ]];then
echo "Go no esta instalado... Desea instalarlo?"
PS3="Seleccione una opcion: "
choices=("Yes" "No")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Instalando Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Por favor instale Go y corra nuevamente el Script"
					echo "Abortando instalacion..."
					exit 1
					;;
	esac	
done
fi


#No olvide setear sus credenciales de Amazon AWS!
echo "No olvide setear sus credenciales de Amazon AWS!"
apt install -y awscli
echo "No olvide setear sus credenciales de Amazon AWS!"



#Creando una carpeta de recon en ~/recon
echo "Creando carpeta recon..."
mkdir ~/recon

#Creando una carpeta de tools en ~/tools
echo "Creando carpeta tools..."
mkdir ~/tools
cd ~/tools/

#Instalando Hakrawler
echo "Instalando Aquatone..."
go get github.com/hakluke/hakrawler
echo "Listo!"

#Instalando aquatone
echo "Instalando Hakrawler..."
go get github.com/michenriksen/aquatone
echo "Listo!"

#Instalando chromium
echo "Instalando Chromium..."
sudo snap install chromium
echo "Listo!"

echo "Instalando JSParser..."
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "Listo!"

echo "Instalando Sublist3r..."
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "Listo!"


echo "Instalando teh_s3_bucketeers..."
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "Listo!"


echo "Instalando WpScan..."
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "Listo!"

echo "Instalando dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "Listo!"


echo "Instalando lazys3..."
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "Listo!"

echo "Instalando virtual host discovery..."
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "Listo!"


echo "Instalando sqlmap..."
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
cd ~/tools/
echo "Listo!"

echo "Instalando knock.py..."
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "Listo!"

echo "Instalando lazyrecon..."
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "Listo!"

echo "Instalando nmap..."
sudo apt-get install -y nmap
echo "Listo!"

echo "Instalando massdns..."
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "Listo!"

echo "Instalando asnlookup..."
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "Listo!"

echo "Instalando httprobe..."
go get -u github.com/tomnomnom/httprobe 
echo "Listo!"

echo "Instalando unfurl..."
go get -u github.com/tomnomnom/unfurl 
echo "Listo!"

echo "Instalando waybackurls..."
go get github.com/tomnomnom/waybackurls
echo "Listo!"

echo "Instalando crtndstry..."
git clone https://github.com/nahamsec/crtndstry.git
echo "Listo!"

echo "Descargando Seclists..."
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "Listo!"


echo -e "\n\n\n\n\n\n\n\n\n\n\n Carpeta para Recon creada en: ~/recon"
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! Todas las herramientas instaladas en: ~/tools"
ls -la
echo "Una vez mas: No olvide setear sus credenciales de AWS en ~/.aws/!"
