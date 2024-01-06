FROM kwundram/own_openeo:1.6

# create directories
# RUN mkdir -p /opt/dockerfiles/ && mkdir -p /var/openeo/workspace/ && mkdir -p /var/openeo/workspace/data/
#RUN Rscript -e "install.packages('torch')"
#RUN Rscript -e "install.packages('gdalUtilities')"
#RUN Rscript -e "install.packages('terra')"
#RUN Rscript -e "install.packages('torch')"
#RUN Rscript -e "install.packages('slider')"
#RUN apt-get -y install libfreetype-dev
#RUN apt-get -y install libfreetype6-dev

# install packages from local directory
COPY ./ /opt/dockerfiles/
#RUN Rscript -e "remotes::install_local('/opt/dockerfiles',dependencies=TRUE)"
#RUN Rscript -e "remotes::install_github('CopernicusCodeCrafters/openeocubes@ChangeProcesses',dependencies=TRUE, force = TRUE)"
# RUN Rscript -e "remotes::install_github('PondiB/openeocubes', ref = 'main', dependencies=TRUE, force = TRUE)"
# cmd or entrypoint for startup
CMD ["R", "-q", "--no-save", "-f /opt/dockerfiles/Dockerfiles/start.R"]

EXPOSE 8000