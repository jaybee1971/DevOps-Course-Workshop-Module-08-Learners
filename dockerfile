FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN apt-get update && apt-get install -y \
    bash \
    curl 
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -\
    && apt-get install -y nodejs
COPY ./ ./
RUN dotnet build
WORKDIR /DotnetTemplate.Web
RUN npm install
RUN npm run build
EXPOSE 5000
