vamos seguir o seguinte padrao:

wget <url> > init.sh

init.sh
  - clona o dotfiles, setá as variables globais e roda o install.sh

install.sh
  - faz o install/setting de todos os programas que estiverem na pasta install
    

dotfiles/
├── install/
├── dots/ 
├── utils/
├── init.sh
└── README.md
