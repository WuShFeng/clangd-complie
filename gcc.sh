apt-get install -y --fix-missing libgmp-dev libmpfr-dev libmpc-dev libisl-dev texinfo bison flex gawk m4 build-essential
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt update
git clone https://github.com/riscv/riscv-gnu-toolchain --depth 1
./configure --prefix=/opt/riscv --enable-multilib

git clone https://gcc.gnu.org/git/gcc.git --branch releases/gcc-15.2.0  --depth 1
./configure --prefix=/usr/local/gcc-15 \
            --enable-multilib \
            --enable-languages=c,c++

make -j$(nproc)