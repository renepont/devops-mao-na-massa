FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -S notes -G notes
ENV MAVEN_VERSION 3.5.4
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH ${MAVEN_HOME}/bin:$PATH
RUN wget http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION ${MAVEN_HOME}
RUN apk --update add git
RUN mkdir /opt/note
RUN chown -R notes:notes /opt/note
USER notes:notes
RUN git clone https://github.com/callicoder/spring-boot-mysql-rest-api-tutorial.git /opt/note
WORKDIR /opt/note
COPY pom.xml pom.xml
RUN mvn package -Dmaven.test.skip=true
ARG JAR_FILE=*.jar
RUN cp ./target/easy-notes-1.0.0.jar /opt/note/easy-note.jar
COPY application.properties aplication.properties
ENTRYPOINT [ "java", "-jar", "/easy-note.jar" ]