#!/usr/bin/env python
from livereload import Server, shell
server = Server()
server.watch('src', shell('make clean test 2>&1', cwd='.', shell=True))
server.serve(root='staging', port=8888)
