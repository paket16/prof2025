
# Написание виртуального хоста при помощи Apache и Nginx.

## Настройка Apache
```
VirtualHost *:80>
    ServerName cloud.datacenter.mgmt
    Redirect permanent / https://cloud.datacenter.mgmt/
</VirtualHost>

<VirtualHost *:443>
    ServerName cloud.datacenter.mgmt
    DocumentRoot /var/www/nextcloud  # Замените на фактический путь к NextCloud

    SSLEngine on
    SSLCertificateFile  # Замените на путь к вашему сертификату
    SSLCertificateKeyFile  # Замените на путь к вашему ключу

    <Directory /var/www/nextcloud/>  # Замените на фактический путь к NextCloud
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews

        <IfModule mod_dav.c>
            Dav off
        </IfModule>
    </Directory>
</VirtualHost>
```


### Пошаговая инструкция (для Debian):

#### Создайте файл конфигурации:

nano /etc/apache2/sites-available/cloud.datacenter.mgmt.conf
Замените cloud.datacenter.mgmt.conf на любое имя файла, которое вам нравится, но рекомендуется использовать имя домена.

Вставьте конфигурацию виртуального хоста, которая была выше, в этот файл. Обязательно замените заполнители (пути к каталогам и файлам) на фактические значения для вашей системы.

#### 1. Сохраните и закройте файл:

В nano, нажмите Ctrl+X, затем Y (для подтверждения сохранения), затем Enter.

#### 2. Включите виртуальный хост:

a2ensite (Обязательно проверьте имеете ли этот инструмент)

a2ensite cloud.datacenter.mgmt.conf
Эта команда создаст символическую ссылку из sites-available в sites-enabled, что позволит Apache использовать эту конфигурацию.

#### 3. Отключите сайт по умолчанию (если необходимо):

Если у вас уже есть сайт по умолчанию, который прослушивает порт 80 и 443, вам может потребоваться отключить его, чтобы избежать конфликтов.

a2dissite 000-default.conf  # Или другое имя файла сайта по умолчанию

#### 4. Проверьте конфигурацию Apache на наличие ошибок:

apachectl configtest
Эта команда проверит синтаксис ваших файлов конфигурации. Если есть ошибки, она сообщит вам о них.

#### 5. Перезапустите Apache:

systemctl restart apache2
Эта команда перезапустит веб-сервер Apache, чтобы он применил новые настройки.


