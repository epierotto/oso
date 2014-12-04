oso
===

Open Source Operations Testing Repo


First steps
===========

1- Clone the repository
  ```bash
  git clone https://github.com/epierotto/oso.git
  ```
2- Get in and launch server1
  ```bash
  cd oso

  vagrant up server1
  ```
3- The chef server will be installed, so now its time to set the new admin password.

  Go to your web-browser login with the default password and change it.

  [https://10.0.0.50/](https://10.0.0.50/)

  The default login credentials are as follows:
  ```
  Default Username: admin
  Default Password: p@ssw0rd1
  ```

4- Copy the chef server keys to your local repo to set up your knife config.
  ```bash
  vagrant ssh -c "sudo cp /etc/chef-server/*.pem /vagrant/.chef/"
  ```
5- Lets configure the knife.rb
  ```
  knife configure -i
  ```
  This will ask you a series of questions. We will go through them one by one:
  The values in the brackets ([]) are the default values that knife will use if we do not select a value.  

  We want to place our knife configuration file in the hidden directory .chef:
  ```
  WARNING: No knife configuration file found
  Where should I put the config file? [/home/your_user/.chef/knife.rb] .chef/knife.rb
  ```
  In the next question, type in the domain name or IP address you use to access the Chef server. This should begin with `https://` and end with `:443`:
  ```
  Please enter the chef server URL: [https://chef-server:443] https://10.0.0.50:443
  ```  

  You will be asked for a name for the new user you will be creating.
  ```
  Please enter a name for the new user: [root] your_username
  ```

  Just hit enter to accept the default value (we didn't change the admin name).
  ```
  Please enter the existing admin name: [admin] 
  ```
  
  It will then ask you for the location of the existing administrators key. This should be:
  ``` 
  Please enter the location of the existing admin's private key: [/etc/chef-server/admin.pem] .chef/admin.pem
  ```

  We won't change the validator's name either, so we can keep that as chef-validator. Press enter to accept this value.  
  ```
  Please enter the validation clientname: [chef-validator] 
  ```

  Enter the location of the chef-validator's key.
  ```
  Please enter the location of the validation key: [/etc/chef-server/chef-validator.pem] .chef/chef-validator.pem
  ```

  Leave it blank, and enter.
  ```
  Please enter the path to a chef repository (or leave blank): 
  Creating initial API user...
  ```

  Set your password and press enter.
  ```
  Please enter a password for the new user: your_password
  ```

  ```
  Created user[your_username]
  Configuration file written to .chef/knife.rb
  ```
