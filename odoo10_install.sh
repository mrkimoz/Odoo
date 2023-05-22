#!/bin/bash
################################################################################
sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get install -y python-dateutil python-docutils python-feedparser python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi poppler-utils python-pip python-pypdf python-passlib python-decorator gcc python-dev mc bzr python-setuptools python-markupsafe python-reportlab-accel python-zsi python-yaml python-argparse python-openssl python-egenix-mxdatetime python-usb python-serial lptools make python-pydot python-psutil python-paramiko poppler-utils python-pdftools antiword python-requests python-xlsxwriter python-suds python-psycogreen python-ofxparse python-gevent

sudo apt-get install -y npm
sudo npm install -g less less-plugin-clean-css

sudo apt-install postgresql

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt-get update
sudo apt -y install postgresql-12 postgresql-client-12


sudo su - postgres -c "createuser -s odoo" 2> /dev/null || true
sudo su - postgres -c "createuser -s root" 2> /dev/null || true

sudo adduser --system --home=/opt/odoo --group odoo

cd /opt/odoo/

sudo wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz
sudo tar zxvf gdata-2.0.18.tar.gz
sudo chown -R odoo: gdata-2.0.18
cd gdata-2.0.18/
python setup.py install
su - odoo -s /bin/bash
cd
wget https://github.com/odoo/odoo/archive/10.0.zip
unzip 10.0.zip
exit


sudo chown -R odoo: odoo-10.0
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo
sudo cp /opt/odoo/odoo-10.0/debian/odoo.conf /etc/odoo.conf
sudo chown odoo: /etc/odoo.conf
nano /etc/odoo.conf


[options]
; This is the password that allows database operations:
; admin_passwd = PASSWORD
db_host = False
db_port = False
db_user = odoo
db_password = False
addons_path = /opt/odoo/odoo-10.0/addons
;Log Settings
logfile = /var/log/odoo/odoo.log
log_level = error

#######

cd /opt/odoo/odoo-10.0/
pip install pyPdf









