FROM alpine
MAINTAINER mendelvantriet

RUN apk update
RUN apk add --update openssh

# set up ssh
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN sed -i "s/.*StrictHostKeyChecking.*/StrictHostKeyChecking no/g" /etc/ssh/ssh_config

# set up passwordless ssh between containers
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ''
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22

