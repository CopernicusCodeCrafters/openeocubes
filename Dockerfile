FROM kwundram/own_openeo:1.2

# create directories
# RUN mkdir -p /opt/dockerfiles/ && mkdir -p /var/openeo/workspace/ && mkdir -p /var/openeo/workspace/data/

# install packages from local directory
COPY ./ /opt/dockerfiles/
# RUN Rscript -e "remotes::install_local('/opt/dockerfiles',dependencies=TRUE)"
# RUN Rscript -e "remotes::install_github('PondiB/openeocubes', ref = 'main', dependencies=TRUE, force = TRUE)"
# cmd or entrypoint for startup
CMD ["R", "-q", "--no-save", "-f /opt/dockerfiles/Dockerfiles/start.R"]

EXPOSE 8000