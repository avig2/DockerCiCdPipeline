FROM node:16-alpine as BUILDER
WORKDIR /frontend
COPY ./ ./
RUN npm install
RUN npm run build 


FROM nginx
COPY --from=BUILDER /frontend/build /usr/share/nginx/html