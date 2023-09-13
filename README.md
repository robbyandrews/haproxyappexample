# HAProxy and CNS: A Story Of Automation

This repository is an example of using HAProxy together with Triton CNS to add backend servers to the pool using SRV records generated by Triton CNS, the `server-template` directive and a simple Node.js Express application as the backend. This example can be used with or without the Ansible playbook included.

Included in this repository are commands to provision three instances, one for the HAproxy frontend, and two for the Node.js Express backend.  The commands include the syntax for tagging the frontend instance with a tag of `frontend` and the backend Node.js instances have the service tags of `_backend._tcp:3000` to generate an SRV record that will advertise the DNS name and resulting IP address of the backend instances as well as the port (3000) that the express app will serve.

The HAproxy configuration example includes a template for 3 backend servers so that after building the initial two, you can provision a third with the same tags and it will automatically be added to the available backend servers.

## Supported Environments

The scripts and commands in this repository were developed using macOS and Linux using the bash shell, Node.js, and Ansible with Python 3 and should work without modification in those environments. Windows may work with something such as Git Bash and/or Windows Subsystem for Linux but they have not been tested. When I have access to a Windows system I will update this.

## Triton CNS

Triton CNS provides DNS resolution for instances provisioned in a Triton DataCenter installation. For more information please go to the [Github Page](https://github.com/TritonDataCenter/triton-cns) or [Triton Docs Container Name Service](https://docs.tritondatacenter.com/public-cloud/network/cns)

## HAProxy

HAProxy is a free, very fast and reliable reverse-proxy offering high availability, load balancing, and proxying for TCP and HTTP-based applications. It is particularly suited for very high traffic web sites and powers a significant portion of the world's most visited ones. For more information please visit their [Github Page](https://github.com/haproxy/haproxy) or checkout their [website.](https://github.com/haproxy/haproxy)