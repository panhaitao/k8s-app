## install

## trubleshooting

If WordPress is already installed:

install-helper.php returns just a blank page.install.php says WordPress is installed and you should log in: enter image description here
You can forbid access to both files with a simple rule in your

.htaccess 

above the permalink rules:

RedirectMatch Permanent wp-admin/install(-helper)?\.php /
