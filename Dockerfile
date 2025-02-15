FROM docker:dind

# Устанавливаем необходимые зависимости
RUN apk update && apk add --no-cache \
  openjdk17-jre \
  bash \
  curl \
  git \
  python3 \
  py3-pip \
  ca-certificates \
  nodejs \
  npm

#добавление шрифтов для дженкинса
RUN apk add --no-cache fontconfig ttf-dejavu
# Создаём папку для Jenkins
RUN mkdir -p /usr/share/jenkins

# Загружаем последнюю стабильную версию Jenkins WAR
RUN curl -fsSL https://get.jenkins.io/war-stable/latest/jenkins.war -o /usr/share/jenkins/jenkins.war

# Открываем порт Jenkins
EXPOSE 8080

# Запускаем Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]