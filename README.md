## [🐝](https://keys.openpgp.org/vks/v1/by-fingerprint/E616FA7221A1613E5B99206297966C06BB06757B) [TimeChain.Academy ](http://github.com/timechain-academy)<AUTOMATION>
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

<details>
<summary>👀</summary>
<p>

```shell
seq 0 947 | (while read -r n; do bitcoin-cli gettxout \
54e48e5f5c656b26c3bca14a8c95aa583d07ebe84dde3b7dd4a78f4e4186e713 $n \
| jq -r '.scriptPubKey.asm' | awk '{ print $2 $3 $4 }'; done) | \
tr -d '\n' | cut -c 17-368600 | xxd -r -p > bitcoin.pdf
```

</p>
</details>

<details>
<summary>👀</summary>
<p>

#### Referal Links:

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.digitaloceanspaces.com/WWW/Badge%202.svg)](https://www.digitalocean.com/?refcode=ae5c7d05da91&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)

</p>
</details>