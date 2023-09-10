#!/bin/bash
triton create  --name=frontend 1054c02a 5b82556d -t triton.cns.services=frontend,haproxy
triton create  --name=backend1 1054c02a 5b82556d -t triton.cns.services=_backend._tcp:3000:priority=10,express,nodejs
triton create  --name=backend2 1054c02a 5b82556d -t triton.cns.services=_backend._tcp:3000:priority=10,express,nodejs



