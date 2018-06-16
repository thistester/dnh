# !/bin/bash
cd /home/blog/
hexo g
nginx -g 'daemon off;'
