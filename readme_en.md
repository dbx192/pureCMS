# Pure CMS Content Management System Plugin

Pure CMS (Advanced Content Management System) is a content management system plugin developed based on the php Webman framework. It supports common CMS functions such as articles, categories, tags, comments, etc., and is suitable for content-based websites such as technical blogs and information portals.

## Main Features
- Article Management: Publish, edit, delete, sticky, recommend, and switch status.
- Category Management: Multi-level categories with SEO fields support.
- Tag Management: CRUD operations for tags and tag-article associations.
- Comment Management: Comment review, reply, delete, and like functions.
- Frontend Display: Article lists, details, categories, tags, search, and comments (login required).
- Backend Management: Based on Webman Admin with permission and menu integration support from Webman User.

## Environment Requirements
- PHP Version: >8.1
- Required PHP Extensions: common|pdo|redis|openssl|ctype

## Deployment
### 1. Pull the Code
```bash
git clone git@github.com:dbx192/pureCMS.git
```

### 2. Install Dependencies
```bash
composer install
```

### 3. Modify Configuration
- Update database configuration (host, port, user, password, etc.) in the `config/database.php` file.
- Update Redis password configuration in the `config/redis.php` file.
- Modify the debug configuration in `config/app.php`:
```php
'debug' => env('APP_DEBUG', false), // Change to true or false
```

### 4. Import Database
**The database file already contains database creation statements. Import it completely.**
```bash
source pure_cms.sql
// Or import via Navicat
```

### 5. Start the Service
#### Run on Linux:
```bash
php start start.php -d
```

#### Run on Windows:
```bash
php windows.php start
```

## Account Information
**The default port is 8787. You can modify it in the `config/process.php` file.**

### Admin Account:
http://127.0.0.1:8787/app/admin#
- Username: admin
- Password: 123456

### Test Account:
http://127.0.0.1:8787/app/Pure CMS
- Username: testUser
- Password: 123456

### If using Nginx reverse proxy, add the following configuration to your Nginx config file:
> Replace `ask.nbfuli.cn` with your own domain name

```nginx
upstream webman {
    server 127.0.0.1:8787;
    keepalive 10240;
}

# Define the limit zone and parameters
limit_req_zone $binary_remote_addr zone=req_limit:10m rate=3r/s;

server {
    listen 80;
    listen [::]:80;
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name ask.nbfuli.cn;

    ssl_certificate /usr/local/nginx/conf/ssl/ask.nbfuli.cn.pem;
    ssl_certificate_key /usr/local/nginx/conf/ssl/ask.nbfuli.cn.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:EECDH+AESGCM:EECDH+CHACHA20;
    ssl_prefer_server_ciphers on;
    ssl_session_timeout 10m;
    ssl_session_cache shared:SSL:10m;
    ssl_buffer_size 1400;
    add_header Strict-Transport-Security "max-age=15768000" always;
    ssl_stapling on;
    ssl_stapling_verify on;

    access_log /data/wwwlogs/ask.nbfuli.cn_nginx.log combined;
    index index.html index.htm index.php;
    root /www/askme-webman/public;

    # Static files caching
    location ~* \.(js|css|gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
        expires 30d;
        access_log off;
    }

    location ^~ / {
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header Host $http_host;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_http_version 1.1;
      proxy_set_header Connection "keep-alive";
      if (!-f $request_filename){
          proxy_pass http://webman;
      }
    }

    # Restricted locations
    location /secret-source {
        return 403;
    }

    location /view-source {
        return 403;
    }

    location ~ /(\.user\.ini|\.ht|\.git|\.svn|\.project|LICENSE|README\.md) {
        deny all;
    }

    location /.well-known {
        allow all;
    }
}
```



## Directory Structure
```
plugin/
  acms/
    install.sql                // Database structure and initial data
    readme.md                  // Plugin documentation
    api/                       // API-related code
    app/                       // Controllers, models, services, etc.
    config/                    // Configuration for routes, menus, etc.
    public/                    // Static resources
```

## Route Explanation
- Frontend Route Prefix: `/app/acms`
  - Article List: `/app/acms`
  - Article Detail: `/app/acms/article/{id}`
  - Category Page: `/app/acms/category/{id}`
  - Tag Page: `/app/acms/tag/{id}`
  - Search Page: `/app/acms/search`
  - Comment Submission: `/app/acms/comment/add`

- Backend Route Prefix: `/app/admin/acms`
  - Article Management: `/app/admin/acms/article/index`
  - Category Management: `/app/admin/acms/category/index`
  - Tag Management: `/app/admin/acms/tag/index`
  - Comment Management: `/app/admin/acms/comment/index`

## Common Issues
### 1. 404 Error for Backend Menus/Pages
- Ensure that the paths in `plugin/acms/config/menu.php` and `plugin/acms/config/route.php` are all `/app/admin/acms/xxx`.
- Clear Webman cache (delete cache files under `runtime/`).
- Verify that the database tables and initial data have been imported correctly.

### 2. Route Conflicts or Invalid Routes
- Check `config/route.php` for conflicting route names.
- Ensure the plugin directory name is `acms` and matches the route and menu configurations.

### 3. Database Connection Failure
- Check the database configuration in `config/database.php` to ensure it matches your environment.

## Suggestions for Secondary Development
- Controllers, models, and views follow Webman specifications and can be directly extended.
- Modify `config/menu.php` to customize menus and permissions.
- Customize frontend pages in the `view/` directory.
- Supports batch query optimization to improve performance for large data queries.
- New article ID association function for easier content aggregation.
- Categories and menus support multi-level nesting with dynamic level rendering.

## Contribution and Feedback
If you have any suggestions or issues, please submit an Issue or PR.

---

**Author**: ouyangyi  
**Open Source License**: MIT
```