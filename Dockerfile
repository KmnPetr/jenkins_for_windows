FROM docker:dind

# Устанавливаем git и другие зависимости
RUN apk add --no-cache git openjdk17

# Загружаем Jenkins WAR-файл
RUN wget -q -O /usr/share/jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Создаём папку для Jenkins и задаём рабочую директорию
RUN mkdir -p /var/jenkins_home && chmod 777 /var/jenkins_home
ENV JENKINS_HOME /var/jenkins_home

# Открываем порт для веб-интерфейса Jenkins
EXPOSE 8080

# Запускаем Docker-демон и Jenkins
CMD dockerd & java -jar /usr/share/jenkins.war