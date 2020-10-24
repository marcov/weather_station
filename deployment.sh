#!/bin/sh
# Create a set of symbolic links...

repoRoot=/home/pi/weather-station
wviewVar=/var/lib/wview

#TODO dont run it twice!...
exit 0

sudo chown -R pi ${wviewVar}/img

cd /var/lib/wview/img
ln -s ${repoRoot}/wview/html/fiobbio/index.html index.html
ln -s ${repoRoot}/wview/html/fiobbio/html html
ln -s ${repoRoot}/wview/html/fiobbio/css css
ln -s ${repoRoot}/wview/html/fiobbio/js js

cd /etc/
ln -s ${repoRoot}/wview/etc_wview wview

cd /etc/wview/html
ln -s ${repoRoot}/wview/html/fiobbio/html/currweather.htx currweather.htx
ln -s ${repoRoot}/wview/html/fiobbio/html/index.htx index.htx

# Note: moved wview-conf.sdb in ${wviewVar}/conf ! So it needs to be
# linked back to /etc/wview
cd /etc/wview
ln -s ${wviewVar}/conf/wview-conf.sdb wview-conf.sdb

# Install crontab
crontab -u root ${repoRoot}/crontabs/crontab-root
crontab -u pi ${repoRoot}/crontabs/crontab-pi
# See crontab
crontab -u root -l

cd /etc/cron.daily
cp ${repoRoot}/webcam/cron/daily webcam
chmod +x webcam

sudo echo -e "cml_ftp_user_fiobbio='foo'" >> /etc/cml_ftp_login_data.sh
sudo echo -e "cml_ftp_pwd_fiobbio='foo'" >> /etc/cml_ftp_login_data.sh
sudo echo -e "cml_ftp_user_misma='foo'" >> /etc/cml_ftp_login_data.sh
sudo echo -e "cml_ftp_pwd_misma='foo'" >> /etc/cml_ftp_login_data.sh

sudo echo -e "misma_webcam_login='foo:bar'\n" > /etc/webcam_login_data.sh
