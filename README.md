oso
===

Open Source Operations Testing Repo


First steps
===========

1- Clone the repository
  ```
  git clone https://github.com/epierotto/oso.git
  ```
2- Get in and launch server1
  ```
  cd oso

  vagrant up server1
  ```
3- The chef server will be installed, so now its time to set the new admin password.

  Login in your broser and change the admin password

  [https://10.0.0.50/](https://10.0.0.50/)

4- Copy the chef server keys to you local repo to set up your knife config.
  
  vagrant ssh -c "sudo cp /etc/chef-server/*.pem /vagrant/.chef/"

5- Lets configure the knife.rb

  knife configure -i
