# Pure CMS 内容管理系统插件

Pure CMS（Advanced Content Management System）是基于PHP的 Webman 框架开发的内容管理系统插件，支持文章、分类、标签、评论等常用 CMS 功能，适用于技术博客、资讯站点等内容型网站。


## 主要功能

- 文章管理：发布、编辑、删除、置顶、推荐、状态切换
- 分类管理：多级分类，支持 SEO 字段
- 标签管理：标签增删改查，文章标签关联
- 评论管理：评论审核、回复、删除、点赞功能
- 前台展示：文章列表、详情、分类、标签、搜索、评论、收藏、点赞（需登录）
- 后台管理：基于 Webman Admin，user支持权限与菜单集成


## 环境要求

- php版本：>8.1
- 必须的php拓展：common|pdo|redis|openssl|ctype

## 部署
### 1. 拉取代码
```
git clone git@github.com:dbx192/pureCMS.git
```
### 2. 安装依赖
```
composer install
```

### 3. 修改配置
- 修改config\database.php文件中的hots,port,user,password等数据库配置
- 修改config\redis.php文件中的密码配置
- 修改config\app.php中debug配置：
```
'debug' => env('APP_DEBUG', false), // 改为 true 或 false
```

### 4. 导入数据库
** 数据库文件中已有建库语句，完整导入即可 **

```
source pure_cms.sql
// 或者navicat导入
```
### 5. 启动服务

#### linux环境下运行：
```
php start start.php -d
```
#### windows环境下运行：
```
php windows.php start
```

## 账号
** config\process.php可修改端口，默认端口为8787 **

### 管理账号：
http://127.0.0.1:8787/app/admin#
- 用户名：admin
- 密码：123456

### 测试账号：
http://127.0.0.1:8787/app/Pure CMS
- 用户名：testUser
- 密码：123456

### 如果使用nginx反向代理，需要修改nginx配置文件，添加以下配置：

> 请把ask.nbfuli.cn改成你自己的域名

```
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

## 目录结构

```
plugin/
  acms/
    install.sql                // 数据库结构及初始数据
    readme.md                  // 插件说明文档
    api/                       // API 相关代码
    app/                       // 控制器、模型、服务等
    config/                    // 路由、菜单等配置
    public/                    // 静态资源
```

## 路由说明

- 前台路由前缀：`/app/acms`
  - 文章列表：`/app/acms`
  - 文章详情：`/app/acms/article/{id}`
  - 分类页：`/app/acms/category/{id}`
  - 标签页：`/app/acms/tag/{id}`
  - 搜索页：`/app/acms/search`
  - 评论提交：`/app/acms/comment/add`

- 后台路由前缀：`/app/admin/acms`
  - 文章管理：`/app/admin/acms/article/index`
  - 分类管理：`/app/admin/acms/category/index`
  - 标签管理：`/app/admin/acms/tag/index`
  - 评论管理：`/app/admin/acms/comment/index`

## 常见问题

### 1. 后台菜单/页面404

- 请确认 `plugin/acms/config/menu.php` 和 `plugin/acms/config/route.php` 路径均为 `/app/admin/acms/xxx`。
- 清理 Webman 缓存（删除 `runtime/` 下缓存文件）。
- 数据库表和初始数据已正确导入。

### 2. 路由冲突或无效

- 检查 `config/route.php` 是否有同名路由冲突。
- 确认插件目录名为 `acms`，并与路由、菜单配置一致。

### 3. 数据库连接失败

- 检查 `config/database.php` 数据库配置，确保与实际环境一致。

## 二次开发建议

- 控制器、模型、视图均遵循 Webman 规范，可直接扩展。
- 如需自定义菜单、权限，可修改 `config/menu.php`。
- 前端页面可在 `view/` 目录下自定义。
- 支持批量查询优化，提升多数据查询性能
- 新增文章ID关联功能，便于内容聚合
- 分类、菜单等支持多级嵌套，菜单渲染支持动态层级。

## 贡献与反馈

如有建议或问题，欢迎提交 Issue 或 PR。

---

**作者**：ouyangyi  
**开源协议**：MIT



![首页](https://www.workerman.net/upload/img/20250429/2968106dec1ba9.png)

![文章详情页](https://www.workerman.net/upload/img/20250429/2968106deffdd2.png)

![后台管理页面](https://www.workerman.net/upload/img/20250429/2968106df23963.png)

![文章编辑页面，支持md](https://www.workerman.net/upload/img/20250429/2968106df6c19c.png)

![分类管理](https://www.workerman.net/upload/img/20250429/2968106dfbba7d.png)

![评论管理](https://www.workerman.net/upload/img/20250429/2968106e01d5e0.png)
