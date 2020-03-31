FROM codercom/code-server:latest

# extensions to code-server 
RUN code-server --install-extension ms-python.python && \
    code-server --install-extension njpwerner.autodocstring && \
    code-server --install-extension coenraads.bracket-pair-colorizer-2 && \
    code-server --install-extension equinusocio.vsc-material-theme && \
    code-server --install-extension euskadi31.json-pretty-printer

# ubuntu installations (e.g. Python)
RUN sudo -E apt-get update && sudo -E apt-get install -y \
    python3.8 \
    python3-pip \
 && sudo rm -rf /var/lib/apt/lists/*

# python requirements
# COPY requirements.txt /home/coder/
# RUN python3.7 -m pip install --no-cache-dir -r ~/requirements.txt

# configure git
RUN git config --global user.name "Austin Engle" && \
    git config --global user.email "aengl29@wgu.edu"

CMD ["code-server", "--allow-http", "--no-auth"]