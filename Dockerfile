#构建阶段
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . /app
RUN yarn build

#运行阶段
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf