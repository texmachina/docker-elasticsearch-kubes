FROM quay.io/jpoye/docker-elasticsearch:5.0.1
MAINTAINER Jacob Poye <me@jacobpoye.com>

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.0.1 --verbose && \
    /elasticsearch/bin/elasticsearch-plugin install x-pack:5.0.1 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery