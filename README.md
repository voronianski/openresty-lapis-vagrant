# openresty-lapis-vagrant

Template for starting development with [Lapis](http://leafo.net/lapis) and [OpenResty](http://openresty.org) on [Vagrant](http://www.vagrantup.com/)'s virtual machine.

## Usage

1. Clone this repo ``git clone git@github.com:voronianski/openresty-lapis-vagrant.git``
2. Run ``vagrant init`` inside. This will setup a virtualbox with Ubuntu 12.04. You can change box to whatever you like but I recommend default one or 13.04 if you would like to deploy your code with [dokku](https://github.com/progrium/dokku).
3. Connect to your virtual machine with ``vagrant ssh`` and go to folder ``cd /vagrant``. Everything should be setted up for you.
4. Start developing! Compile ``.moon`` files into ``.lua`` manually with ``moonc ./ -w`` ([https://github.com/leafo/lapis/issues/118](https://github.com/leafo/lapis/issues/118))
5. Run your server ``lapis server``.
6. Check browser on your host machine ``localhost:5678``.

## What's inside?

- [OpenResty](http://openresty.org/#Installation)
- [Lua 5.1](http://www.lua.org/about.html)
- [Luarocks](http://luarocks.org)
- [Lapis](http://leafo.net/lapis/reference.html)
- [MoonScript](http://moonscript.org)

===

MIT Licensed
