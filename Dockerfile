FROM microsoft/dotnet:2.2-sdk-alpine AS build
RUN apk add --no-cache git
RUN git clone https://github.com/RandomUser99/TwitchVods.git /tmp/twitchvods
RUN cd /tmp/twitchvods \
	&& dotnet publish --configuration Release --output /tmp/build

FROM microsoft/dotnet:2.2-runtime-alpine AS runtime
COPY --from=build /tmp/build /opt/twitchvods

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]
