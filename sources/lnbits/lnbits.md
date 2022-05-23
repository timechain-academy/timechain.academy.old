# LNBits Beginner Workshop

*Proposed workshop syllabus for timechain.academy*

### Target Audience:
Plebs New to lightning and interested in running their own website or store that could accept lightning as tips, online payments or an application that either sends or receives lightning sats. Good for small online businesses, podcasts, blogs, and game developers.

### Prerequisites:

No formal Lightning experience required, however a basic understanding of sending and receiving using Lightning wallets and a wallet with testnet sats required. Some basic understanding of programming in python helpful.

### Estimated time for a session - ( ~2-3 hrs )

Time for workshop assumes students already have an plebnet instance up. This workshop is partly lecture but also a lot of hands on with running and moving sats around on a LNBits instance, students should be prepared to send/receive lightning using testnet sats.

### What this workshop will cover:

- What is LNBits and what does it do?
    - LNBits is a Free and Open source lightning accounting system. Easy to set up and lightweight, LNbits can run on any lightning-network funding source, currently supporting LND, c-lightning, OpenNode, lntxbot, LNPay and even LNbits itself! You can run LNbits for yourself, or easily offer a custodian solution for others.
- Setting up LNBits on plebnet
    - Ideally workshop participants already have plebnet docker setup
    - If not, they can use a public instance of lnbits to follow along but its live, not testnet
- LNBits makes uses of Bolt11(Invoice protocol for lightning payments)
- Review of Bolt 11 Specification before diving in
  - https://github.com/lightning/bolts/blob/master/00-introduction.md
- Create a new user, core wallet functions
  - Walk through of LNBits features:
     - Each wallet has its own API keys and there is no limit to the number of wallets you can make. Being able to partition funds makes LNbits a useful tool for money management and as a development tool.
  - Brief overview of Extensions
  - Sending and receiving Lightning payments on LNBits
  - Limitations of the LNBits System
- Some Key Extensions and how they work: (with hands on exercises)
  - User Manager
  - LNURLp
  - LNURLw
  - LndHub (LND only)
- Some simple Application Extensions: (with hands on exercises)
   - TipJar
   - Paywall
- Lightning Addresses
   - What are they?
   - How do they work?
   - How can you use Lightning Addresses with LNBits
        - with Any website
        - with an extension
- Getting started with Building Applications on LNBits
    - The LNBits API
    - The pylnbits API library (with hands on exercises)
    - Some configuration options for LNBits (with hands on exercises)
- Where to go Next
    - LNBits in production
    - Where to get help
- Q & A session

> **Note**: Other workshop ideas:
> - advanced workshop for building sample production ready applications on LNBits
> - workshop on LNURL/webLN applications, e.g. lnurl-auth, lightning addresses, webln.dev


### About the Instructor:

@bitkarrot on github and twitter; shadowy super coder contributing to bitcoin and lightning.
