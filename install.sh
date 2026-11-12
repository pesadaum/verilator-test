sudo apt-get install git help2man perl python3 make -y 
sudo apt-get install g++  -y # Alternatively, clang
sudo apt-get install libgz  -y # Non-Ubuntu (ignore if gives error)
sudo apt-get install libfl2  -y # Ubuntu only (ignore if gives error)
sudo apt-get install libfl-dev  -y # Ubuntu only (ignore if gives error)
sudo apt-get install zlibc zlib1g zlib1g-dev liblz4 liblz4-dev  -y # Ubuntu only (ignore if gives error)

sudo apt-get install libsystemc libsystemc-dev
sudo apt-get install z3  # Optional solver
sudo apt-get install perl-doc

sudo apt-get install ccache  # If present at build, needed for run
sudo apt-get install mold  # If present at build, needed for run
sudo apt-get install libjemalloc-dev numactl

sudo apt-get install git autoconf flex bison

sudo apt-get install gtkwave  # Optional Waveform viewer


git clone https://github.com/verilator/verilator   # Only first time

cd verilator
git pull        # Make sure we're up-to-date
git checkout stable

autoconf         # Create ./configure script
./configure      # Configure and create Makefile
make -j `nproc`  # Build Verilator itself (if error, try just 'make')
sudo make install