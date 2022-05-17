#!/usr/bin/env python3

import os
import sys
#sys.path.insert(0, os.path.abspath('/usr/local/lib/python3.9/site-packages'))
import time
import blockcypher
millis = int(round(time.time() * 1000))
seconds = int(round(time.time()))

try:
    block_time = blockcypher.get_latest_block_height(coin_symbol='btc')
    block_height = repr(block_time)
    f = open("BLOCK_TIME", "w")
    f.write("" + block_height + "\n")
    f.close()
    #print(block_time)
    print(block_height)
except:
    block_time = 0
    pass
