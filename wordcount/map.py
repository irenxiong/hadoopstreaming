#!/usr/bin/env python
#coding=utf-8
import sys
#获取白名单的所有单词
white_words = []
white_list = open('white.list', 'r')
for word in white_list:
    word = word.strip()
    white_words.append(word)
#白名单内的单词不作统计
for line in sys.stdin:
    line = line.strip()
    words = line.split()
    for word in words:
        if word not in white_words:
            print "%s\t%s" % (word, 1)
white_list.close()
