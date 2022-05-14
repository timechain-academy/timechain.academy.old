<AUTOMATION>
<p>

## [![Awesome](https://awesome.re/badge.svg)](https://github.com/RandyMcMillan/randymcmillan/blob/master/sources/awesome.md) [![legit](https://github.com/RandyMcMillan/legit/actions/workflows/automate.yml/badge.svg)](https://github.com/RandyMcMillan/legit/actions/workflows/automate.yml) [![statoshi](https://github.com/bitcoincore-dev/statoshi/actions/workflows/statoshi.yml/badge.svg)](https://github.com/bitcoincore-dev/statoshi/actions/workflows/statoshi.yml)         

<CENTER></CENTER>

</p>
</AUTOMATION>

<details>
<summary>legit - git commit custom hash</summary>

```shell
git clone https://github.com/RandyMcMillan/legit.git ~/legit && \
cd ~/legit && ./make-legit.sh
```
</p>
</details>
<details>
<summary>statoshi.host - dockerized bitcoin node statistics</summary>

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew install docker docker-compose make && \
git clone https://github.com/bitcoincore-dev/statoshi.host.git ~/statoshi.host && \
cd ~/statoshi.host && make init run user=root port=80
```
</p>
</details>
<details>
<summary>docker.shell - wrap your $HOME in an alpine shell</summary>

```shell
git clone https://github.com/RandyMcMillan/docker.shell.git ~/docker.shell && \
cd docker.shell && \
make shell user=root
```
</p>
</details>
