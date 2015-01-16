default['gitlab']['package']['url'] = "https://downloads-packages.s3.amazonaws.com/centos-6.6/gitlab-7.6.2_omnibus.5.3.0.ci.1-1.el6.x86_64.rpm"
default['gitlab']['package']['sha256'] = "42e8224f8aa8689ba80380d036a3b367ffb63a85b5e447670a5233d888b85924"

default['gitlab']['data_bag'] = nil

default['gitlab']['ssl']['certificate'] = nil
default['gitlab']['ssl']['private_key'] = nil

default['gitlab']['gitlab_rb']['nginx']['ssl_certificate'] = "/etc/gitlab/ssl/nginx.crt"
default['gitlab']['gitlab_rb']['nginx']['ssl_certificate_key'] = "/etc/gitlab/ssl/nginx.key"
default['gitlab']['gitlab_rb']['ci-nginx']['ssl_certificate'] = "/etc/gitlab/ssl/ci-nginx.crt"
default['gitlab']['gitlab_rb']['ci-nginx']['ssl_certificate_key'] = "/etc/gitlab/ssl/ci-nginx.key"

default['gitlab']['munin_sidekiq_postreceive']['window_size'] = 100

