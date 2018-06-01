**1 Preliminary Note**
As mentioned in the introduction, nginx must be compiled with the HttpGeoipModule. To check if your nginx was compiled with that module, run:

`nginx -V`

If you see --with-http_geoip_module in the output, you are ready to use the GeoIP database with nginx:

**2 Installing The GeoIP Database**

On Debian/Ubuntu, the GeoIP database can be installed as follows:

`sudo apt-get install geoip-database libgeoip1`

This places the GeoIP database in /usr/share/GeoIP/GeoIP.dat.

It is possible that it is a bit outdated. Therefore we can optionally download a fresh copy from the GeoIP web site:

`mv /usr/share/GeoIP/GeoIP.dat /usr/share/GeoIP/GeoIP.dat_bak`

```
cd /usr/share/GeoIP/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz
```

**3 Configuring nginx**

Open /etc/nginx/nginx.conf...

`nano /etc/nginx/nginx.conf`

... and place this in the http {} block, before any include lines:

```
[...]
    geoip_country /usr/share/GeoIP/GeoIP.dat;
    map $geoip_country_code $allowed_country {
        default yes;
        FK no;
        FM no;
        EH no;
    }
[...]
```
This allows all countries, except the three countries set to no (you can find a list of country codes here https://dev.maxmind.com/geoip/legacy/codes/iso3166/). To do it the other way round, i.e. block all countries and allow only a few, you'd do it this way:

```
[...]
    geoip_country /usr/share/GeoIP/GeoIP.dat;
    map $geoip_country_code $allowed_country {
        default no;
        FK yes;
        FM yes;
        EH yes;
    }
[...]
```
Now, this actually doesn't block any country, it just sets the $allowed_country variable. To actually block countries, you must open your vhost configuration and place the following code in the server {} container (this can go inside and also outside any location {} block):

```
[...]
        if ($allowed_country = no) {
            return 444;
        }
[...]
```
This returns the 444 error code to any visitor from a blocked country. What this does is it closes the connection without sending any headers. You can also use another error code like 403 ("Forbidden") if you like.

Reload nginx afterwards:

`/etc/init.d/nginx reload`

Reference:<BR>
https://www.howtoforge.com/nginx-how-to-block-visitors-by-country-with-the-geoip-module-debian-ubuntu
https://dev.maxmind.com/geoip/geoip2/geolite2/