FROM registry.access.redhat.com/ubi8/openjdk-17:1.20-2

ENV LANGUAGE='en_US:en'

COPY jolokia /tmp/scripts/jolokia

USER root
RUN ["mkdir", "/usr/share/java/jolokia-jvm-agent"]
COPY --chown=185 jolokia/jolokia-agent-jvm-javaagent.jar /usr/share/java/jolokia-jvm-agent/jolokia-jvm.jar

ENV \
AB_JOLOKIA_AUTH_OPENSHIFT="true" \
AB_JOLOKIA_HTTPS="true" \
AB_JOLOKIA_PASSWORD_RANDOM="true" \
JBOSS_CONTAINER_JOLOKIA_MODULE="/opt/jboss/container/jolokia" \
JOLOKIA_VERSION="2.0.3"
# Set 'jboss.container.jolokia' module defined labels
LABEL \
io.fabric8.s2i.version.jolokia="2.0.3"
# Exposed ports in 'jboss.container.jolokia' module
EXPOSE 8778
# Custom scripts from 'jboss.container.jolokia' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jolokia/configure.sh" ]

# copy application bundle
COPY --chown=185 target/${{ values.component_id }}*.jar /deployments/bundle.jar

EXPOSE ${{ values.port }} ${{ values.management_port }}
USER 185

ENV JAVA_APP_JAR="/deployments/bundle.jar"
