FROM mcr.microsoft.com/dotnet/core/sdk:3.1
WORKDIR /code
COPY . .
WORKDIR /code/DotnetTemplate.Web
#RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -yq nodejs 

RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -yq

RUN npm install
WORKDIR /code
RUN dotnet build
WORKDIR /code/DotnetTemplate.Web
RUN npm run build
ENTRYPOINT ["dotnet", "run"]
