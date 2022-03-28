# Ansible_repo
#If you get error after installing kubernetes cluster.
#suppose you check all nodes status through this command "kubectl get nodes". and you get error like this:
$ kubectl get nodes
The connection to the server localhost:8080 was refused - did you specify the right host or port?
#Then you run this three command your master nodes.
first: "$ sudo mkdir -p $HOME/.kube"
second: "$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config"
third: "$ sudo chown $(id -u):$(id -g) $HOME/.kube/config"
--------------------------------------------------------------------
