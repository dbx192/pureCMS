-- 1. First create the database
CREATE DATABASE IF NOT EXISTS `pure_cms`
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- 2. Then select the database
USE `pure_cms`;

-- 3. Set connection encoding and foreign key checks
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 4. Now create your tables (which you said already exist)
-- [Your table creation SQL would go here]

-- 5. Finally re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;



-- ----------------------------
-- Table structure for acms_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `acms_article_tag`;
CREATE TABLE `acms_article_tag`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int(0) UNSIGNED NOT NULL COMMENT '文章ID',
  `tag_id` int(0) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `article_tag`(`article_id`, `tag_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_article_tag
-- ----------------------------
INSERT INTO `acms_article_tag` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for acms_articles
-- ----------------------------
DROP TABLE IF EXISTS `acms_articles`;
CREATE TABLE `acms_articles`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `category_id` int(0) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `views` int(0) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `likes` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序值',
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO描述',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '发布者ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文章类型，1markdown,2html',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_top`(`is_top`) USING BTREE,
  INDEX `is_recommend`(`is_recommend`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_articles
-- ----------------------------
INSERT INTO `acms_articles` VALUES (1, 'vscode快捷键', '以下是 VS Code 默认快捷键的系统差异对照表（一行一条）：  \r\n\r\n| 操作                     | Windows/Linux       | macOS               | 备注                     |\r\n|------------------------------|-------------------------|-------------------------|-----------------------------|\r\n| 打开用户设置                 | `Ctrl + ,`              | `⌘ + ,`                 |                             |\r\n| 打开快捷键设置               | `Ctrl + K Ctrl + S`      | `⌘ + K ⌘ + S`           | 需按组合顺序操作            |\r\n| 打开/关闭终端                | `` Ctrl + ` ``          | `` ⌘ + ` ``             | 反引号键                    |\r\n| 新建终端                     | `Ctrl + Shift + \\``     | `⌘ + Shift + \\``        |                             |\r\n| 选中所有相同单词             | `Ctrl + F2`             | `⌘ + F2`                | 类似 Sublime 的 `Alt + F3` |\r\n| 重命名变量/方法              | `F2`                    | `F2`                    | 部分 Mac 需 `fn + F2`       |\r\n| 复制当前行                   | `Alt + Shift + ↓/↑`     | `⌥ + Shift + ↓/↑`       |                             |\r\n| 跳转到某行                   | `Ctrl + G`              | `⌘ + G`                 |                             |\r\n| 文件头/文件尾                | `Ctrl + Home/End`       | `⌘ + ↑/↓`               | Mac 无直接 `Home/End` 键    |\r\n| 返回/前进历史位置            | `Alt + ←/→`             | `⌥ + ←/→`               |                             |\r\n| 查找当前文件方法             | `Ctrl + Shift + O`      | `⌘ + Shift + O`         |                             |\r\n| 全局符号搜索                 | `Ctrl + T`              | `⌘ + T`                 |                             |\r\n| 查看定义                     | `F12`                   | `F12`                   | 部分 Mac 需 `fn + F12`      |\r\n| 提取方法                     | `Ctrl + .`              | `⌘ + .`                 | 需选中代码后触发           |\r\n| 快速打开文件                 | `Ctrl + P`              | `⌘ + P`                 |                             |\r\n| 关闭当前文件                 | `Ctrl + W`              | `⌘ + W`                 |                             |\r\n| 切换标签页                   | `Ctrl + PageUp/PageDown`| `⌘ + Option + ←/→`       | Mac 无 `PageUp/PageDown`    |\r\n| 跳转到下一个错误             | `F8`                    | `F8`                    | 部分 Mac 需 `fn + F8`       |\r\n\r\n**注意事项**：\r\n1. Mac 功能键：`F1-F12` 默认绑定系统功能（如亮度调节），需配合 `fn` 键（或修改系统设置）。  \r\n2. Linux 差异：部分键盘可能需要 `Fn + Home/End` 或自定义映射。  \r\n3. 符号替代：  \r\n   • `⌘` = Command (`Cmd`)  \r\n\r\n   • `⌥` = Option (`Alt`)  \r\n\r\n   • `⌃` = Control (`Ctrl`)  \r\n\r\n\r\n表格严格遵循 官方默认键位，无自定义内容。', 'MySQL索引优化核心要点', '', 1, '测试,技术', 40, 41, 1, 1, 1, 1, '数据库优化指南', 'MySQL,索引,性能', '数据库优化技术文章', '2025-04-28 17:41:33', '2025-05-09 16:29:09', 1, 1);
INSERT INTO `acms_articles` VALUES (2, '2025科技趋势速览', '人工智能与量子计算将引领未来十年。', '前沿科技发展趋势分析', '/images/news-thumb.jpg', 2, '新闻,科技', 66, 75, 1, 1, 1, 5, '年度科技趋势', 'AI,量子计算', '2025年重点科技领域预测', '2025-04-28 17:41:33', '2025-04-29 14:10:00', 1, 1);
INSERT INTO `acms_articles` VALUES (3, '高效编程实践', '注重代码可读性与模块化设计。', '编程规范的重要性', NULL, 1, '编程', 127, 11, 0, 0, 1, 20, NULL, NULL, NULL, '2025-04-28 17:41:33', '2025-04-28 19:21:49', 1, 1);
INSERT INTO `acms_articles` VALUES (5, '健康生活小贴士', '每日适量运动与均衡饮食是关键。', '生活方式健康建议', '/images/health-thumb.png', 3, '健康,生活', 30, 14, 0, 0, 1, 15, '健康指南', '运动,营养', NULL, '2025-04-28 17:41:33', '2025-04-29 11:04:27', 1, 1);
INSERT INTO `acms_articles` VALUES (12, '前端框架对比分析', 'React与Vue的核心差异比较。', '主流框架技术特点', '/images/tech.png', 1, '前端,框架', 157, 40, 1, 1, 1, 8, '框架技术选型', 'React,Vue', '前端开发框架对比', '2025-04-28 17:41:33', '2025-04-29 16:27:06', 1, 1);
INSERT INTO `acms_articles` VALUES (13, '企业数字化转型', '传统行业如何实现数据驱动决策。', '数字化升级路径', NULL, 2, '商业,技术', 57, 4, 0, 1, 1, 12, '企业转型策略', '数字化,大数据', '企业创新方法论', '2025-04-28 17:41:33', '2025-04-29 16:32:48', 1, 1);
INSERT INTO `acms_articles` VALUES (14, '摄影构图基础教学', '三分法与黄金分割的运用技巧。', '摄影入门教程', '/images/photo.jpg', 3, '艺术,摄影', 11, 7, 0, 0, 1, 18, NULL, '构图,技巧', '摄影基础课程', '2025-04-28 17:41:33', '2025-04-29 11:04:30', 1, 1);
INSERT INTO `acms_articles` VALUES (15, '区块链技术原理', '分布式账本与智能合约解析。', '区块链核心机制说明', '/images/blockchain.png', 1, '区块链,技术', 19, 36, 1, 1, 1, 6, '区块链入门', '去中心化,智能合约', '区块链技术详解', '2025-04-28 17:41:33', '2025-04-29 15:52:21', 1, 1);
INSERT INTO `acms_articles` VALUES (16, '环保材料新突破', '可降解塑料研发取得重大进展。', '新材料技术新闻', '/images/environment.jpg', 2, '环保,科技', 48, 48, 0, 0, 1, 22, '环保科技动态', '可降解材料', '新材料研发报道', '2025-04-28 17:41:33', '2025-05-09 16:29:22', 1, 1);
INSERT INTO `acms_articles` VALUES (17, '金融风险管理策略', '系统性风险与对冲工具应用。\n## werfew \nceshi', '金融风控方法论', '', 3, '', 22, 14, 0, 0, 1, 30, '', '', '金融风险控制专题', '2025-04-28 17:41:33', '2025-04-29 14:08:35', 1, 1);
INSERT INTO `acms_articles` VALUES (18, '测试图片', '![](/app/acms/upload/img/20250429/68108056b365.png)\n![](/app/acms/upload/img/20250429/681081967f0b.png)', '士大夫但是', '', 7, '', 13, 0, 0, 0, 1, 0, '', '', '', '2025-04-29 15:37:12', '2025-04-29 16:32:56', 1, 1);

-- ----------------------------
-- Table structure for acms_categories
-- ----------------------------
DROP TABLE IF EXISTS `acms_categories`;
CREATE TABLE `acms_categories`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类别名',
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序值',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SEO描述',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_categories
-- ----------------------------
INSERT INTO `acms_categories` VALUES (1, '默认分类', 'default', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-04-16 18:38:31', '2025-04-16 18:38:31');
INSERT INTO `acms_categories` VALUES (2, '技术分享', 'tech', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-04-16 18:38:31', '2025-04-16 18:38:31');
INSERT INTO `acms_categories` VALUES (3, '行业资讯', 'news', 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-04-16 18:38:31', '2025-04-16 18:38:31');
INSERT INTO `acms_categories` VALUES (4, '编程语言', 'programming', 0, '主流编程语言技术专栏', '/images/code-icon.png', 10, 1, '编程语言学习指南', 'Java,Python,PHP,Go', '涵盖各类编程语言教程与最佳实践', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (5, '前端开发', 'frontend', 0, 'Web前端技术分享', '/images/frontend-icon.png', 20, 1, '前端开发资源大全', 'HTML,CSS,JavaScript,Vue,React', '最新前端框架与开发技巧', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (6, '后端架构', 'backend', 0, '服务器与分布式系统', '/images/server-icon.png', 30, 1, '后端架构设计', '微服务,MySQL,Redis', '高并发系统架构解决方案', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (7, '人工智能', 'ai', 0, '机器学习与深度学习', '/images/ai-icon.png', 40, 1, 'AI技术前沿', 'TensorFlow,PyTorch,神经网络', '人工智能算法与应用案例', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (8, '区块链', 'blockchain', 0, '去中心化技术研究', '/images/blockchain-icon.png', 50, 1, '区块链技术解析', '比特币,以太坊,智能合约', '区块链原理与开发实践', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (9, 'Java开发', 'java', 1, 'Java生态技术栈', '/images/java-icon.png', 11, 1, 'Java工程师成长路径', 'SpringBoot,MyBatis,JVM', '企业级Java开发全攻略', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (10, 'Python实战', 'python', 1, 'Python应用开发', '/images/python-icon.png', 12, 1, 'Python全能开发', 'Django,Flask,爬虫', '从入门到精通的Python教程', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (11, 'PHP编程', 'php', 1, 'Web开发首选语言', '/images/php-icon.png', 13, 1, 'PHP最佳实践', 'Laravel,ThinkPHP', '高性能PHP开发指南', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (12, 'Go语言', 'golang', 1, '云原生开发语言', '/images/go-icon.png', 14, 1, 'Go语言并发编程', 'Gin,微服务,协程', 'Go语言高并发实战', '2025-04-28 17:41:33', '2025-04-28 17:41:33');
INSERT INTO `acms_categories` VALUES (13, 'Rust入门', 'rust', 1, '系统级编程语言', '/images/rust-icon.png', 15, 1, 'Rust安全编程', '所有权,生命周期', 'Rust内存安全机制解析', '2025-04-28 17:41:33', '2025-04-28 17:41:33');

-- ----------------------------
-- Table structure for acms_comment_likes
-- ----------------------------
DROP TABLE IF EXISTS `acms_comment_likes`;
CREATE TABLE `acms_comment_likes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID',
  `comment_id` int(0) UNSIGNED NOT NULL COMMENT '评论ID',
  `article_id` int(0) UNSIGNED NOT NULL COMMENT '文章ID',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_comment`(`user_id`, `comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_comment_likes
-- ----------------------------
INSERT INTO `acms_comment_likes` VALUES (32, 1, 2, 1, '2025-04-29 10:05:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (33, 1, 3, 1, '2025-04-29 10:10:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (34, 1, 4, 1, '2025-04-29 10:15:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (35, 1, 5, 1, '2025-04-29 10:20:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (36, 1, 6, 1, '2025-04-29 10:25:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (37, 1, 7, 1, '2025-04-29 10:30:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (38, 1, 8, 1, '2025-04-29 10:35:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (39, 1, 9, 1, '2025-04-29 10:40:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (40, 1, 10, 1, '2025-04-29 10:45:00', NULL);
INSERT INTO `acms_comment_likes` VALUES (42, 1, 1, 1, '2025-05-09 16:24:34', '2025-05-09 16:24:34');

-- ----------------------------
-- Table structure for acms_comments
-- ----------------------------
DROP TABLE IF EXISTS `acms_comments`;
CREATE TABLE `acms_comments`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `user_id` bigint(0) UNSIGNED NOT NULL COMMENT '用户ID',
  `article_id` bigint(0) UNSIGNED NOT NULL COMMENT '文章ID',
  `parent_id` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父评论ID',
  `status` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0-待审核 1-已审核',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `likes` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_comments
-- ----------------------------
INSERT INTO `acms_comments` VALUES (1, '这篇文章讲解得非常清晰，特别是数据库优化部分对我帮助很大！', 101, 1, 0, 1, '2024-03-15 09:12:34', '2025-05-09 16:24:34', 1);
INSERT INTO `acms_comments` VALUES (2, '同感！作者把B+树索引原理讲得很易懂', 102, 1, 1, 1, '2024-03-15 10:05:21', '2024-03-15 10:05:21', 0);
INSERT INTO `acms_comments` VALUES (3, '期待作者更新量子计算的实际应用案例', 103, 2, 0, 0, '2024-03-16 14:30:45', '2024-03-16 14:30:45', 0);
INSERT INTO `acms_comments` VALUES (4, '个人觉得PHP在2024年已经不是最佳选择了', 104, 3, 0, 1, '2024-03-17 11:22:33', '2024-03-17 11:22:33', 0);
INSERT INTO `acms_comments` VALUES (5, 'PHP仍然在CMS领域占据主导地位，请看最新统计数据', 105, 3, 4, 1, '2024-03-17 13:15:40', '2024-03-17 13:15:40', 0);
INSERT INTO `acms_comments` VALUES (6, '请问示例代码中Redis连接池应该如何配置？', 106, 5, 0, 1, '2024-03-18 08:40:12', '2024-03-18 08:40:12', 0);
INSERT INTO `acms_comments` VALUES (7, '建议使用HikariCP配置，文档第5章有详细说明', 1, 5, 6, 1, '2024-03-18 09:05:30', '2024-03-18 09:05:30', 0);
INSERT INTO `acms_comments` VALUES (10, '我们团队50人采用中等粒度（10-15服务）运行良好', 108, 1, 2, 1, '2024-03-21 16:44:50', '2024-03-21 16:44:50', 0);
INSERT INTO `acms_comments` VALUES (11, '这篇文章讲解得非常清晰，特别是数据库优化部分对我帮助很大！', 1, 1, 0, 1, '2024-03-15 09:12:34', '2024-03-15 09:12:34', 0);
INSERT INTO `acms_comments` VALUES (12, '同感！作者把B+树索引原理讲得很易懂', 1, 1, 1, 1, '2024-03-15 10:05:21', '2024-03-15 10:05:21', 0);
INSERT INTO `acms_comments` VALUES (13, '期待作者更新量子计算的实际应用案例', 1, 2, 0, 0, '2024-03-16 14:30:45', '2024-03-16 14:30:45', 0);
INSERT INTO `acms_comments` VALUES (14, '个人觉得PHP在2024年已经不是最佳选择了', 1, 3, 0, 1, '2024-03-17 11:22:33', '2024-03-17 11:22:33', 0);
INSERT INTO `acms_comments` VALUES (15, 'PHP仍然在CMS领域占据主导地位，请看最新统计数据', 1, 3, 4, 1, '2024-03-17 13:15:40', '2024-03-17 13:15:40', 0);
INSERT INTO `acms_comments` VALUES (16, '请问示例代码中Redis连接池应该如何配置？', 1, 5, 0, 1, '2024-03-18 08:40:12', '2024-03-18 08:40:12', 0);
INSERT INTO `acms_comments` VALUES (17, '建议使用HikariCP配置，文档第5章有详细说明', 1, 5, 6, 1, '2024-03-18 09:05:30', '2024-03-18 09:05:30', 0);
INSERT INTO `acms_comments` VALUES (19, '关于微服务拆分粒度，我认为应该根据团队规模决定', 107, 6, 0, 1, '2024-03-20 15:33:28', '2024-03-20 15:33:28', 0);
INSERT INTO `acms_comments` VALUES (20, '我们团队50人采用中等粒度（10-15服务）运行良好', 1, 1, 2, 1, '2024-03-21 16:44:50', '2024-03-21 16:44:50', 0);
INSERT INTO `acms_comments` VALUES (21, '这篇文章讲解得非常清晰，特别是数据库优化部分对我帮助很大！', 1, 13, 0, 1, '2024-03-15 09:12:34', '2024-03-15 09:12:34', 0);
INSERT INTO `acms_comments` VALUES (22, '同感！作者把B+树索引原理讲得很易懂', 1, 14, 1, 15, '2024-03-15 10:05:21', '2024-03-15 10:05:21', 0);
INSERT INTO `acms_comments` VALUES (23, '期待作者更新量子计算的实际应用案例', 1, 2, 0, 0, '2024-03-16 14:30:45', '2024-03-16 14:30:45', 0);
INSERT INTO `acms_comments` VALUES (24, '个人觉得PHP在2024年已经不是最佳选择了', 1, 3, 0, 1, '2024-03-17 11:22:33', '2024-03-17 11:22:33', 0);
INSERT INTO `acms_comments` VALUES (25, 'PHP仍然在CMS领域占据主导地位，请看最新统计数据', 1, 3, 4, 1, '2024-03-17 13:15:40', '2024-03-17 13:15:40', 0);
INSERT INTO `acms_comments` VALUES (26, '请问示例代码中Redis连接池应该如何配置？', 1, 5, 0, 1, '2024-03-18 08:40:12', '2024-03-18 08:40:12', 0);
INSERT INTO `acms_comments` VALUES (27, '建议使用HikariCP配置，文档第5章有详细说明', 1, 5, 6, 1, '2024-03-18 09:05:30', '2024-03-18 09:05:30', 0);
INSERT INTO `acms_comments` VALUES (29, '关于微服务拆分粒度，我认为应该根据团队规模决定', 107, 6, 0, 1, '2024-03-20 15:33:28', '2024-03-20 15:33:28', 0);
INSERT INTO `acms_comments` VALUES (30, '我们团队50人采用中等粒度（10-15服务）运行良好', 1, 16, 2, 1, '2024-03-21 16:44:50', '2024-03-21 16:44:50', 0);

-- ----------------------------
-- Table structure for acms_tags
-- ----------------------------
DROP TABLE IF EXISTS `acms_tags`;
CREATE TABLE `acms_tags`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签别名',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签描述',
  `count` int(0) NOT NULL DEFAULT 0 COMMENT '文章数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0隐藏 1显示',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序值',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_tags
-- ----------------------------
INSERT INTO `acms_tags` VALUES (1, 'PHP', 'php', NULL, 0, 1, 0, '2025-04-16 18:38:31', '2025-04-16 18:38:31');
INSERT INTO `acms_tags` VALUES (2, 'WebMan', 'webman', NULL, 0, 1, 0, '2025-04-16 18:38:31', '2025-04-16 18:38:31');
INSERT INTO `acms_tags` VALUES (3, 'Laravel', 'laravel', NULL, 0, 1, 0, '2025-04-16 18:38:31', '2025-04-16 18:38:31');

-- ----------------------------
-- Table structure for acms_user_histories
-- ----------------------------
DROP TABLE IF EXISTS `acms_user_histories`;
CREATE TABLE `acms_user_histories`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID',
  `article_id` int(0) UNSIGNED NOT NULL COMMENT '文章ID',
  `view_count` int(0) NOT NULL DEFAULT 1 COMMENT '浏览次数',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '最后浏览时间',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_article`(`user_id`, `article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户浏览历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_user_histories
-- ----------------------------
INSERT INTO `acms_user_histories` VALUES (21, 1, 1, 1, '2025-05-09 16:23:35', '2025-05-09 16:23:35');
INSERT INTO `acms_user_histories` VALUES (22, 1, 16, 1, '2025-05-09 16:29:22', '2025-05-09 16:29:22');

-- ----------------------------
-- Table structure for acms_user_likes
-- ----------------------------
DROP TABLE IF EXISTS `acms_user_likes`;
CREATE TABLE `acms_user_likes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID',
  `article_id` int(0) UNSIGNED NOT NULL COMMENT '文章ID',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_article`(`user_id`, `article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acms_user_likes
-- ----------------------------
INSERT INTO `acms_user_likes` VALUES (21, 1, 1, '2025-05-09 16:24:04', '2025-05-09 16:24:04');
INSERT INTO `acms_user_likes` VALUES (22, 1, 16, '2025-05-09 16:29:24', '2025-05-09 16:29:24');

-- ----------------------------
-- Table structure for feedback_attachments
-- ----------------------------
DROP TABLE IF EXISTS `feedback_attachments`;
CREATE TABLE `feedback_attachments`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `feedback_id` int(0) UNSIGNED NOT NULL COMMENT '反馈ID（关联feedback_main.id）',
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID（关联wa_users.id）',
  `file_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件存储路径',
  `file_type` enum('image','video','log','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `file_size` int(0) UNSIGNED NOT NULL COMMENT '文件大小（字节）',
  `created_at` datetime(0) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `feedback_id`(`feedback_id`) USING BTREE,
  INDEX `file_type`(`file_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_attachments
-- ----------------------------
INSERT INTO `feedback_attachments` VALUES (1, 1, 1, 1, 'uploads/2024/06/01/screenshot1.png', 'image', 123456, '2024-06-01 10:05:00');
INSERT INTO `feedback_attachments` VALUES (2, 1, 2, 2, 'uploads/2024/06/01/screenshot2.jpg', 'image', 234567, '2024-06-01 11:05:00');
INSERT INTO `feedback_attachments` VALUES (3, 1, 3, 3, 'uploads/2024/06/01/log1.txt', 'log', 34567, '2024-06-01 12:05:00');
INSERT INTO `feedback_attachments` VALUES (4, 1, 4, 4, 'uploads/2024/06/01/video1.mp4', 'video', 4567890, '2024-06-01 13:05:00');
INSERT INTO `feedback_attachments` VALUES (5, 1, 5, 5, 'uploads/2024/06/01/other1.zip', 'other', 56789, '2024-06-01 14:05:00');
INSERT INTO `feedback_attachments` VALUES (6, 1, 6, 6, 'uploads/2024/06/01/screenshot3.png', 'image', 67890, '2024-06-01 15:05:00');
INSERT INTO `feedback_attachments` VALUES (7, 1, 7, 7, 'uploads/2024/06/01/log2.txt', 'log', 78901, '2024-06-01 16:05:00');
INSERT INTO `feedback_attachments` VALUES (8, 1, 8, 8, 'uploads/2024/06/01/video2.mp4', 'video', 890123, '2024-06-01 17:05:00');
INSERT INTO `feedback_attachments` VALUES (9, 1, 9, 9, 'uploads/2024/06/01/other2.zip', 'other', 90123, '2024-06-01 18:05:00');
INSERT INTO `feedback_attachments` VALUES (10, 1, 10, 10, 'uploads/2024/06/01/screenshot4.png', 'image', 101234, '2024-06-01 19:05:00');
INSERT INTO `feedback_attachments` VALUES (11, 2, 11, 1, 'uploads/2024/06/02/p2-1.png', 'image', 112345, '2024-06-02 10:05:00');
INSERT INTO `feedback_attachments` VALUES (12, 2, 12, 2, 'uploads/2024/06/02/p2-2.jpg', 'image', 122345, '2024-06-02 11:05:00');
INSERT INTO `feedback_attachments` VALUES (13, 2, 13, 3, 'uploads/2024/06/02/p2-3.txt', 'log', 132345, '2024-06-02 12:05:00');
INSERT INTO `feedback_attachments` VALUES (14, 2, 14, 4, 'uploads/2024/06/02/p2-4.mp4', 'video', 142345, '2024-06-02 13:05:00');
INSERT INTO `feedback_attachments` VALUES (15, 2, 15, 5, 'uploads/2024/06/02/p2-5.zip', 'other', 152345, '2024-06-02 14:05:00');
INSERT INTO `feedback_attachments` VALUES (16, 2, 16, 6, 'uploads/2024/06/02/p2-6.png', 'image', 162345, '2024-06-02 15:05:00');
INSERT INTO `feedback_attachments` VALUES (17, 2, 17, 7, 'uploads/2024/06/02/p2-7.txt', 'log', 172345, '2024-06-02 16:05:00');
INSERT INTO `feedback_attachments` VALUES (18, 2, 18, 8, 'uploads/2024/06/02/p2-8.mp4', 'video', 182345, '2024-06-02 17:05:00');
INSERT INTO `feedback_attachments` VALUES (19, 2, 19, 9, 'uploads/2024/06/02/p2-9.zip', 'other', 192345, '2024-06-02 18:05:00');
INSERT INTO `feedback_attachments` VALUES (20, 2, 20, 10, 'uploads/2024/06/02/p2-10.png', 'image', 202345, '2024-06-02 19:05:00');

-- ----------------------------
-- Table structure for feedback_categories
-- ----------------------------
DROP TABLE IF EXISTS `feedback_categories`;
CREATE TABLE `feedback_categories`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类描述',
  `parent_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '父级分类ID',
  `sort_order` int(0) NOT NULL DEFAULT 0 COMMENT '排序权重',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_categories
-- ----------------------------
INSERT INTO `feedback_categories` VALUES (1, 1, '功能建议', '产品功能建议', NULL, 1);
INSERT INTO `feedback_categories` VALUES (2, 1, 'BUG反馈', '系统缺陷', NULL, 2);
INSERT INTO `feedback_categories` VALUES (3, 1, '体验问题', '用户体验相关', NULL, 3);
INSERT INTO `feedback_categories` VALUES (4, 1, '界面问题', 'UI相关', NULL, 4);
INSERT INTO `feedback_categories` VALUES (5, 1, '性能问题', '性能瓶颈', NULL, 5);
INSERT INTO `feedback_categories` VALUES (6, 1, '支付问题', '支付相关', NULL, 6);
INSERT INTO `feedback_categories` VALUES (7, 1, '账户问题', '账户异常', NULL, 7);
INSERT INTO `feedback_categories` VALUES (8, 1, 'API问题', '接口异常', NULL, 8);
INSERT INTO `feedback_categories` VALUES (9, 1, '移动端问题', '移动端相关', NULL, 9);
INSERT INTO `feedback_categories` VALUES (10, 1, '数据问题', '数据异常', NULL, 10);
INSERT INTO `feedback_categories` VALUES (11, 2, 'P2-功能建议', '产品2功能建议', NULL, 1);
INSERT INTO `feedback_categories` VALUES (12, 2, 'P2-BUG反馈', '产品2缺陷', NULL, 2);
INSERT INTO `feedback_categories` VALUES (13, 2, 'P2-体验问题', '产品2体验', NULL, 3);
INSERT INTO `feedback_categories` VALUES (14, 2, 'P2-界面问题', '产品2UI', NULL, 4);
INSERT INTO `feedback_categories` VALUES (15, 2, 'P2-性能问题', '产品2性能', NULL, 5);
INSERT INTO `feedback_categories` VALUES (16, 2, 'P2-支付问题', '产品2支付', NULL, 6);
INSERT INTO `feedback_categories` VALUES (17, 2, 'P2-账户问题', '产品2账户', NULL, 7);
INSERT INTO `feedback_categories` VALUES (18, 2, 'P2-API问题', '产品2接口', NULL, 8);
INSERT INTO `feedback_categories` VALUES (19, 2, 'P2-移动端问题', '产品2移动端', NULL, 9);
INSERT INTO `feedback_categories` VALUES (20, 2, 'P2-数据问题', '产品2数据', NULL, 10);

-- ----------------------------
-- Table structure for feedback_comments
-- ----------------------------
DROP TABLE IF EXISTS `feedback_comments`;
CREATE TABLE `feedback_comments`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `feedback_id` int(0) UNSIGNED NOT NULL COMMENT '反馈ID（关联feedback_main.id）',
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID（关联wa_users.id）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `is_internal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否内部备注（0-用户可见 1-仅管理员可见）',
  `parent_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '父评论ID',
  `created_at` datetime(0) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `feedback_id`(`feedback_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_comments
-- ----------------------------
INSERT INTO `feedback_comments` VALUES (1, 1, 1, 1, '补充：仅在Chrome下复现', 0, NULL, '2024-06-01 10:10:00');
INSERT INTO `feedback_comments` VALUES (2, 1, 2, 2, '已收到，正在排查', 0, NULL, '2024-06-01 11:10:00');
INSERT INTO `feedback_comments` VALUES (3, 1, 3, 3, '建议已记录', 0, NULL, '2024-06-01 12:10:00');
INSERT INTO `feedback_comments` VALUES (4, 1, 4, 4, '菜单错位已修复', 0, NULL, '2024-06-01 13:10:00');
INSERT INTO `feedback_comments` VALUES (5, 1, 5, 5, '登录问题已解决', 0, NULL, '2024-06-01 14:10:00');
INSERT INTO `feedback_comments` VALUES (6, 1, 6, 6, 'API问题已反馈开发', 0, NULL, '2024-06-01 15:10:00');
INSERT INTO `feedback_comments` VALUES (7, 1, 7, 7, '排序问题已优化', 0, NULL, '2024-06-01 16:10:00');
INSERT INTO `feedback_comments` VALUES (8, 1, 8, 8, '视频上传格式已支持', 0, NULL, '2024-06-01 17:10:00');
INSERT INTO `feedback_comments` VALUES (9, 1, 9, 9, '邮件延迟为服务商问题', 0, NULL, '2024-06-01 18:10:00');
INSERT INTO `feedback_comments` VALUES (10, 1, 10, 10, '表格滚动已适配', 0, NULL, '2024-06-01 19:10:00');
INSERT INTO `feedback_comments` VALUES (11, 2, 11, 1, 'P2-反馈1评论', 0, NULL, '2024-06-02 10:10:00');
INSERT INTO `feedback_comments` VALUES (12, 2, 12, 2, 'P2-反馈2评论', 0, NULL, '2024-06-02 11:10:00');
INSERT INTO `feedback_comments` VALUES (13, 2, 13, 3, 'P2-反馈3评论', 0, NULL, '2024-06-02 12:10:00');
INSERT INTO `feedback_comments` VALUES (14, 2, 14, 4, 'P2-反馈4评论', 0, NULL, '2024-06-02 13:10:00');
INSERT INTO `feedback_comments` VALUES (15, 2, 15, 5, 'P2-反馈5评论', 0, NULL, '2024-06-02 14:10:00');
INSERT INTO `feedback_comments` VALUES (16, 2, 16, 6, 'P2-反馈6评论', 0, NULL, '2024-06-02 15:10:00');
INSERT INTO `feedback_comments` VALUES (17, 2, 17, 7, 'P2-反馈7评论', 0, NULL, '2024-06-02 16:10:00');
INSERT INTO `feedback_comments` VALUES (18, 2, 18, 8, 'P2-反馈8评论', 0, NULL, '2024-06-02 17:10:00');
INSERT INTO `feedback_comments` VALUES (19, 2, 19, 9, 'P2-反馈9评论', 0, NULL, '2024-06-02 18:10:00');
INSERT INTO `feedback_comments` VALUES (20, 2, 20, 10, 'P2-反馈10评论', 0, NULL, '2024-06-02 19:10:00');

-- ----------------------------
-- Table structure for feedback_knowledge_base
-- ----------------------------
DROP TABLE IF EXISTS `feedback_knowledge_base`;
CREATE TABLE `feedback_knowledge_base`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `related_categories` json NULL COMMENT '关联分类（JSON数组）',
  `view_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看次数',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_knowledge_base
-- ----------------------------
INSERT INTO `feedback_knowledge_base` VALUES (1, 1, '支付无响应解决方案', '请检查浏览器控制台...', '[1, 6]', 10, '2024-06-01 10:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (2, 1, '数据看板优化', '减少实时查询...', '[5]', 20, '2024-06-01 11:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (3, 1, '移动端适配', 'iOS和Android适配...', '[4, 9]', 30, '2024-06-01 12:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (4, 1, 'API错误码说明', '200:成功 400:参数错...', '[8]', 40, '2024-06-01 13:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (5, 1, '密码重置流程', '点击忘记密码...', '[7]', 50, '2024-06-01 14:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (6, 1, '文件上传格式', '支持PNG/JPG/MP4...', '[2, 6]', 60, '2024-06-01 15:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (7, 1, '有效BUG报告', '包含操作步骤...', '[2]', 70, '2024-06-01 16:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (8, 1, '权限配置', '管理员可访问...', '[7]', 80, '2024-06-01 17:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (9, 1, '表格优化', '响应式布局...', '[4, 9, 1]', 90, '2024-06-01 18:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (10, 1, '邮件故障排查', '检查SMTP配置...', '[7]', 100, '2024-06-01 19:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (11, 2, 'P2-支付无响应', 'P2-请检查...', '[1, 6]', 11, '2024-06-02 10:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (12, 2, 'P2-数据看板优化', 'P2-减少查询...', '[5]', 21, '2024-06-02 11:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (13, 2, 'P2-移动端适配', 'P2-iOS和Android...', '[4, 9]', 31, '2024-06-02 12:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (14, 2, 'P2-API错误码', 'P2-200:成功...', '[8]', 41, '2024-06-02 13:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (15, 2, 'P2-密码重置', 'P2-点击忘记密码...', '[7]', 51, '2024-06-02 14:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (16, 2, 'P2-文件上传', 'P2-支持PNG...', '[2, 6]', 61, '2024-06-02 15:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (17, 2, 'P2-BUG报告', 'P2-包含步骤...', '[2]', 71, '2024-06-02 16:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (18, 2, 'P2-权限配置', 'P2-管理员可访问...', '[7]', 81, '2024-06-02 17:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (19, 2, 'P2-表格优化', 'P2-响应式布局...', '[4, 9, 1]', 91, '2024-06-02 18:30:00', NULL);
INSERT INTO `feedback_knowledge_base` VALUES (20, 2, 'P2-邮件排查', 'P2-检查SMTP...', '[7]', 101, '2024-06-02 19:30:00', NULL);

-- ----------------------------
-- Table structure for feedback_logs
-- ----------------------------
DROP TABLE IF EXISTS `feedback_logs`;
CREATE TABLE `feedback_logs`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `feedback_id` int(0) UNSIGNED NOT NULL COMMENT '反馈ID（关联feedback_main.id）',
  `operator_id` int(0) UNSIGNED NOT NULL COMMENT '操作人ID（关联wa_users.id）',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型（status_change/priority_change等）',
  `old_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原值',
  `new_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新值',
  `created_at` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `feedback_id`(`feedback_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈处理日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feedback_main
-- ----------------------------
DROP TABLE IF EXISTS `feedback_main`;
CREATE TABLE `feedback_main`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID（关联wa_users.id）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈内容',
  `status` enum('pending','processing','resolved','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending' COMMENT '处理状态',
  `type` enum('screenshot','video','text','log') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'text' COMMENT '反馈类型',
  `priority_id` tinyint(0) UNSIGNED NOT NULL COMMENT '优先级ID（关联feedback_priorities.id）',
  `category_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '分类ID（关联feedback_categories.id）',
  `device_info` json NULL COMMENT '设备信息（JSON格式）',
  `page_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面URL',
  `screenshot_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '截图base64数据',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_main
-- ----------------------------
INSERT INTO `feedback_main` VALUES (1, 1, 1, '支付页面按钮无效', '点击支付无反应', 'pending', 'text', 1, 1, '{\"os\": \"Windows\", \"screen\": \"1920x1080\", \"browser\": \"Chrome\"}', '/pay', '', '2024-06-01 10:00:00', NULL);
INSERT INTO `feedback_main` VALUES (2, 1, 2, '数据看板加载慢', '页面加载超过10秒', 'processing', 'screenshot', 2, 2, '{\"os\": \"MacOS\", \"screen\": \"1440x900\", \"browser\": \"Safari\"}', '/dashboard', '', '2024-06-01 11:00:00', NULL);
INSERT INTO `feedback_main` VALUES (3, 1, 3, '建议增加导出功能', '希望支持导出PDF', 'pending', 'text', 3, 3, '{\"os\": \"Windows\", \"screen\": \"1366x768\", \"browser\": \"Edge\"}', '/report', '', '2024-06-01 12:00:00', NULL);
INSERT INTO `feedback_main` VALUES (4, 1, 4, '移动端菜单错位', 'iPhone菜单重叠', 'resolved', 'screenshot', 1, 4, '{\"os\": \"iOS\", \"screen\": \"375x812\", \"browser\": \"Safari\"}', '/mobile', '', '2024-06-01 13:00:00', NULL);
INSERT INTO `feedback_main` VALUES (5, 1, 5, '登录后跳转404', '微信登录后跳转异常', 'closed', 'text', 2, 5, '{\"os\": \"Android\", \"screen\": \"360x780\", \"browser\": \"WeChat\"}', '/login', '', '2024-06-01 14:00:00', NULL);
INSERT INTO `feedback_main` VALUES (6, 1, 6, 'API返回错误', '接口返回null', 'processing', 'log', 3, 6, '{\"os\": \"Linux\", \"screen\": \"N/A\", \"browser\": \"Postman\"}', '/api', '', '2024-06-01 15:00:00', NULL);
INSERT INTO `feedback_main` VALUES (7, 1, 7, '订单排序问题', '按时间排序不正确', 'pending', 'text', 1, 7, '{\"os\": \"Windows\", \"screen\": \"1920x1080\", \"browser\": \"Chrome\"}', '/order', '', '2024-06-01 16:00:00', NULL);
INSERT INTO `feedback_main` VALUES (8, 1, 8, '视频上传失败', 'MP4上传提示不支持', 'processing', 'video', 2, 8, '{\"os\": \"MacOS\", \"screen\": \"1680x1050\", \"browser\": \"Chrome\"}', '/upload', '', '2024-06-01 17:00:00', NULL);
INSERT INTO `feedback_main` VALUES (9, 1, 9, '密码重置邮件延迟', '邮件1小时才收到', 'resolved', 'text', 3, 9, '{\"os\": \"Windows\", \"screen\": \"1366x768\", \"browser\": \"Chrome\"}', '/reset', '', '2024-06-01 18:00:00', NULL);
INSERT INTO `feedback_main` VALUES (10, 1, 10, '表格无法横向滚动', '手机端表格溢出', 'pending', 'screenshot', 1, 10, '{\"os\": \"Android\", \"screen\": \"412x915\", \"browser\": \"Chrome\"}', '/table', '', '2024-06-01 19:00:00', NULL);
INSERT INTO `feedback_main` VALUES (11, 2, 1, '产品2-反馈1', '内容1', 'pending', 'text', 1, 1, '{\"os\": \"Windows\"}', '/p2-1', '', '2024-06-02 10:00:00', NULL);
INSERT INTO `feedback_main` VALUES (12, 2, 2, '产品2-反馈2', '内容2', 'pending', 'text', 2, 2, '{\"os\": \"MacOS\"}', '/p2-2', '', '2024-06-02 11:00:00', NULL);
INSERT INTO `feedback_main` VALUES (13, 2, 3, '产品2-反馈3', '内容3', 'pending', 'text', 3, 3, '{\"os\": \"Linux\"}', '/p2-3', '', '2024-06-02 12:00:00', NULL);
INSERT INTO `feedback_main` VALUES (14, 2, 4, '产品2-反馈4', '内容4', 'pending', 'text', 1, 4, '{\"os\": \"iOS\"}', '/p2-4', '', '2024-06-02 13:00:00', NULL);
INSERT INTO `feedback_main` VALUES (15, 2, 5, '产品2-反馈5', '内容5', 'pending', 'text', 2, 5, '{\"os\": \"Android\"}', '/p2-5', '', '2024-06-02 14:00:00', NULL);
INSERT INTO `feedback_main` VALUES (16, 2, 6, '产品2-反馈6', '内容6', 'pending', 'text', 3, 6, '{\"os\": \"Windows\"}', '/p2-6', '', '2024-06-02 15:00:00', NULL);
INSERT INTO `feedback_main` VALUES (17, 2, 7, '产品2-反馈7', '内容7', 'pending', 'text', 1, 7, '{\"os\": \"MacOS\"}', '/p2-7', '', '2024-06-02 16:00:00', NULL);
INSERT INTO `feedback_main` VALUES (18, 2, 8, '产品2-反馈8', '内容8', 'pending', 'text', 2, 8, '{\"os\": \"Linux\"}', '/p2-8', '', '2024-06-02 17:00:00', NULL);
INSERT INTO `feedback_main` VALUES (19, 2, 9, '产品2-反馈9', '内容9', 'pending', 'text', 3, 9, '{\"os\": \"iOS\"}', '/p2-9', '', '2024-06-02 18:00:00', NULL);
INSERT INTO `feedback_main` VALUES (20, 2, 10, '产品2-反馈10', '内容10', 'pending', 'text', 1, 10, '{\"os\": \"Android\"}', '/p2-10', '', '2024-06-02 19:00:00', NULL);

-- ----------------------------
-- Table structure for feedback_notifications
-- ----------------------------
DROP TABLE IF EXISTS `feedback_notifications`;
CREATE TABLE `feedback_notifications`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户ID（关联wa_users.id）',
  `feedback_id` int(0) UNSIGNED NOT NULL COMMENT '反馈ID（关联feedback_main.id）',
  `type` enum('status_update','comment','reminder') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知类型',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知内容',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_notifications
-- ----------------------------
INSERT INTO `feedback_notifications` VALUES (1, 1, 1, 1, 'comment', '您的反馈有新回复', 1, '2024-06-01 10:40:00');
INSERT INTO `feedback_notifications` VALUES (2, 1, 2, 2, 'status_update', '您的问题已开始处理', 1, '2024-06-01 11:40:00');
INSERT INTO `feedback_notifications` VALUES (3, 1, 3, 3, 'reminder', '感谢您的建议', 1, '2024-06-01 12:40:00');
INSERT INTO `feedback_notifications` VALUES (4, 1, 4, 4, 'status_update', '您的问题已解决', 1, '2024-06-01 13:40:00');
INSERT INTO `feedback_notifications` VALUES (5, 1, 5, 5, 'status_update', '您的问题已关闭', 0, '2024-06-01 14:40:00');
INSERT INTO `feedback_notifications` VALUES (6, 1, 6, 6, 'comment', '您的反馈有新回复', 1, '2024-06-01 15:40:00');
INSERT INTO `feedback_notifications` VALUES (7, 1, 7, 7, 'reminder', '有新用户遇到类似问题', 0, '2024-06-01 16:40:00');
INSERT INTO `feedback_notifications` VALUES (8, 1, 8, 8, 'status_update', '您的问题已开始处理', 0, '2024-06-01 17:40:00');
INSERT INTO `feedback_notifications` VALUES (9, 1, 9, 9, 'status_update', '您的问题已解决', 1, '2024-06-01 18:40:00');
INSERT INTO `feedback_notifications` VALUES (10, 1, 10, 10, 'comment', '需要更多信息来复现问题', 0, '2024-06-01 19:40:00');
INSERT INTO `feedback_notifications` VALUES (11, 2, 1, 11, 'comment', 'P2-反馈1新回复', 1, '2024-06-02 10:40:00');
INSERT INTO `feedback_notifications` VALUES (12, 2, 2, 12, 'status_update', 'P2-问题已开始处理', 1, '2024-06-02 11:40:00');
INSERT INTO `feedback_notifications` VALUES (13, 2, 3, 13, 'reminder', 'P2-感谢建议', 1, '2024-06-02 12:40:00');
INSERT INTO `feedback_notifications` VALUES (14, 2, 4, 14, 'status_update', 'P2-问题已解决', 1, '2024-06-02 13:40:00');
INSERT INTO `feedback_notifications` VALUES (15, 2, 5, 15, 'status_update', 'P2-问题已关闭', 0, '2024-06-02 14:40:00');
INSERT INTO `feedback_notifications` VALUES (16, 2, 6, 16, 'comment', 'P2-反馈6新回复', 1, '2024-06-02 15:40:00');
INSERT INTO `feedback_notifications` VALUES (17, 2, 7, 17, 'reminder', 'P2-有新用户遇到类似问题', 0, '2024-06-02 16:40:00');
INSERT INTO `feedback_notifications` VALUES (18, 2, 8, 18, 'status_update', 'P2-问题已开始处理', 0, '2024-06-02 17:40:00');
INSERT INTO `feedback_notifications` VALUES (19, 2, 9, 19, 'status_update', 'P2-问题已解决', 1, '2024-06-02 18:40:00');
INSERT INTO `feedback_notifications` VALUES (20, 2, 10, 20, 'comment', 'P2-需要更多信息', 0, '2024-06-02 19:40:00');

-- ----------------------------
-- Table structure for feedback_priorities
-- ----------------------------
DROP TABLE IF EXISTS `feedback_priorities`;
CREATE TABLE `feedback_priorities`  (
  `id` tinyint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优先级ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优先级名称',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示颜色',
  `sort_order` tinyint(0) NOT NULL DEFAULT 0 COMMENT '排序权重',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单优先级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_priorities
-- ----------------------------
INSERT INTO `feedback_priorities` VALUES (1, 1, '紧急', '#FF0000', 1);
INSERT INTO `feedback_priorities` VALUES (2, 1, '高', '#FF9900', 2);
INSERT INTO `feedback_priorities` VALUES (3, 1, '中', '#0099FF', 3);
INSERT INTO `feedback_priorities` VALUES (4, 1, '低', '#999999', 4);
INSERT INTO `feedback_priorities` VALUES (5, 1, '建议', '#66CC00', 5);
INSERT INTO `feedback_priorities` VALUES (6, 1, '待定', '#CCCCCC', 6);
INSERT INTO `feedback_priorities` VALUES (7, 1, '需复现', '#9966CC', 7);
INSERT INTO `feedback_priorities` VALUES (8, 1, '已排期', '#33CCCC', 8);
INSERT INTO `feedback_priorities` VALUES (9, 1, '长期优化', '#FFCC00', 9);
INSERT INTO `feedback_priorities` VALUES (10, 1, '忽略', '#666666', 10);
INSERT INTO `feedback_priorities` VALUES (11, 2, 'P2-紧急', '#FF0000', 1);
INSERT INTO `feedback_priorities` VALUES (12, 2, 'P2-高', '#FF9900', 2);
INSERT INTO `feedback_priorities` VALUES (13, 2, 'P2-中', '#0099FF', 3);
INSERT INTO `feedback_priorities` VALUES (14, 2, 'P2-低', '#999999', 4);
INSERT INTO `feedback_priorities` VALUES (15, 2, 'P2-建议', '#66CC00', 5);
INSERT INTO `feedback_priorities` VALUES (16, 2, 'P2-待定', '#CCCCCC', 6);
INSERT INTO `feedback_priorities` VALUES (17, 2, 'P2-需复现', '#9966CC', 7);
INSERT INTO `feedback_priorities` VALUES (18, 2, 'P2-已排期', '#33CCCC', 8);
INSERT INTO `feedback_priorities` VALUES (19, 2, 'P2-长期优化', '#FFCC00', 9);
INSERT INTO `feedback_priorities` VALUES (20, 2, 'P2-忽略', '#666666', 10);

-- ----------------------------
-- Table structure for feedback_products
-- ----------------------------
DROP TABLE IF EXISTS `feedback_products`;
CREATE TABLE `feedback_products`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品描述',
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '反馈产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_products
-- ----------------------------
INSERT INTO `feedback_products` VALUES (1, '主站', '主站产品', '2025-05-03 14:21:53');
INSERT INTO `feedback_products` VALUES (2, '移动端App', '移动端应用', '2025-05-03 14:21:53');
INSERT INTO `feedback_products` VALUES (3, '管理后台', '后台管理系统', '2025-05-03 14:21:53');
INSERT INTO `feedback_products` VALUES (4, '开放平台', 'API开放平台', '2025-05-03 14:21:53');
INSERT INTO `feedback_products` VALUES (5, '其它', '其它产品', '2025-05-03 14:21:53');

-- ----------------------------
-- Table structure for feedback_tag_relations
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tag_relations`;
CREATE TABLE `feedback_tag_relations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `feedback_id` int(0) UNSIGNED NOT NULL COMMENT '反馈ID（关联feedback_main.id）',
  `tag_id` int(0) UNSIGNED NOT NULL COMMENT '标签ID（关联feedback_tags.id）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `feedback_tag`(`feedback_id`, `tag_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_tag_relations
-- ----------------------------
INSERT INTO `feedback_tag_relations` VALUES (1, 1, 1, 1);
INSERT INTO `feedback_tag_relations` VALUES (2, 1, 2, 2);
INSERT INTO `feedback_tag_relations` VALUES (3, 1, 3, 3);
INSERT INTO `feedback_tag_relations` VALUES (4, 1, 4, 4);
INSERT INTO `feedback_tag_relations` VALUES (5, 1, 5, 5);
INSERT INTO `feedback_tag_relations` VALUES (6, 1, 6, 6);
INSERT INTO `feedback_tag_relations` VALUES (7, 1, 7, 7);
INSERT INTO `feedback_tag_relations` VALUES (8, 1, 8, 8);
INSERT INTO `feedback_tag_relations` VALUES (9, 1, 9, 9);
INSERT INTO `feedback_tag_relations` VALUES (10, 1, 10, 10);
INSERT INTO `feedback_tag_relations` VALUES (11, 2, 11, 11);
INSERT INTO `feedback_tag_relations` VALUES (12, 2, 12, 12);
INSERT INTO `feedback_tag_relations` VALUES (13, 2, 13, 13);
INSERT INTO `feedback_tag_relations` VALUES (14, 2, 14, 14);
INSERT INTO `feedback_tag_relations` VALUES (15, 2, 15, 15);
INSERT INTO `feedback_tag_relations` VALUES (16, 2, 16, 16);
INSERT INTO `feedback_tag_relations` VALUES (17, 2, 17, 17);
INSERT INTO `feedback_tag_relations` VALUES (18, 2, 18, 18);
INSERT INTO `feedback_tag_relations` VALUES (19, 2, 19, 19);
INSERT INTO `feedback_tag_relations` VALUES (20, 2, 20, 20);

-- ----------------------------
-- Table structure for feedback_tags
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tags`;
CREATE TABLE `feedback_tags`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签颜色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_tags
-- ----------------------------
INSERT INTO `feedback_tags` VALUES (1, 1, '高频问题', '#FF6666');
INSERT INTO `feedback_tags` VALUES (2, 1, '新手引导', '#66CCFF');
INSERT INTO `feedback_tags` VALUES (3, 1, '支付流程', '#99CC00');
INSERT INTO `feedback_tags` VALUES (4, 1, '移动端', '#FF9966');
INSERT INTO `feedback_tags` VALUES (5, 1, '数据看板', '#9966CC');
INSERT INTO `feedback_tags` VALUES (6, 1, 'APIv2', '#33CC99');
INSERT INTO `feedback_tags` VALUES (7, 1, '权限问题', '#FF6666');
INSERT INTO `feedback_tags` VALUES (8, 1, 'UI不一致', '#FFCC00');
INSERT INTO `feedback_tags` VALUES (9, 1, '性能瓶颈', '#FF3333');
INSERT INTO `feedback_tags` VALUES (10, 1, '安全相关', '#FF0000');
INSERT INTO `feedback_tags` VALUES (11, 2, 'P2-高频问题', '#FF6666');
INSERT INTO `feedback_tags` VALUES (12, 2, 'P2-新手引导', '#66CCFF');
INSERT INTO `feedback_tags` VALUES (13, 2, 'P2-支付流程', '#99CC00');
INSERT INTO `feedback_tags` VALUES (14, 2, 'P2-移动端', '#FF9966');
INSERT INTO `feedback_tags` VALUES (15, 2, 'P2-数据看板', '#9966CC');
INSERT INTO `feedback_tags` VALUES (16, 2, 'P2-APIv2', '#33CC99');
INSERT INTO `feedback_tags` VALUES (17, 2, 'P2-权限问题', '#FF6666');
INSERT INTO `feedback_tags` VALUES (18, 2, 'P2-UI不一致', '#FFCC00');
INSERT INTO `feedback_tags` VALUES (19, 2, 'P2-性能瓶颈', '#FF3333');
INSERT INTO `feedback_tags` VALUES (20, 2, 'P2-安全相关', '#FF0000');

-- ----------------------------
-- Table structure for feedback_workflows
-- ----------------------------
DROP TABLE IF EXISTS `feedback_workflows`;
CREATE TABLE `feedback_workflows`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工作流ID',
  `product_id` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作流名称',
  `conditions` json NOT NULL COMMENT '触发条件（JSON格式）',
  `actions` json NOT NULL COMMENT '执行动作（JSON格式）',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈工作流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback_workflows
-- ----------------------------
INSERT INTO `feedback_workflows` VALUES (1, 1, '支付问题自动升级', '{\"category\": 6, \"priority\": 1}', '{\"notify\": [\"email\"], \"assign_to\": 5}', 1, '2024-06-01 10:50:00');
INSERT INTO `feedback_workflows` VALUES (2, 1, 'VIP优先处理', '{\"user_level\": 3}', '{\"priority\": 2}', 1, '2024-06-01 11:50:00');
INSERT INTO `feedback_workflows` VALUES (3, 1, '移动端问题分类', '{\"device_info.os\": [\"iOS\", \"Android\"]}', '{\"category\": 9}', 1, '2024-06-01 12:50:00');
INSERT INTO `feedback_workflows` VALUES (4, 1, '重复问题关联', '{\"similarity\": 0.8}', '{\"link_to_existing\": true}', 1, '2024-06-01 13:50:00');
INSERT INTO `feedback_workflows` VALUES (5, 1, '安全相关问题', '{\"tags\": [10]}', '{\"notify\": [\"security_team\"], \"priority\": 1}', 1, '2024-06-01 14:50:00');
INSERT INTO `feedback_workflows` VALUES (6, 1, '新用户引导', '{\"user_score\": 0}', '{\"tags\": [2], \"assign_to\": 2}', 1, '2024-06-01 15:50:00');
INSERT INTO `feedback_workflows` VALUES (7, 1, '性能问题警报', '{\"keywords\": [\"慢\", \"卡顿\"]}', '{\"category\": 5, \"priority\": 2}', 1, '2024-06-01 16:50:00');
INSERT INTO `feedback_workflows` VALUES (8, 1, '外部集成问题', '{\"category\": 8}', '{\"assign_to\": 7}', 1, '2024-06-01 17:50:00');
INSERT INTO `feedback_workflows` VALUES (9, 1, '高优先级通知', '{\"priority\": 1}', '{\"notify\": [\"manager\"]}', 1, '2024-06-01 18:50:00');
INSERT INTO `feedback_workflows` VALUES (10, 1, '已解决归档', '{\"days\": 7, \"status\": \"resolved\"}', '{\"archive\": true}', 1, '2024-06-01 19:50:00');
INSERT INTO `feedback_workflows` VALUES (11, 2, 'P2-支付升级', '{\"category\": 6, \"priority\": 1}', '{\"notify\": [\"email\"], \"assign_to\": 5}', 1, '2024-06-02 10:50:00');
INSERT INTO `feedback_workflows` VALUES (12, 2, 'P2-VIP优先', '{\"user_level\": 3}', '{\"priority\": 2}', 1, '2024-06-02 11:50:00');
INSERT INTO `feedback_workflows` VALUES (13, 2, 'P2-移动端分类', '{\"device_info.os\": [\"iOS\", \"Android\"]}', '{\"category\": 9}', 1, '2024-06-02 12:50:00');
INSERT INTO `feedback_workflows` VALUES (14, 2, 'P2-重复关联', '{\"similarity\": 0.8}', '{\"link_to_existing\": true}', 1, '2024-06-02 13:50:00');
INSERT INTO `feedback_workflows` VALUES (15, 2, 'P2-安全问题', '{\"tags\": [20]}', '{\"notify\": [\"security_team\"], \"priority\": 1}', 1, '2024-06-02 14:50:00');
INSERT INTO `feedback_workflows` VALUES (16, 2, 'P2-新用户引导', '{\"user_score\": 0}', '{\"tags\": [12], \"assign_to\": 2}', 1, '2024-06-02 15:50:00');
INSERT INTO `feedback_workflows` VALUES (17, 2, 'P2-性能警报', '{\"keywords\": [\"慢\", \"卡顿\"]}', '{\"category\": 15, \"priority\": 2}', 1, '2024-06-02 16:50:00');
INSERT INTO `feedback_workflows` VALUES (18, 2, 'P2-外部集成', '{\"category\": 18}', '{\"assign_to\": 17}', 1, '2024-06-02 17:50:00');
INSERT INTO `feedback_workflows` VALUES (19, 2, 'P2-高优先级通知', '{\"priority\": 11}', '{\"notify\": [\"manager\"]}', 1, '2024-06-02 18:50:00');
INSERT INTO `feedback_workflows` VALUES (20, 2, 'P2-已解决归档', '{\"days\": 7, \"status\": \"resolved\"}', '{\"archive\": true}', 1, '2024-06-02 19:50:00');

-- ----------------------------
-- Table structure for wa_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_admin_roles`;
CREATE TABLE `wa_admin_roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `admin_id` int(0) NOT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_admin_id`(`role_id`, `admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_admin_roles
-- ----------------------------
INSERT INTO `wa_admin_roles` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for wa_admins
-- ----------------------------
DROP TABLE IF EXISTS `wa_admins`;
CREATE TABLE `wa_admins`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/app/admin/avatar.png' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `login_at` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_admins
-- ----------------------------
INSERT INTO `wa_admins` VALUES (1, 'zhezhebie', '超级管理员', '$2y$10$24OIlLZwGVFypy4Cc62m2.Wk4p1fBZ8/2rmc0SZeLcrK4Rk7SJQkG', '/app/admin/avatar.png', NULL, NULL, '2025-04-16 17:30:29', '2025-05-09 16:40:33', '2025-05-09 16:40:33', NULL);

-- ----------------------------
-- Table structure for wa_options
-- ----------------------------
DROP TABLE IF EXISTS `wa_options`;
CREATE TABLE `wa_options`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `created_at` datetime(0) NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_options
-- ----------------------------
INSERT INTO `wa_options` VALUES (1, 'system_config', '{\"logo\":{\"title\":\"Webman Admin\",\"image\":\"\\/app\\/admin\\/admin\\/images\\/logo.png\"},\"menu\":{\"data\":\"\\/app\\/admin\\/rule\\/get\",\"method\":\"GET\",\"accordion\":true,\"collapse\":false,\"control\":false,\"controlWidth\":500,\"select\":\"0\",\"async\":true},\"tab\":{\"enable\":true,\"keepState\":true,\"preload\":false,\"session\":true,\"max\":\"30\",\"index\":{\"id\":\"0\",\"href\":\"\\/app\\/admin\\/index\\/dashboard\",\"title\":\"\\u4eea\\u8868\\u76d8\"}},\"theme\":{\"defaultColor\":\"2\",\"defaultMenu\":\"light-theme\",\"defaultHeader\":\"light-theme\",\"allowCustom\":true,\"banner\":false},\"colors\":[{\"id\":\"1\",\"color\":\"#36b368\",\"second\":\"#f0f9eb\"},{\"id\":\"2\",\"color\":\"#2d8cf0\",\"second\":\"#ecf5ff\"},{\"id\":\"3\",\"color\":\"#f6ad55\",\"second\":\"#fdf6ec\"},{\"id\":\"4\",\"color\":\"#f56c6c\",\"second\":\"#fef0f0\"},{\"id\":\"5\",\"color\":\"#3963bc\",\"second\":\"#ecf5ff\"}],\"other\":{\"keepLoad\":\"500\",\"autoHead\":false,\"footer\":false},\"header\":{\"message\":false}}', '2022-12-05 14:49:01', '2022-12-08 20:20:28');
INSERT INTO `wa_options` VALUES (2, 'table_form_schema_wa_users', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"4\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"5\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"6\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"7\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"level\":{\"field\":\"level\",\"_field_id\":\"8\",\"comment\":\"等级\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birthday\":{\"field\":\"birthday\",\"_field_id\":\"9\",\"comment\":\"生日\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"money\":{\"field\":\"money\",\"_field_id\":\"10\",\"comment\":\"余额(元)\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"11\",\"comment\":\"积分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"last_time\":{\"field\":\"last_time\",\"_field_id\":\"12\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"last_ip\":{\"field\":\"last_ip\",\"_field_id\":\"13\",\"comment\":\"登录ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"join_time\":{\"field\":\"join_time\",\"_field_id\":\"14\",\"comment\":\"注册时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"join_ip\":{\"field\":\"join_ip\",\"_field_id\":\"15\",\"comment\":\"注册ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"16\",\"comment\":\"token\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"17\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"18\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"role\":{\"field\":\"role\",\"_field_id\":\"19\",\"comment\":\"角色\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"20\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:28:13');
INSERT INTO `wa_options` VALUES (3, 'table_form_schema_wa_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"角色组\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"rules\":{\"field\":\"rules\",\"_field_id\":\"2\",\"comment\":\"权限\",\"control\":\"treeSelectMulti\",\"control_args\":\"url:\\/app\\/admin\\/rule\\/get?type=0,1,2\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"5\",\"comment\":\"父级\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/role\\/select?format=tree\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-19 14:24:25');
INSERT INTO `wa_options` VALUES (4, 'table_form_schema_wa_rules', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"title\":{\"field\":\"title\",\"_field_id\":\"1\",\"comment\":\"标题\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"icon\":{\"field\":\"icon\",\"_field_id\":\"2\",\"comment\":\"图标\",\"control\":\"iconPicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"key\":{\"field\":\"key\",\"_field_id\":\"3\",\"comment\":\"标识\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"4\",\"comment\":\"上级菜单\",\"control\":\"treeSelect\",\"control_args\":\"\\/app\\/admin\\/rule\\/select?format=tree&type=0,1\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"href\":{\"field\":\"href\",\"_field_id\":\"7\",\"comment\":\"url\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"8\",\"comment\":\"类型\",\"control\":\"select\",\"control_args\":\"data:0:目录,1:菜单,2:权限\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"9\",\"comment\":\"排序\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:44:45');
INSERT INTO `wa_options` VALUES (5, 'table_form_schema_wa_admins', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"4\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"5\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"7\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"8\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"login_at\":{\"field\":\"login_at\",\"_field_id\":\"9\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"between\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"10\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:36:48');
INSERT INTO `wa_options` VALUES (6, 'table_form_schema_wa_options', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"键\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"value\":{\"field\":\"value\",\"_field_id\":\"2\",\"comment\":\"值\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:36:57');
INSERT INTO `wa_options` VALUES (7, 'table_form_schema_wa_uploads', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:47:45');
INSERT INTO `wa_options` VALUES (8, 'dict_upload', '[{\"value\":\"1\",\"name\":\"分类1\"},{\"value\":\"2\",\"name\":\"分类2\"},{\"value\":\"3\",\"name\":\"分类3\"}]', '2022-12-04 16:24:13', '2022-12-04 16:24:13');
INSERT INTO `wa_options` VALUES (9, 'dict_sex', '[{\"value\":\"0\",\"name\":\"女\"},{\"value\":\"1\",\"name\":\"男\"}]', '2022-12-04 15:04:40', '2022-12-04 15:04:40');
INSERT INTO `wa_options` VALUES (10, 'dict_status', '[{\"value\":\"0\",\"name\":\"正常\"},{\"value\":\"1\",\"name\":\"禁用\"}]', '2022-12-04 15:05:09', '2022-12-04 15:05:09');
INSERT INTO `wa_options` VALUES (11, 'table_form_schema_wa_admin_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"role_id\":{\"field\":\"role_id\",\"_field_id\":\"1\",\"comment\":\"角色id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"2\",\"comment\":\"管理员id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` VALUES (12, 'dict_dict_name', '[{\"value\":\"dict_name\",\"name\":\"字典名称\"},{\"value\":\"status\",\"name\":\"启禁用状态\"},{\"value\":\"sex\",\"name\":\"性别\"},{\"value\":\"upload\",\"name\":\"附件分类\"}]', '2022-08-15 00:00:00', '2022-12-20 19:42:51');

-- ----------------------------
-- Table structure for wa_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_roles`;
CREATE TABLE `wa_roles`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色组',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  `pid` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_roles
-- ----------------------------
INSERT INTO `wa_roles` VALUES (1, '超级管理员', '*', '2022-08-13 16:15:01', '2022-12-23 12:05:07', NULL);

-- ----------------------------
-- Table structure for wa_rules
-- ----------------------------
DROP TABLE IF EXISTS `wa_rules`;
CREATE TABLE `wa_rules`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `pid` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '上级菜单',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL COMMENT '更新时间',
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `type` int(0) NOT NULL DEFAULT 1 COMMENT '类型',
  `weight` int(0) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_rules
-- ----------------------------
INSERT INTO `wa_rules` VALUES (1, '数据库', 'layui-icon-template-1', 'database', 0, '2025-04-16 17:30:09', '2025-04-16 17:30:09', NULL, 0, 1000);
INSERT INTO `wa_rules` VALUES (2, '所有表', NULL, 'plugin\\admin\\app\\controller\\TableController', 1, '2025-04-16 17:30:09', '2025-04-16 17:30:09', '/app/admin/table/index', 1, 800);
INSERT INTO `wa_rules` VALUES (3, '权限管理', 'layui-icon-vercode', 'auth', 0, '2025-04-16 17:30:09', '2025-04-16 17:30:09', NULL, 0, 900);
INSERT INTO `wa_rules` VALUES (4, '账户管理', NULL, 'plugin\\admin\\app\\controller\\AdminController', 3, '2025-04-16 17:30:09', '2025-04-16 17:30:09', '/app/admin/admin/index', 1, 1000);
INSERT INTO `wa_rules` VALUES (5, '角色管理', NULL, 'plugin\\admin\\app\\controller\\RoleController', 3, '2025-04-16 17:30:09', '2025-04-16 17:30:09', '/app/admin/role/index', 1, 900);
INSERT INTO `wa_rules` VALUES (6, '菜单管理', NULL, 'plugin\\admin\\app\\controller\\RuleController', 3, '2025-04-16 17:30:10', '2025-04-16 17:30:10', '/app/admin/rule/index', 1, 800);
INSERT INTO `wa_rules` VALUES (7, '会员管理', 'layui-icon-username', 'user', 0, '2025-04-16 17:30:10', '2025-04-16 17:30:10', NULL, 0, 800);
INSERT INTO `wa_rules` VALUES (8, '用户', NULL, 'plugin\\admin\\app\\controller\\UserController', 7, '2025-04-16 17:30:10', '2025-04-16 17:30:10', '/app/admin/user/index', 1, 800);
INSERT INTO `wa_rules` VALUES (9, '通用设置', 'layui-icon-set', 'common', 0, '2025-04-16 17:30:10', '2025-04-16 17:30:10', NULL, 0, 700);
INSERT INTO `wa_rules` VALUES (10, '个人资料', NULL, 'plugin\\admin\\app\\controller\\AccountController', 9, '2025-04-16 17:30:10', '2025-04-16 17:30:10', '/app/admin/account/index', 1, 800);
INSERT INTO `wa_rules` VALUES (11, '附件管理', NULL, 'plugin\\admin\\app\\controller\\UploadController', 9, '2025-04-16 17:30:10', '2025-04-16 17:30:10', '/app/admin/upload/index', 1, 700);
INSERT INTO `wa_rules` VALUES (12, '字典设置', NULL, 'plugin\\admin\\app\\controller\\DictController', 9, '2025-04-16 17:30:10', '2025-04-16 17:30:10', '/app/admin/dict/index', 1, 600);
INSERT INTO `wa_rules` VALUES (13, '系统设置', NULL, 'plugin\\admin\\app\\controller\\ConfigController', 9, '2025-04-16 17:30:11', '2025-04-16 17:30:11', '/app/admin/config/index', 1, 500);
INSERT INTO `wa_rules` VALUES (14, '插件管理', 'layui-icon-app', 'plugin', 0, '2025-04-16 17:30:11', '2025-04-16 17:30:11', NULL, 0, 600);
INSERT INTO `wa_rules` VALUES (15, '应用插件', NULL, 'plugin\\admin\\app\\controller\\PluginController', 14, '2025-04-16 17:30:11', '2025-04-16 17:30:11', '/app/admin/plugin/index', 1, 800);
INSERT INTO `wa_rules` VALUES (16, '开发辅助', 'layui-icon-fonts-code', 'dev', 0, '2025-04-16 17:30:11', '2025-04-16 17:30:11', NULL, 0, 500);
INSERT INTO `wa_rules` VALUES (17, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController', 16, '2025-04-16 17:30:11', '2025-04-16 17:30:11', '/app/admin/dev/form-build', 1, 800);
INSERT INTO `wa_rules` VALUES (18, '示例页面', 'layui-icon-templeate-1', 'demos', 0, '2025-04-16 17:30:11', '2025-04-16 17:30:11', NULL, 0, 400);
INSERT INTO `wa_rules` VALUES (19, '工作空间', 'layui-icon-console', 'demo1', 18, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '', 0, 0);
INSERT INTO `wa_rules` VALUES (20, '控制后台', 'layui-icon-console', 'demo10', 19, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '/app/admin/demos/console/console1.html', 1, 0);
INSERT INTO `wa_rules` VALUES (21, '数据分析', 'layui-icon-console', 'demo13', 19, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '/app/admin/demos/console/console2.html', 1, 0);
INSERT INTO `wa_rules` VALUES (22, '百度一下', 'layui-icon-console', 'demo14', 19, '2025-04-16 17:30:12', '2025-04-16 17:30:12', 'http://www.baidu.com', 1, 0);
INSERT INTO `wa_rules` VALUES (23, '主题预览', 'layui-icon-console', 'demo15', 19, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '/app/admin/demos/system/theme.html', 1, 0);
INSERT INTO `wa_rules` VALUES (24, '常用组件', 'layui-icon-component', 'demo20', 18, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '', 0, 0);
INSERT INTO `wa_rules` VALUES (25, '功能按钮', 'layui-icon-face-smile', 'demo2011', 24, '2025-04-16 17:30:12', '2025-04-16 17:30:12', '/app/admin/demos/document/button.html', 1, 0);
INSERT INTO `wa_rules` VALUES (26, '表单集合', 'layui-icon-face-cry', 'demo2014', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/form.html', 1, 0);
INSERT INTO `wa_rules` VALUES (27, '字体图标', 'layui-icon-face-cry', 'demo2010', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/icon.html', 1, 0);
INSERT INTO `wa_rules` VALUES (28, '多选下拉', 'layui-icon-face-cry', 'demo2012', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/select.html', 1, 0);
INSERT INTO `wa_rules` VALUES (29, '动态标签', 'layui-icon-face-cry', 'demo2013', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/tag.html', 1, 0);
INSERT INTO `wa_rules` VALUES (30, '数据表格', 'layui-icon-face-cry', 'demo2031', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/table.html', 1, 0);
INSERT INTO `wa_rules` VALUES (31, '分布表单', 'layui-icon-face-cry', 'demo2032', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/step.html', 1, 0);
INSERT INTO `wa_rules` VALUES (32, '树形表格', 'layui-icon-face-cry', 'demo2033', 24, '2025-04-16 17:30:13', '2025-04-16 17:30:13', '/app/admin/demos/document/treetable.html', 1, 0);
INSERT INTO `wa_rules` VALUES (33, '树状结构', 'layui-icon-face-cry', 'demo2034', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/dtree.html', 1, 0);
INSERT INTO `wa_rules` VALUES (34, '文本编辑', 'layui-icon-face-cry', 'demo2035', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/tinymce.html', 1, 0);
INSERT INTO `wa_rules` VALUES (35, '卡片组件', 'layui-icon-face-cry', 'demo2036', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/card.html', 1, 0);
INSERT INTO `wa_rules` VALUES (36, '抽屉组件', 'layui-icon-face-cry', 'demo2021', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/drawer.html', 1, 0);
INSERT INTO `wa_rules` VALUES (37, '消息通知', 'layui-icon-face-cry', 'demo2022', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/notice.html', 1, 0);
INSERT INTO `wa_rules` VALUES (38, '加载组件', 'layui-icon-face-cry', 'demo2024', 24, '2025-04-16 17:30:14', '2025-04-16 17:30:14', '/app/admin/demos/document/loading.html', 1, 0);
INSERT INTO `wa_rules` VALUES (39, '弹层组件', 'layui-icon-face-cry', 'demo2023', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/popup.html', 1, 0);
INSERT INTO `wa_rules` VALUES (40, '多选项卡', 'layui-icon-face-cry', 'demo60131', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/tab.html', 1, 0);
INSERT INTO `wa_rules` VALUES (41, '数据菜单', 'layui-icon-face-cry', 'demo60132', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/menu.html', 1, 0);
INSERT INTO `wa_rules` VALUES (42, '哈希加密', 'layui-icon-face-cry', 'demo2041', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/encrypt.html', 1, 0);
INSERT INTO `wa_rules` VALUES (43, '图标选择', 'layui-icon-face-cry', 'demo2042', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/iconPicker.html', 1, 0);
INSERT INTO `wa_rules` VALUES (44, '省市级联', 'layui-icon-face-cry', 'demo2043', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/area.html', 1, 0);
INSERT INTO `wa_rules` VALUES (45, '数字滚动', 'layui-icon-face-cry', 'demo2044', 24, '2025-04-16 17:30:15', '2025-04-16 17:30:15', '/app/admin/demos/document/count.html', 1, 0);
INSERT INTO `wa_rules` VALUES (46, '顶部返回', 'layui-icon-face-cry', 'demo2045', 24, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '/app/admin/demos/document/topBar.html', 1, 0);
INSERT INTO `wa_rules` VALUES (47, '结果页面', 'layui-icon-auz', 'demo666', 18, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '', 0, 0);
INSERT INTO `wa_rules` VALUES (48, '成功', 'layui-icon-face-smile', 'demo667', 47, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '/app/admin/demos/result/success.html', 1, 0);
INSERT INTO `wa_rules` VALUES (49, '失败', 'layui-icon-face-cry', 'demo668', 47, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '/app/admin/demos/result/error.html', 1, 0);
INSERT INTO `wa_rules` VALUES (50, '错误页面', 'layui-icon-face-cry', 'demo-error', 18, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '', 0, 0);
INSERT INTO `wa_rules` VALUES (51, '403', 'layui-icon-face-smile', 'demo403', 50, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '/app/admin/demos/error/403.html', 1, 0);
INSERT INTO `wa_rules` VALUES (52, '404', 'layui-icon-face-cry', 'demo404', 50, '2025-04-16 17:30:16', '2025-04-16 17:30:16', '/app/admin/demos/error/404.html', 1, 0);
INSERT INTO `wa_rules` VALUES (53, '500', 'layui-icon-face-cry', 'demo500', 50, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '/app/admin/demos/error/500.html', 1, 0);
INSERT INTO `wa_rules` VALUES (54, '系统管理', 'layui-icon-set-fill', 'demo-system', 18, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '', 0, 0);
INSERT INTO `wa_rules` VALUES (55, '用户管理', 'layui-icon-face-smile', 'demo601', 54, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '/app/admin/demos/system/user.html', 1, 0);
INSERT INTO `wa_rules` VALUES (56, '角色管理', 'layui-icon-face-cry', 'demo602', 54, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '/app/admin/demos/system/role.html', 1, 0);
INSERT INTO `wa_rules` VALUES (57, '权限管理', 'layui-icon-face-cry', 'demo603', 54, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '/app/admin/demos/system/power.html', 1, 0);
INSERT INTO `wa_rules` VALUES (58, '部门管理', 'layui-icon-face-cry', 'demo604', 54, '2025-04-16 17:30:17', '2025-04-16 17:30:17', '/app/admin/demos/system/deptment.html', 1, 0);
INSERT INTO `wa_rules` VALUES (59, '行为日志', 'layui-icon-face-cry', 'demo605', 54, '2025-04-16 17:30:18', '2025-04-16 17:30:18', '/app/admin/demos/system/log.html', 1, 0);
INSERT INTO `wa_rules` VALUES (60, '数据字典', 'layui-icon-face-cry', 'demo606', 54, '2025-04-16 17:30:18', '2025-04-16 17:30:18', '/app/admin/demos/system/dict.html', 1, 0);
INSERT INTO `wa_rules` VALUES (61, '常用页面', 'layui-icon-template-1', 'demo-common', 18, '2025-04-16 17:30:18', '2025-04-16 17:30:18', '', 0, 0);
INSERT INTO `wa_rules` VALUES (62, '空白页面', 'layui-icon-face-smile', 'demo702', 61, '2025-04-16 17:30:18', '2025-04-16 17:30:18', '/app/admin/demos/system/space.html', 1, 0);
INSERT INTO `wa_rules` VALUES (63, '查看表', NULL, 'plugin\\admin\\app\\controller\\TableController@view', 2, '2025-04-16 17:30:53', '2025-04-16 17:30:53', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (64, '查询表', NULL, 'plugin\\admin\\app\\controller\\TableController@show', 2, '2025-04-16 17:30:53', '2025-04-16 17:30:53', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (65, '创建表', NULL, 'plugin\\admin\\app\\controller\\TableController@create', 2, '2025-04-16 17:30:53', '2025-04-16 17:30:53', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (66, '修改表', NULL, 'plugin\\admin\\app\\controller\\TableController@modify', 2, '2025-04-16 17:30:53', '2025-04-16 17:30:53', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (67, '一键菜单', NULL, 'plugin\\admin\\app\\controller\\TableController@crud', 2, '2025-04-16 17:30:53', '2025-04-16 17:30:53', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (68, '查询记录', NULL, 'plugin\\admin\\app\\controller\\TableController@select', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (69, '插入记录', NULL, 'plugin\\admin\\app\\controller\\TableController@insert', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (70, '更新记录', NULL, 'plugin\\admin\\app\\controller\\TableController@update', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (71, '删除记录', NULL, 'plugin\\admin\\app\\controller\\TableController@delete', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (72, '删除表', NULL, 'plugin\\admin\\app\\controller\\TableController@drop', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (73, '表摘要', NULL, 'plugin\\admin\\app\\controller\\TableController@schema', 2, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (74, '插入', NULL, 'plugin\\admin\\app\\controller\\AdminController@insert', 4, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (75, '更新', NULL, 'plugin\\admin\\app\\controller\\AdminController@update', 4, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (76, '删除', NULL, 'plugin\\admin\\app\\controller\\AdminController@delete', 4, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (77, '插入', NULL, 'plugin\\admin\\app\\controller\\RoleController@insert', 5, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (78, '更新', NULL, 'plugin\\admin\\app\\controller\\RoleController@update', 5, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (79, '删除', NULL, 'plugin\\admin\\app\\controller\\RoleController@delete', 5, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (80, '获取角色权限', NULL, 'plugin\\admin\\app\\controller\\RoleController@rules', 5, '2025-04-16 17:30:54', '2025-04-16 17:30:54', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (81, '查询', NULL, 'plugin\\admin\\app\\controller\\RuleController@select', 6, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (82, '添加', NULL, 'plugin\\admin\\app\\controller\\RuleController@insert', 6, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (83, '更新', NULL, 'plugin\\admin\\app\\controller\\RuleController@update', 6, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (84, '删除', NULL, 'plugin\\admin\\app\\controller\\RuleController@delete', 6, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (85, '插入', NULL, 'plugin\\admin\\app\\controller\\UserController@insert', 8, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (86, '更新', NULL, 'plugin\\admin\\app\\controller\\UserController@update', 8, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (87, '查询', NULL, 'plugin\\admin\\app\\controller\\UserController@select', 8, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (88, '删除', NULL, 'plugin\\admin\\app\\controller\\UserController@delete', 8, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (89, '更新', NULL, 'plugin\\admin\\app\\controller\\AccountController@update', 10, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (90, '修改密码', NULL, 'plugin\\admin\\app\\controller\\AccountController@password', 10, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (91, '查询', NULL, 'plugin\\admin\\app\\controller\\AccountController@select', 10, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (92, '添加', NULL, 'plugin\\admin\\app\\controller\\AccountController@insert', 10, '2025-04-16 17:30:55', '2025-04-16 17:30:55', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (93, '删除', NULL, 'plugin\\admin\\app\\controller\\AccountController@delete', 10, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (94, '浏览附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@attachment', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (95, '查询附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@select', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (96, '更新附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@update', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (97, '添加附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@insert', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (98, '上传文件', NULL, 'plugin\\admin\\app\\controller\\UploadController@file', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (99, '上传图片', NULL, 'plugin\\admin\\app\\controller\\UploadController@image', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (100, '上传头像', NULL, 'plugin\\admin\\app\\controller\\UploadController@avatar', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (101, '删除附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@delete', 11, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (102, '查询', NULL, 'plugin\\admin\\app\\controller\\DictController@select', 12, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (103, '插入', NULL, 'plugin\\admin\\app\\controller\\DictController@insert', 12, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (104, '更新', NULL, 'plugin\\admin\\app\\controller\\DictController@update', 12, '2025-04-16 17:30:56', '2025-04-16 17:30:56', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (105, '删除', NULL, 'plugin\\admin\\app\\controller\\DictController@delete', 12, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (106, '更改', NULL, 'plugin\\admin\\app\\controller\\ConfigController@update', 13, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (107, '列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@list', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (108, '安装', NULL, 'plugin\\admin\\app\\controller\\PluginController@install', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (109, '卸载', NULL, 'plugin\\admin\\app\\controller\\PluginController@uninstall', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (110, '支付', NULL, 'plugin\\admin\\app\\controller\\PluginController@pay', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (111, '登录官网', NULL, 'plugin\\admin\\app\\controller\\PluginController@login', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (112, '获取已安装的插件列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@getInstalledPlugins', 15, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (113, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController@formBuild', 17, '2025-04-16 17:30:57', '2025-04-16 17:30:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (114, '邮件设置', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController', 9, '2025-04-16 17:55:17', '2025-04-16 17:55:17', '/app/email/admin/setting', 1, 0);
INSERT INTO `wa_rules` VALUES (115, '短信设置', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController', 9, '2025-04-16 17:55:18', '2025-04-16 17:55:18', '/app/sms/admin/setting', 1, 0);
INSERT INTO `wa_rules` VALUES (116, '注册设置', NULL, 'plugin\\user\\app\\admin\\controller\\RegisterController', 7, '2025-04-16 17:55:25', '2025-04-16 17:55:25', '/app/user/admin/register', 1, 0);
INSERT INTO `wa_rules` VALUES (139, '获取设置', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@get', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (140, '更改设置', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@save', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (141, '邮件测试', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@test', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (142, '邮件模版测试', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@testTemplate', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (143, '获取模版', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@selectTemplate', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (144, '插入', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@insertTemplate', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (145, '更新', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@updateTemplate', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (146, '删除', NULL, 'plugin\\email\\app\\admin\\controller\\SettingController@deleteTemplate', 114, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (147, '获取设置', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@get', 115, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (148, '更改设置', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@save', 115, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (149, '短信标签测试', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@testTag', 115, '2025-04-27 18:32:57', '2025-04-27 18:32:57', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (150, '插入', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@insertTag', 115, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (151, '更新', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@updateTag', 115, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (152, '删除', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@deleteTag', 115, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (153, '获取标签', NULL, 'plugin\\sms\\app\\admin\\controller\\SettingController@getTag', 115, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (154, '保存设置', NULL, 'plugin\\user\\app\\admin\\controller\\RegisterController@saveSetting', 116, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (155, '获取配置', NULL, 'plugin\\user\\app\\admin\\controller\\RegisterController@getSetting', 116, '2025-04-27 18:32:58', '2025-04-27 18:32:58', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (272, '反馈系统', 'layui-icon-chat', 'feedback', 0, '2025-05-03 14:21:52', '2025-05-03 14:21:52', NULL, 0, 0);
INSERT INTO `wa_rules` VALUES (273, '工单管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController', 272, '2025-05-03 14:21:52', '2025-05-03 14:21:52', '/app/admin/feedback/main/index', 1, 10);
INSERT INTO `wa_rules` VALUES (274, '分类管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/category/index', 1, 9);
INSERT INTO `wa_rules` VALUES (275, '优先级管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/priority/index', 1, 8);
INSERT INTO `wa_rules` VALUES (276, '标签管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/tag/index', 1, 7);
INSERT INTO `wa_rules` VALUES (277, '评论管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\CommentController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/comment/index', 1, 6);
INSERT INTO `wa_rules` VALUES (278, '附件管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\AttachmentController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/attachment/index', 1, 5);
INSERT INTO `wa_rules` VALUES (279, '日志管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\LogController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/log/index', 1, 4);
INSERT INTO `wa_rules` VALUES (280, '知识库', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/knowledge/index', 1, 3);
INSERT INTO `wa_rules` VALUES (281, '通知管理', NULL, 'plugin\\feedback\\app\\admin\\controller\\NotificationController', 272, '2025-05-03 14:21:53', '2025-05-03 14:21:53', '/app/admin/feedback/notification/index', 1, 2);
INSERT INTO `wa_rules` VALUES (282, '工作流', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController', 272, '2025-05-03 14:21:54', '2025-05-03 14:21:54', '/app/admin/feedback/workflow/index', 1, 1);
INSERT INTO `wa_rules` VALUES (283, '数据看板', NULL, 'plugin\\feedback\\app\\admin\\controller\\DashboardController', 272, '2025-05-03 14:21:54', '2025-05-03 14:21:54', '/app/admin/feedback/dashboard/index', 1, 0);
INSERT INTO `wa_rules` VALUES (320, 'CMS管理', 'layui-icon-list', 'acms', 0, '2025-05-09 16:19:43', '2025-05-09 16:19:43', NULL, 0, 0);
INSERT INTO `wa_rules` VALUES (321, '文章管理', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController', 320, '2025-05-09 16:19:43', '2025-05-09 16:19:43', '/app/admin/acms/article/index', 1, 2);
INSERT INTO `wa_rules` VALUES (322, '分类管理', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController', 320, '2025-05-09 16:19:43', '2025-05-09 16:19:43', '/app/admin/acms/category/index', 1, 1);
INSERT INTO `wa_rules` VALUES (323, '标签管理', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController', 320, '2025-05-09 16:19:44', '2025-05-09 16:19:44', '/app/admin/acms/tag/index', 1, 0);
INSERT INTO `wa_rules` VALUES (324, '评论管理', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController', 320, '2025-05-09 16:19:44', '2025-05-09 16:19:44', '/app/admin/acms/comment/index', 1, -1);
INSERT INTO `wa_rules` VALUES (325, '数据看板', NULL, 'plugin\\acms\\app\\admin\\controller\\DashboardController', 320, '2025-05-09 16:19:44', '2025-05-09 16:19:44', '/app/admin/acms/dashboard/index', 1, -2);
INSERT INTO `wa_rules` VALUES (326, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@edit', 273, '2025-05-09 16:48:22', '2025-05-09 16:48:22', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (327, 'add', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@add', 273, '2025-05-09 16:48:22', '2025-05-09 16:48:22', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (328, 'save', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@save', 273, '2025-05-09 16:48:22', '2025-05-09 16:48:22', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (329, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@update', 273, '2025-05-09 16:48:22', '2025-05-09 16:48:22', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (330, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@delete', 273, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (331, 'changeStatus', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@changeStatus', 273, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (332, 'comment', NULL, 'plugin\\feedback\\app\\admin\\controller\\FeedbackController@comment', 273, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (333, 'add', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController@add', 274, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (334, 'save', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController@save', 274, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (335, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController@edit', 274, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (336, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController@update', 274, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (337, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\CategoryController@delete', 274, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (338, 'add', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController@add', 275, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (339, 'save', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController@save', 275, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (340, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController@edit', 275, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (341, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController@update', 275, '2025-05-09 16:48:23', '2025-05-09 16:48:23', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (342, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\PriorityController@delete', 275, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (343, 'add', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController@add', 276, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (344, 'save', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController@save', 276, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (345, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController@edit', 276, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (346, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController@update', 276, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (347, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\TagController@delete', 276, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (348, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\CommentController@edit', 277, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (349, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\CommentController@update', 277, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (350, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\CommentController@delete', 277, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (351, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\AttachmentController@delete', 278, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (352, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\LogController@delete', 279, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (353, 'add', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController@add', 280, '2025-05-09 16:48:24', '2025-05-09 16:48:24', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (354, 'save', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController@save', 280, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (355, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController@edit', 280, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (356, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController@update', 280, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (357, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\KnowledgeBaseController@delete', 280, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (358, 'edit', NULL, 'plugin\\feedback\\app\\admin\\controller\\NotificationController@edit', 281, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (359, 'update', NULL, 'plugin\\feedback\\app\\admin\\controller\\NotificationController@update', 281, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (360, 'delete', NULL, 'plugin\\feedback\\app\\admin\\controller\\NotificationController@delete', 281, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (361, 'markRead', NULL, 'plugin\\feedback\\app\\admin\\controller\\NotificationController@markRead', 281, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (362, '新增页面', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@add', 282, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (363, '保存新增', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@save', 282, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (364, '编辑页面', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@edit', 282, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (365, '更新', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@update', 282, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (366, '删除（支持单个和批量）', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@delete', 282, '2025-05-09 16:48:25', '2025-05-09 16:48:25', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (367, '启用/禁用', NULL, 'plugin\\feedback\\app\\admin\\controller\\WorkflowController@changeStatus', 282, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (368, '添加文章页面', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@add', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (369, '保存文章', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@save', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (370, '编辑文章页面', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@edit', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (371, '更新文章', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@update', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (372, '删除（支持单个和批量）', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@delete', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (373, '修改文章状态', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@changeStatus', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (374, '获取文章列表数据', NULL, 'plugin\\acms\\app\\admin\\controller\\ArticleController@getList', 321, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (375, '添加分类页面', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@add', 322, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (376, '保存分类', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@save', 322, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (377, '编辑分类页面', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@edit', 322, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (378, '更新分类', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@update', 322, '2025-05-09 16:48:26', '2025-05-09 16:48:26', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (379, '删除（支持单个和批量）', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@delete', 322, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (380, '修改分类状态', NULL, 'plugin\\acms\\app\\admin\\controller\\CategoryController@changeStatus', 322, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (381, '获取标签列表数据', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@getList', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (382, '添加标签页面', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@add', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (383, '编辑标签页', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@edit', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (384, '保存标签', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@save', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (385, '更新标签', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@update', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (386, '更改标签状态', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@status', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (387, '更改标签状态', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@changeStatus', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (388, '删除（支持单个和批量）', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@delete', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (389, '批量删除标签', NULL, 'plugin\\acms\\app\\admin\\controller\\TagController@batchRemove', 323, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (390, 'getList', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@getList', 324, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (391, 'create', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@create', 324, '2025-05-09 16:48:27', '2025-05-09 16:48:27', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (392, 'store', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@store', 324, '2025-05-09 16:48:28', '2025-05-09 16:48:28', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (393, 'edit', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@edit', 324, '2025-05-09 16:48:28', '2025-05-09 16:48:28', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (394, 'update', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@update', 324, '2025-05-09 16:48:28', '2025-05-09 16:48:28', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (395, '删除（支持单个和批量）', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@delete', 324, '2025-05-09 16:48:28', '2025-05-09 16:48:28', NULL, 2, 0);
INSERT INTO `wa_rules` VALUES (396, 'audit', NULL, 'plugin\\acms\\app\\admin\\controller\\CommentController@audit', 324, '2025-05-09 16:48:28', '2025-05-09 16:48:28', NULL, 2, 0);

-- ----------------------------
-- Table structure for wa_uploads
-- ----------------------------
DROP TABLE IF EXISTS `wa_uploads`;
CREATE TABLE `wa_uploads`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '管理员',
  `file_size` int(0) NOT NULL COMMENT '文件大小',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'mime类型',
  `image_width` int(0) NULL DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(0) NULL DEFAULT NULL COMMENT '图片高度',
  `ext` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '扩展名',
  `storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `created_at` date NULL DEFAULT NULL COMMENT '上传时间',
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `updated_at` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `ext`(`ext`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wa_users
-- ----------------------------
DROP TABLE IF EXISTS `wa_users`;
CREATE TABLE `wa_users`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `sex` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `level` tinyint(0) NOT NULL DEFAULT 0 COMMENT '等级',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额(元)',
  `score` int(0) NOT NULL DEFAULT 0 COMMENT '积分',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `join_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `join_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role` int(0) NOT NULL DEFAULT 1 COMMENT '角色',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `join_time`(`join_time`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wa_users
-- ----------------------------
INSERT INTO `wa_users` VALUES (1, 'zhezhebie', 'test', '$2y$10$dTCbsNF6C4CSpXcqfMV8i.g7ao55weTn0HOxe3cXCfUnO/H5sSSCu', '1', '/app/user/default-avatar.png', NULL, NULL, 0, NULL, 0.00, 0, '2025-05-08 19:13:45', '127.0.0.1', '2025-04-18 17:26:10', '127.0.0.1', NULL, '2025-04-18 17:26:10', '2025-05-08 19:13:45', 1, 0);
INSERT INTO `wa_users` VALUES (2, 'user001', '阳光小宇', '$2a$10$xZwW9JvQ8L5kR2b3fG.dH.eY/pK1oP1s7J5v8Y2X3W1', '1', 'https://example.com/avatar1.jpg', 'user001@example.com', '13800138001', 2, '1995-05-20', 1288.50, 1500, '2024-10-25 14:30:00', '192.168.1.101', '2023-08-15 10:20:00', '123.123.123.1', 'tok_abc123xyz', '2023-08-15 10:20:00', '2024-10-25 14:30:00', 1, 0);
INSERT INTO `wa_users` VALUES (3, 'user002', '追风少年', '$2a$10$nBmN8LpQ7K6jR4d5fH.iG.eT/qO2oP2r8K6w9Z3Y4X2', '1', 'https://example.com/avatar2.jpg', 'user002@example.com', '13900139002', 1, '1998-11-12', 850.75, 980, '2024-10-24 09:15:00', '192.168.1.102', '2023-12-03 16:45:00', '123.123.123.2', 'tok_def456uvw', '2023-12-03 16:45:00', '2024-10-24 09:15:00', 1, 0);
INSERT INTO `wa_users` VALUES (4, 'user003', '晨曦微光', '$2a$10$yVwX9KtQ7L6mR5d6fG.jH.eU/pL1oQ2t8M7v9Y3Z4W1', '0', 'https://example.com/avatar3.jpg', 'user003@example.com', '13700137003', 3, '1992-03-08', 2150.20, 2300, '2024-10-23 20:50:00', '192.168.1.103', '2023-06-22 08:30:00', '123.123.123.3', 'tok_ghi789rst', '2023-06-22 08:30:00', '2024-10-23 20:50:00', 2, 0);
INSERT INTO `wa_users` VALUES (5, 'user004', '墨染流年', '$2a$10$pQwR9LvQ6K5jR4d5fH.iG.eT/qO2oP2r8K6w9Z3Y4X2', '0', 'https://example.com/avatar4.jpg', 'user004@example.com', '13600136004', 2, '1994-07-18', 1560.90, 1800, '2024-10-22 11:25:00', '192.168.1.104', '2024-02-14 14:10:00', '123.123.123.4', 'tok_jkl012mno', '2024-02-14 14:10:00', '2024-10-22 11:25:00', 1, 0);
INSERT INTO `wa_users` VALUES (6, 'user005', '星辰大海', '$2a$10$xZwW9JvQ8L5kR2b3fG.dH.eY/pK1oP1s7J5v8Y2X3W1', '1', 'https://example.com/avatar5.jpg', 'user005@example.com', '13500135005', 1, '2000-01-30', 320.00, 450, '2024-10-21 17:40:00', '192.168.1.105', '2024-09-05 19:55:00', '123.123.123.5', 'tok_pqr345stu', '2024-09-05 19:55:00', '2024-10-21 17:40:00', 1, 0);
INSERT INTO `wa_users` VALUES (7, 'user006', '清风徐来', '$2a$10$nBmN8LpQ7K6jR4d5fH.iG.eT/qO2oP2r8K6w9Z3Y4X2', '1', 'https://example.com/avatar6.jpg', 'user006@example.com', '13400134006', 2, '1997-09-25', 980.60, 1100, '2024-10-20 13:05:00', '192.168.1.106', '2024-05-18 11:30:00', '123.123.123.6', 'tok_vwx678yz1', '2024-05-18 11:30:00', '2024-10-20 13:05:00', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
