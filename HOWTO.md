HOW TO (Tears in my eyes)
___

Laravel cache permissions. see
https://stackoverflow.com/questions/52065513/your-configuration-files-are-not-serializable
```bash
COMMAND:
php artisan cache:clear

OUTPUT:
Failed to clear cache. Make sure you have the appropriate permissions.

CHECK:
Config files has Clousure, refactor
```

Laravel config cache doesn't work

```bash
COMMAND:
php artisan config:cache

OUTPUT:
Your configuration files are not serializable.

CHECK:
Config (config/*) files has Clousure, refactor!. This aren't allowed.
```

Symfony env vars

```bash
COMMAND:
Go to page in browser

OUTPUT:
It's return 500 error

CHECK:
Your password database doesn't has special chars, else, encode with urlencode function

After that, clear cache, it doesn't work, See 2

SEE:
[See 1](https://github.com/symfony/skeleton/issues/40)
[See 2](https://github.com/symfony/symfony/issues/35568)
```
