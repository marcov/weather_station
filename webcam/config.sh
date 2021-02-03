#
# Webcam config
#
source  /home/pi/secrets/cml_ftp_login_data.sh
source  /home/pi/secrets/webcam_login_data.sh

ftp_upload_dir="/srv/ftp/upload"

misma_pic_name="snap.jpg"
misma_webcam_url=
misma_pano_name="panorama.jpg"

#
# CML FTP config (note: login credentials are not here :P)
#
cml_ftp_log_file="/tmp/cml_ftp.log"
cml_ftp_server="ftp.centrometeolombardo.com"
cml_ftp_upload_folder="public"
# Set to 1 to log ftp upload information to stdout
cml_ftp_log_info=1

webcam_prefix="webcam"
webcam_raw_prefix="${webcam_prefix}_raw"
webcam_small_prefix="${webcam_prefix}_small"

httpServerHostname="192.168.1.200"
#
# cfg format:
#
# name=$1
# srcInfo=$2
# text=$3
# temperature=$4
# ftp_login=$5
# picture_size=$6

fiobbioCfg=( "fiobbio" \
             "http ${fiobbio_webcam_login} http://192.168.1.178/cgi-bin/snapshot.cgi?stream=0" \
             "Fiobbio_di_Albino" \
             "http://${httpServerHostname}/realtime.json" \
             "${cml_ftp_user_fiobbio} ${cml_ftp_pwd_fiobbio}" \
             "800x600" )


declare -i fiobbioRetries=1
declare -i mismaRetries=6
declare -i panoRetries=0

mismaCfg=( "misma" \
           "http ${misma_webcam_login} 192.168.1.205:8083/tmpfs/${misma_pic_name}" \
           "Monte_Misma_(Fiobbio)" \
           "http://${httpServerHostname}/misma/realtime.json" \
           "${cml_ftp_user_misma} ${cml_ftp_pwd_misma}" \
           "800x600" )

mismaPanoCfg=( "mismapano" \
               "local /home/pi/panogen/out panorama.jpg" \
               "Monte_Misma_360" \
               "http://${httpServerHostname}/misma/realtime.json" \
               "${cml_ftp_user_misma} ${cml_ftp_pwd_misma} _pano" \
               "2048x1536" )