FROM nginx
COPY ./tet-bookstore.tk /etc/nginx/sites-available/tet-bookstore.tk
COPY /etc/letsencrypt/live/tet-bookstore.tk/fullchain.pem /etc/letsencrypt/live/tet-bookstore.tk/fullchain.pem
COPY /etc/letsencrypt/live/tet-bookstore.tk/privkey.pem; /etc/letsencrypt/live/tet-bookstore.tk/privkey.pem
COPY /usr/share/nginx/html/bookstore /usr/share/nginx/html/bookstore
RUN ln -s /etc/nginx/sites-available/tet-bookstore.tk /etc/nginx/sites-enabled/tet-bookstore.tk