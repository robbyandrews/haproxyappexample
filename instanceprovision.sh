#!/bin/bash
triton create  --name=frontend 433d1deb 5b82556d -t triton.cns.services=frontend,haproxy
triton create  --name=backend1 433d1deb 5b82556d -t triton.cns.services=_backend._tcp:3000:priority=10,express,nodejs
triton create  --name=backend2 433d1deb 5b82556d -t triton.cns.services=_backend._tcp:3000:priority=10,express,nodejs



