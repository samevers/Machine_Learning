#!/bin/bash
kill -9 `ps axu|grep feagen|grep -v grep|awk '{print $2}'`
