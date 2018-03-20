#
# Common variables. Edit variables as needed
#
. /etc/cml_ftp_login_data.sh
. /etc/webcam_login_data.sh

ftp_upload_dir=/srv/ftp/upload
wview_html_dir=/var/www/weather

fiobbioTempUrl="http://localhost/weather/realtime.json"
mismaTempUrl="http://localhost/misma/realtime.json"

misma_pic_name="snap.jpg"
misma_webcam_url=
misma_pano_name="panorama.jpg"
#
#
# CML FTP config (note: login credentials are not here :P)
cml_ftp_log_file=/var/log/cml_ftp.log
cml_ftp_server=ftp.centrometeolombardo.com
cml_ftp_upload_folder=public
# Set to 1 to log ftp upload information to stdout
cml_ftp_log_info=1


webcam_prefix="webcam"
webcam_raw_prefix="${webcam_prefix}_raw"
webcam_small_prefix="${webcam_prefix}_small"


#
# cfg format:
#
# name=$1
# srcInfo=$2
# text=$3
# temperature=$4
# ftp_login=$5

#fiobbioCfgFtp=( "fiobbio" \
#             "local ${ftp_upload_dir} *-alarm.jpg" \
#             "Fiobbio_di_Albino" \
#             ${cml_ftp_user_fiobbio} \
#             ${cml_ftp_pwd_fiobbio}  \
#             "${fiobbioTempUrl}" )

fiobbioCfg=( "fiobbio" \
             "http ${fiobbio_webcam_login} http://192.168.1.178/cgi-bin/snapshot.cgi?stream=0" \
             "Fiobbio_di_Albino" \
             "${fiobbioTempUrl}" \
             "${cml_ftp_user_fiobbio} ${cml_ftp_pwd_fiobbio}" )

mismaCfg=( "misma" \
           "http ${misma_webcam_login} 192.168.1.205:8083/tmpfs/${misma_pic_name}" \
           "Monte_Misma_(Fiobbio)"
           ${cml_ftp_user_misma} \
           ${cml_ftp_pwd_misma} \
           "${mismaTempUrl}" )


mismaPanoCfg=( "mismapano" \
               "local /home/pi/dev/panogen/out panorama.jpg" \
               "Monte_Misma_360"
               "${mismaTempUrl}" \
               "${cml_ftp_user_misma} ${cml_ftp_pwd_misma}" )


