if not exist "output" mkdir output
docker run --interactive --tty -v /d/docker/deejayeyedocker/output:/root/deejayeye-modder/__MODDED_APK_OUT__ -t deejayeyedocker:latest
