# -*- coding: utf-8 -*-

import json
import requests
import re

def geneHelp(config, resConfig):
    print 'genelate note....'
    f = open(config)
    res = open(resConfig, 'w')
    i = 1
    try:
        allLines = f.readlines()
        for line in allLines:
            line = '%s:%s\n' % (i, line.replace('#', '//'))
            pattern = re.compile('CONFIG_[\w_]+')
            match = pattern.search(line)
            if match:
                keyWord = match.group()
                res.write(line.replace(keyWord, '[%s](http://cateee.net/lkddb/web-lkddb/%s.html)' % (keyWord, keyWord[len('CONFIG_'):]) ))
            else:
                res.write(line)
            i += 1
    finally:
        f.close()
        res.close()


if __name__=='__main__':
    geneHelp('a.config', 'help.md')
