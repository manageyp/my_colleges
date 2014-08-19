# Unicorn daemon service

## Config

# Copy the init script to services directory
sudo cp unicorn_init /etc/init.d/
sudo chmod +x /etc/init.d/unicorn_init

# Make it start at boot time.
sudo update-rc.d -f unicorn_init defaults

# Make rvm wrapper
rvm alias create my_colleges 1.9.3
rvm wrapper 1.9.3 --no-links unicorn_rails

# Make dir
/etc/unicorn/my_colleges.conf

RAILS_ENV=production
RAILS_ROOT=/home/projects/my_colleges
UNICORN="/usr/local/rvm/wrappers/my_colleges/unicorn_rails"

# Start unicorn
/etc/init.d/unicorn_init start my_colleges