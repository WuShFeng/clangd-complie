curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
mv $HOME/.nvm/ /usr/local/share/nvm
chmod -R 777 /usr/local/share/nvm
NVM_CONFIG='
export NVM_DIR="/usr/local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
'
echo "$NVM_CONFIG" | tee -a /etc/profile > /dev/null

