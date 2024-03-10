# Alpine Linux tabanlı bir image kullanıyoruz
FROM alpine:latest

# Nikto'nun bağımlılıklarını kuruyoruz
RUN apk add --no-cache perl perl-net-ssleay perl-io-socket-ssl perl-datetime perl-digest-md5 perl-html-parser perl-html-tagset perl-www-robotrules perl-libwww perl-http-cookies perl-http-daemon perl-http-negotiate perl-http-message perl-net-http perl-try-tiny perl-lwp-mediatypes perl-http-date perl-io-html perl-encode-locale perl-uri perl-file-listing perl-www-robotrules perl-http-cookies perl-http-daemon perl-http-negotiate perl-net-http perl-www-robotrules perl-http-message perl-lwp-mediatypes git

# Nikto'yu GitHub reposundan doğrudan klonluyoruz
RUN git clone --depth 1 https://github.com/sullo/nikto.git /nikto

# Çalışma dizinini Nikto'nun bulunduğu dizin olarak ayarlıyoruz
WORKDIR /nikto/program

# Nikto'yu çalıştırıyoruz
ENTRYPOINT ["./nikto.pl"]
