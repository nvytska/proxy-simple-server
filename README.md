# Assignment 3: Proxy Simple Server
Student: Nataliia Vytska  

Group: CS420 Group 2

---

**How to use script?**

The best approach is:

0. Clone repo: ```git clone https://github.com/nvytska/proxy-simple-server.git```
1. Create new clean VM: ```multipass launch --name proxy-simple-server```.
2. Mount: ```multipass mount ./proxy-simple-server proxy-simple-server:/home/ubuntu/proxy-simple-server```.
3. ```multipass shell proxy-simple-server```
4. Go to directory: ```cd proxy-simple-server```.
5. Run the script: ```chmod +x configureSystem.sh```; ```sudo ./configureSystem.sh```.
6. Check Proxy: ```sudo systemctl status proxyServer```
7. Check ```curl http://localhost```.
8. To check it in browser: check ```hostname -I```, and copy <VM_IP>, then http://<VM_IP>.
   
