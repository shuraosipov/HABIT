#!/usr/bin/env python
import daemon
import psutil
import time


def memory_usage_psutils():
    while True:
        memory_available = psutil.virtual_memory().available
        memory_total = psutil.virtual_memory().total
        threshold = memory_total * 30 / 100

        if memory_available <= threshold:
            f = open('/tmp/text.txt', 'a')
            f.write('lalala\n')
            f.close()

        else:
            f = open('/tmp/text.txt', 'a')
            f.write('gogogo\n')
            f.close()

        time.sleep(5)


with daemon.DaemonContext():
    memory_usage_psutils()
