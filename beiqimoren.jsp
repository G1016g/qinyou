<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>北柒陌人 - 皇家骑士团团长 - 中世纪王国百科</title>

    <!-- 自定义主题样式 -->
    <style>
        :root {
            --primary: #1A1A1A;       /* 主色调 - 墨黑 */
            --secondary: #461634;     /* 玫瑰红 */
            --neutral: #282828;       /* 深灰背景 */
            --light-gray: #3A3A3A;     /* 浅灰 */
            --border-gray: #444444;    /* 边框色 */
            --rose-red: #6B0A2F;       /* 玫瑰点缀色 */
            --gold-accent: #C8A965;    /* 金色点缀 */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Georgia', serif;
            color: white;
            scroll-behavior: smooth;
        }

        body {
            background-color: var(--neutral);
            line-height: 1.7;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        /* 玫瑰花纹背景 */
        .rose-pattern {
            background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyI+PHBhdGggZD0iTTEwLjY3IDYuMzFsLS43Ni0uNzZsLS43Ni43NiIgZmlsbD0iIzQ2MTYzNCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTThBNS4yNEw4LjUgMTguMjhMMTMuNzQgMTMuMDNsLTUuMjQtNS4yNHoiIGZpbGw9IiM2QjA4MkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==');
            background-size: 1.5rem;
            background-blend-mode: overlay;
        }

        /* 头部导航 */
        header {
            background: var(--primary);
            border-bottom: 1px solid var(--border-gray);
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 0;
        }

        .logo img {
            height: 2.5rem;
            filter: brightness(0.8) sepia(1) hue-rotate(300deg) saturate(3);
        }

        .logo h1 {
            color: var(--rose-red);
            font-size: 1.75rem;
            font-weight: bold;
            text-shadow: 0 0 4px rgba(107, 10, 47, 0.5);
            letter-spacing: 1px;
        }

        .search-box {
            flex: 1;
            max-width: 600px;
            margin: 0 2rem;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 0.75rem 3rem 0.75rem 1.5rem;
            border: 1px solid var(--border-gray);
            border-radius: 2rem;
            background: var(--light-gray);
            color: white;
            transition: all 0.3s;
        }

        .search-box input:focus {
            outline: none;
            border-color: var(--rose-red);
            box-shadow: 0 0 8px rgba(107, 10, 47, 0.3);
        }

        .search-icon {
            position: absolute;
            right: 1.5rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--rose-red);
            font-size: 1.25rem;
        }

        .user-menu a {
            color: var(--light-gray);
            text-decoration: none;
            transition: color 0.3s;
            padding: 0.5rem 1rem;
            position: relative;
        }

        .user-menu a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--rose-red);
            transition: width 0.3s;
        }

        .user-menu a:hover {
            color: var(--rose-red);
        }

        .user-menu a:hover::after {
            width: 100%;
        }

        .edit-btn {
            background: linear-gradient(135deg, var(--rose-red), #94194A);
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 2rem;
            font-size: 0.875rem;
            box-shadow: 0 4px 8px rgba(107, 10, 47, 0.3);
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(107, 10, 47, 0.5);
        }

        /* 文章内容 */
        article {
            background: var(--primary);
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
            padding: 2.5rem;
            margin-top: 2rem;
            margin-bottom: 4rem;
        }

        .article-title {
            font-size: 2.25rem;
            color: var(--rose-red);
            text-align: center;
            margin-bottom: 1.5rem;
            text-shadow: 0 0 6px rgba(107, 10, 47, 0.5);
            position: relative;
            padding-bottom: 1rem;
        }

        .article-title::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--rose-red), transparent);
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .article-meta {
            color: var(--border-gray);
            font-size: 0.875rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .info-box {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            color: white;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.3);
            border: 1px solid var(--border-gray);
        }

        .info-title {
            font-size: 1.5rem;
            color: var(--rose-red);
            text-align: center;
            margin-bottom: 1.5rem;
            border-bottom: 2px solid var(--border-gray);
            padding-bottom: 0.75rem;
            text-shadow: 0 0 4px rgba(107, 10, 47, 0.3);
        }

        .info-image {
            width: 100%;
            height: 20rem;
            object-fit: cover;
            border-radius: 0.75rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
            border: 2px solid var(--border-gray);
            transition: all 0.3s;
        }

        .info-image:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 12px rgba(0,0,0,0.7);
        }

        .section-title {
            font-size: 1.75rem;
            color: var(--rose-red);
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--border-gray);
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 2px;
            background: var(--rose-red);
            bottom: -2px;
            left: 0;
        }

        .subsection-title {
            font-size: 1.25rem;
            color: var(--gold-accent);
            margin: 1.25rem 0 0.75rem;
            position: relative;
            padding-left: 1rem;
        }

        .subsection-title::before {
            content: '◄';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            color: var(--rose-red);
            font-size: 0.875rem;
        }

        /* 技能评分 */
        .skill-rating {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            color: white;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.3);
            border: 1px solid var(--border-gray);
        }

        .rating-title {
            font-size: 1.25rem;
            color: var(--gold-accent);
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .rating-item {
            margin-bottom: 1.25rem;
        }

        .rating-header {
            display: flex;
            justify-content: space-between;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .rating-bar {
            height: 0.625rem;
            background: var(--border-gray);
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
        }

        .rating-value {
            background: linear-gradient(90deg, var(--rose-red), #94194A);
            transition: width 1s ease;
            height: 100%;
        }

        /* 表格 */
        .missions-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            background: var(--light-gray);
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .missions-table th,
        .missions-table td {
            padding: 1rem;
            border: 1px solid var(--border-gray);
        }

        .missions-table th {
            background: var(--primary);
            color: var(--rose-red);
            font-weight: bold;
            text-align: center;
            position: relative;
        }

        .missions-table th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--rose-red);
        }

        .missions-table tr {
            transition: all 0.3s;
        }

        .missions-table tr:hover {
            background: rgba(107, 10, 47, 0.1);
        }

        /* 人际关系卡片 */
        .relation-card {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            color: white;
            transition: all 0.3s;
            border: 1px solid var(--border-gray);
            position: relative;
            overflow: hidden;
        }

        .relation-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(107, 10, 47, 0.2), transparent);
            transition: all 0.6s;
        }

        .relation-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(107, 10, 47, 0.3);
            border-color: var(--rose-red);
        }

        .relation-card:hover::before {
            left: 100%;
        }

        .relation-title {
            color: var(--gold-accent);
            font-size: 1.25rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .relation-icon {
            color: var(--rose-red);
            font-size: 1.5rem;
            margin-right: 1rem;
        }

        /* 装备卡片 */
        .equipment-card {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 1.5rem;
            color: white;
            transition: all 0.3s;
            border: 1px solid var(--border-gray);
            position: relative;
            overflow: hidden;
            height: 100%;
        }

        .equipment-card::before {
            content: '';
            position: absolute;
            top: -100%;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(180deg, transparent, rgba(107, 10, 47, 0.2), transparent);
            transition: all 0.6s;
        }

        .equipment-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(107, 10, 47, 0.3);
            border-color: var(--rose-red);
        }

        .equipment-card:hover::before {
            top: 100%;
        }

        .equipment-title {
            color: var(--gold-accent);
            font-size: 1.25rem;
            margin-bottom: 1rem;
            text-align: center;
            text-shadow: 0 0 4px rgba(200, 169, 101, 0.3);
        }

        .equipment-image {
            width: 100%;
            height: 12rem;
            object-fit: cover;
            border-radius: 0.75rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
            border: 2px solid var(--border-gray);
            transition: all 0.3s;
        }

        .equipment-card:hover .equipment-image {
            transform: scale(1.03);
            box-shadow: 0 6px 12px rgba(0,0,0,0.7);
            border-color: var(--rose-red);
        }

        /* 经典语录 */
        .quote-box {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            color: white;
            margin-bottom: 2rem;
            border-left: 4px solid var(--rose-red);
            box-shadow: inset 0 0 10px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }

        .quote-box::before {
            content: '“';
            position: absolute;
            top: -0.5rem;
            left: 0.5rem;
            font-size: 4rem;
            color: var(--rose-red);
            opacity: 0.3;
        }

        .quote-author {
            text-align: right;
            color: var(--gold-accent);
            font-size: 0.875rem;
            margin-top: 1rem;
        }

        /* 回到顶部按钮 */
        .back-to-top {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: linear-gradient(135deg, var(--rose-red), #94194A);
            color: white;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: all 0.3s;
            box-shadow: 0 4px 8px rgba(107, 10, 47, 0.5);
            z-index: 50;
            border: 1px solid var(--border-gray);
        }

        .back-to-top:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(107, 10, 47, 0.7);
            background: linear-gradient(135deg, #94194A, var(--rose-red));
        }

        /* 基本信息横向排列样式 */
        .basic-info {
            display: flex;
            gap: 2rem;
        }

        .info-box {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .info-image {
            flex: 1;
            min-height: 200px;
            object-fit: cover;
        }

        .info-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1rem;
        }

        .summary {
            flex: 2;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .container {
                padding: 0 1rem;
            }

            .header-container {
                flex-direction: column;
                gap: 1rem;
            }

            .search-box {
                width: 100%;
                margin: 0;
            }

            .article-title {
                font-size: 1.75rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            /* 小屏幕下基本信息恢复纵向排列 */
            .basic-info {
                flex-direction: column;
            }
        }
    </style>

    <!-- 中世纪风格图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="rose-pattern">
<!-- 顶部导航栏 -->
<header>
    <div class="container header-container">
        <!-- Logo -->
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/王国logo.png" alt="中世纪王国百科">
            <h1>王国百科</h1>
        </div>

        <!-- 搜索框 -->
        <div class="search-box">
            <input type="text" placeholder="搜索中世纪王国相关内容...">
            <span class="search-icon fas fa-search"></span>
        </div>

        <!-- 用户菜单 -->
        <div class="user-menu">
            <a href="#" class="transition-all duration-300"><i class="fas fa-user mr-1"></i> 登录</a>
            <a href="#" class="transition-all duration-300"><i class="fas fa-user-plus mr-1"></i> 注册</a>
            <a href="#" class="edit-btn">
                <i class="fas fa-pen mr-1"></i> 编辑词条
            </a>
        </div>
    </div>
</header>

<!-- 主要内容区 -->
<main class="container">
    <!-- 主内容 -->
    <article class="flex-1">
        <div class="article-header">
            <h1 class="article-title">北柒陌人</h1>
            <div class="article-meta">
                <span><i class="fas fa-user-secret mr-1"></i>龙焰王国皇家刺客</span>
                <span><i class="fas fa-calendar-alt mr-1"></i>活跃于992年-1015年</span>
            </div>
            <div class="text-center mt-3 text-sm text-gray-400">
                <span><i class="fas fa-history mr-1"></i>最后编辑于 1015年6月5日</span>
                <a href="#" class="edit-link ml-2 hover:underline transition-all duration-300">
                    <i class="fas fa-pencil-alt mr-1"></i> 编辑
                </a>
            </div>
        </div>

        <!-- 基本信息卡片 - 横向排列 -->
        <div id="basic-info" class="basic-info">
            <div class="info-box">
                <h3 class="info-title">基本信息</h3>
                <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/清水百科.jpg" alt="清水 - 皇家刺客" class="info-image">
                <div class="info-details">
                    <div class="info-label text-gray-400">中文名</div>
                    <div>清水</div>
                    <div class="info-label text-gray-400">别名</div>
                    <div>夜影、黑玫瑰使者</div>
                    <div class="info-label text-gray-400">职业</div>
                    <div>皇家刺客</div>
                    <div class="info-label text-gray-400">隶属</div>
                    <div>暗影之牙组织</div>
                    <div class="info-label text-gray-400">效忠</div>
                    <div>龙焰王国</div>
                    <div class="info-label text-gray-400">主要武器</div>
                    <div>毒琴弦、淬毒匕首</div>
                    <div class="info-label text-gray-400">特殊能力</div>
                    <div>暗影潜行、毒药调配</div>
                    <div class="info-label text-gray-400">战绩</div>
                    <div>完成47次暗杀任务，0次失败</div>
                </div>
            </div>

            <!-- 人物简介 -->
            <div class="summary">
                <h2 class="section-title">人物简介</h2>
                <p class="content-text">
                    清水（？-1015年），龙焰王国历史上最神秘的皇家刺客，
                    代号"黑玫瑰"。她隶属于国王直属的精英暗杀组织"暗影之牙"，
                    在其二十年的职业生涯中执行了47次高难度暗杀任务，成功率达100%。
                </p>
                <p class="content-text">
                    清水以其鬼魅般的暗杀手法和极高的隐蔽性著称，
                    常以吟游诗人或宫廷侍女的身份接近目标。她最著名的行动是在"篡位者之乱"中，
                    伪装成乐师潜入叛军大营，用毒琴弦勒死了三位叛变的贵族首领，成功扭转战局。
                </p>
                <p class="content-text">
                    尽管身份神秘，清水仍因对甜食的特殊喜好而被同僚熟知，
                    她常在完成任务后前往王都的"玫瑰坊"甜品店享用草莓蛋糕。这一习惯曾一度成为她的弱点，
                    但也因此与店主之女建立了深厚友谊，成为她刺客生涯中少有的温情片段。
                </p>
            </div>
        </div>

        <!-- 人物生平 -->
        <div id="biography" class="content-section">
            <h2 class="section-title">人物生平</h2>

            <!-- 童年与训练 -->
            <h3 class="subsection-title">童年与训练（992-1002）</h3>
            <p class="content-text">
                清水的真实出身已不可考，据《暗影之牙秘史》记载，
                她于992年被组织从战乱中的边境村庄带回。自幼接受严苛的刺客训练，
                精通潜行、暗杀、易容和毒药调配。十岁时便通过了"暗影试炼"，成为组织历史上最年轻的合格刺客。
            </p>

            <!-- 早期任务 -->
            <h3 class="subsection-title">早期任务（1003-1008）</h3>
            <p class="content-text">
                清水的首次独立任务是刺杀北方蛮族的斥候首领。她伪装成部落巫女，
                在祭祀仪式中将剧毒混入供品，成功击杀目标并全身而退。此后五年间，她逐渐崭露头角，
                尤其擅长渗透高戒备场所，因此被选中参与"篡位者之乱"的核心行动。
            </p>

            <!-- 巅峰时期 -->
            <h3 class="subsection-title">巅峰时期（1009-1015）</h3>
            <p class="content-text">
                1009年，清水在"毒琴弦事件"中一战成名。她潜入被叛军占领的王都大剧院，
                在三小时内用改良后的鲁特琴弦同时暗杀了三位叛军首领，琴弦上的神经毒素确保目标无声无息地死亡。
                这一行动被载入《皇家刺客战术手册》，成为经典案例。
            </p>
            <p class="content-text">
                此后，清水成为国王最信任的秘密武器，
                参与了多起涉及国家存亡的重大行动。她的最后一次任务是刺杀企图勾结恶魔的黑巫师，
                在这场行动中她受了重伤，但仍坚持完成任务，最终因伤势过重于1015年去世，享年约23岁。
            </p>
        </div>

        <!-- 暗杀技能 -->
        <div id="skills" class="content-section">
            <h2 class="section-title">暗杀技能</h2>
            <ul class="skills-list space-y-2 pl-5">
                <li class="skill-item flex items-start">
                    <i class="fas fa-circle text-rose-red text-xs mt-1.5 mr-2"></i>
                    <span class="skill-name">暗影潜行：</span>
                    <span>能在完全黑暗中行动，擅长利用环境隐藏身形，曾在守卫森严的地牢中自由出入七次而未被察觉。</span>
                </li>
                <li class="skill-item flex items-start">
                    <i class="fas fa-circle text-rose-red text-xs mt-1.5 mr-2"></i>
                    <span class="skill-name">毒理大师：</span>
                    <span>精通超过两百种毒药的制作，其独门"黑玫瑰之泪"能在三秒内麻痹神经，十秒内致人死亡且无明显外伤。</span>
                </li>
                <li class="skill-item flex items-start">
                    <i class="fas fa-circle text-rose-red text-xs mt-1.5 mr-2"></i>
                    <span class="skill-name">易容术：</span>
                    <span>可通过化妆和简单道具伪装成不同性别、年龄的人物，其伪装甚至能骗过朝夕相处的亲人。</span>
                </li>
                <li class="skill-item flex items-start">
                    <i class="fas fa-circle text-rose-red text-xs mt-1.5 mr-2"></i>
                    <span class="skill-name">武器专精：</span>
                    <span>除毒琴弦外，还擅长使用淬毒匕首、袖箭和吹箭等暗器，出手精准，常能一击致命。</span>
                </li>
                <li class="skill-item flex items-start">
                    <i class="fas fa-circle text-rose-red text-xs mt-1.5 mr-2"></i>
                    <span class="skill-name">情报分析：</span>
                    <span>具备出色的情报收集和分析能力，能在短时间内掌握目标的生活习惯、弱点和防备漏洞。</span>
                </li>
            </ul>

            <!-- 技能评分图 -->
            <div class="skill-rating">
                <h3 class="rating-title">技能评分（满分10分）</h3>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-moon text-rose-red mr-2"></i>潜行能力</span>
                        <span>9.8</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 98%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-crosshairs text-rose-red mr-2"></i>暗杀技巧</span>
                        <span>9.5</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 95%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-search text-rose-red mr-2"></i>情报分析</span>
                        <span>9.2</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 92%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-flask text-rose-red mr-2"></i>毒药制作</span>
                        <span>9.7</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 97%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-mask text-rose-red mr-2"></i>易容能力</span>
                        <span>9.4</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 94%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-bolt text-rose-red mr-2"></i>应变能力</span>
                        <span>9.6</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 96%"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 重要任务 -->
        <div id="missions" class="content-section">
            <h2 class="section-title">重要任务</h2>
            <table class="missions-table">
                <thead>
                <tr>
                    <th>任务名称</th>
                    <th>目标</th>
                    <th>时间</th>
                    <th>地点</th>
                    <th>任务结果</th>
                    <th>特殊备注</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>毒琴弦事件</td>
                    <td>刺杀篡位者联盟三首领</td>
                    <td>1009年</td>
                    <td>王都大剧院</td>
                    <td>成功</td>
                    <td>用改良鲁特琴弦同时暗杀三人，未引起骚乱</td>
                </tr>
                <tr>
                    <td>冰封王座</td>
                    <td>刺杀北方蛮族可汗</td>
                    <td>1010年</td>
                    <td>极寒之地冰宫</td>
                    <td>成功</td>
                    <td>在-40℃环境下潜伏三天完成任务</td>
                </tr>
                <tr>
                    <td>黑塔秘事</td>
                    <td>摧毁黑暗巫师实验室</td>
                    <td>1011年</td>
                    <td>边境黑魔法塔</td>
                    <td>成功</td>
                    <td>破解七层魔法防御，烧毁所有实验记录</td>
                </tr>
                <tr>
                    <td>翡翠阴谋</td>
                    <td>暗杀企图政变的财政大臣</td>
                    <td>1013年</td>
                    <td>王宫翡翠厅</td>
                    <td>成功</td>
                    <td>伪装成宫女，在早朝时用毒针刺杀目标</td>
                </tr>
                <tr>
                    <td>血色契约</td>
                    <td>阻止与恶魔的契约仪式</td>
                    <td>1015年</td>
                    <td>地下献祭祭坛</td>
                    <td>成功</td>
                    <td>重伤完成任务，后因伤重不治</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- 人际关系 -->
        <div id="relations" class="content-section">
            <h2 class="section-title">人际关系</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-user-shield relation-icon"></i>
                        <span>暗影之牙首领</span>
                    </div>
                    <p class="relation-content">
                        清水的导师和上级，两人关系亦师亦父。首领传授了清水所有暗杀技巧，
                        并在其成长过程中给予了严格的训练和指导。清水对其充满敬畏和感激，视其为唯一可以信任的人。
                    </p>
                </div>
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-crown relation-icon"></i>
                        <span>龙焰王国国王</span>
                    </div>
                    <p class="relation-content">
                        清水的雇主和效忠对象，两人保持着严格的主仆关系。国王十分信任清水的能力，
                        多次委派她执行关乎国家存亡的重要任务。清水对国王的忠诚坚定不移，认为自己的使命就是保护王国和国王。
                    </p>
                </div>
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-heart relation-icon"></i>
                        <span>玫瑰坊店主之女</span>
                    </div>
                    <p class="relation-content">
                        清水在任务之余常去的甜品店店主的女儿，两人意外成为好友。
                        店主之女不知清水的真实身份，只当她是一位普通的顾客。
                        这段友谊是清水刺客生涯中少有的温情，也是她唯一的情感寄托。
                    </p>
                </div>
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-user-secret relation-icon"></i>
                        <span>银月刺客</span>
                    </div>
                    <p class="relation-content">
                        清水的同行和竞争对手，效忠于敌对国家。
                        两人曾多次交手，实力不相上下，彼此惺惺相惜。
                        虽然立场对立，但都对对方的能力和职业道德表示尊重，形成了一种特殊的"对手"关系。
                    </p>
                </div>
            </div>
        </div>

        <!-- 装备与武器 -->
        <div id="equipment" class="content-section">
            <h2 class="section-title">装备与武器</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/毒琴弦.jpg" alt="毒琴弦" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">毒琴弦</h3>
                    <p class="equipment-desc">
                        清水的标志性武器，由特殊金属丝和毒蛇神经混合制成，
                        可隐藏在乐器中随身携带。琴弦表面涂有致命毒药，接触皮肤即可渗入血液，导致神经麻痹和心脏骤停。
                    </p>
                </div>
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/淬毒匕首.png" alt="淬毒匕首" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">淬毒匕首</h3>
                    <p class="equipment-desc">
                        由矮人锻造大师秘密打造的精钢匕首，刀身轻薄锋利，
                        可刺穿锁子甲。匕首尖端可更换不同毒药，根据任务需求选择麻痹剂、心脏停搏剂或慢性毒药。
                    </p>
                </div>
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/暗影披风.png" alt="暗影披风" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">暗影披风</h3>
                    <p class="equipment-desc">
                        用夜枭羽毛和魔法丝线编织而成，可吸收光线和声音。
                        在黑暗中几乎隐形，并且能轻微改变穿戴者的轮廓，帮助清水在月光下也能完美隐藏身形。
                    </p>
                </div>
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/毒药瓶.png" alt="毒药瓶" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">毒药瓶</h3>
                    <p class="equipment-desc">
                        携带多种毒药的小型陶瓷瓶，藏于袖口或发簪中。
                        包括"瞬间麻痹"、"无声无息"（窒息毒药）和"黑玫瑰之泪"（清水特制的终极毒药）。
                    </p>
                </div>
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/丝质手套.png" alt="丝质手套" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">丝质手套</h3>
                    <p class="equipment-desc">
                        看似普通的黑色丝质手套，内层涂有防滑药剂，指尖嵌入细小的金属刺，
                        可划破皮肤注入毒药，也可用于攀爬或开锁。
                    </p>
                </div>
                <div class="equipment-card">
                    <div class="equipment-image-container">
                        <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/易容工具包.png" alt="易容工具包" class="equipment-image">
                    </div>
                    <h3 class="equipment-title">易容工具包</h3>
                    <p class="equipment-desc">
                        包含蜡质面具、假发、特殊染料和变声药丸的便携工具包，
                        可让清水在数小时内变身为不同身份的人物，甚至改变声音和气味。
                    </p>
                </div>
            </div>
        </div>

        <!-- 经典语录 -->
        <div id="quotes" class="content-section">
            <h2 class="section-title">经典语录</h2>
            <div class="quotes-container space-y-4">
                <div class="quote-box">
                    <p class="quote-content">
                        "刺客的最高境界，不是让敌人看不见你，而是让他们看见了，却以为是幻觉。"
                    </p>
                    <p class="quote-author">——清水在《刺客守则》中的批注</p>
                </div>
                <div class="quote-box">
                    <p class="quote-content">
                        "真正的毒药，往往不是来自药瓶，而是来自人心。"
                    </p>
                    <p class="quote-author">——清水对学徒的教导</p>
                </div>
                <div class="quote-box">
                    <p class="quote-content">
                        "任务完成后的草莓蛋糕，是对自己最好的奖励。"
                    </p>
                    <p class="quote-author">——清水的私人笔记</p>
                </div>
                <div class="quote-box">
                    <p class="quote-content">
                        "当你的剑不够快时，就用你的智慧；当你的智慧不够用时，就用你的毒药。"
                    </p>
                    <p class="quote-author">——清水的战术格言</p>
                </div>
            </div>
        </div>

        <!-- 参考文献 -->
        <div id="references" class="content-section">
            <h2 class="section-title">参考文献</h2>
            <ol class="references-list pl-5 space-y-2">
                <li class="reference-item">《暗影之牙秘史》，龙焰王国皇家档案馆藏</li>
                <li class="reference-item">《皇家刺客战术手册》，第十版</li>
                <li class="reference-item">《龙焰王朝编年史》，卷五</li>
                <li class="reference-item">《刺客列传》，民间抄本</li>
                <li class="reference-item">《毒药与解药》，宫廷御医手记</li>
                <li class="reference-item">《黑玫瑰的足迹》，未署名手稿</li>
            </ol>
        </div>
    </article>
</main>

<!-- 回到顶部按钮 -->
<a href="#" class="back-to-top transition-all duration-300">
    <i class="fas fa-arrow-up"></i>
</a>

<!-- 美化后的页脚 -->
<footer class="bg-gray-900 text-gray-300 py-12 border-t-4 border-rose-600">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-4 gap-8 lg:gap-12"> <!-- 修改：移除响应式设置，始终保持4列 -->
            <!-- 关于我们 -->
            <div class="footer-col">
                <h4 class="text-xl font-bold text-white mb-4 pb-2 border-b border-gray-700 relative after:absolute after:bottom-0 after:left-0 after:h-0.5 after:w-1/3 after:bg-rose-500">
                    关于我们
                </h4>
                <p class="text-gray-400 text-sm leading-relaxed hover:text-gray-200 transition-colors duration-300">
                    中世纪王国百科是一个致力于收集和整理龙焰王国及周边地区历史、文化、人物和传说的非营利性项目。我们的使命是通过详实的资料和精美的图文，重现那个充满魔法与骑士精神的时代。
                </p>
            </div>
        </div>
    </div>
</footer>

<script>
    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 100,
                    behavior: 'smooth'
                });
            }
        });
    });

    // 回到顶部按钮显示/隐藏
    const backToTopButton = document.querySelector('.back-to-top');
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            backToTopButton.style.opacity = '1';
        } else {
            backToTopButton.style.opacity = '0';
        }
    });

    // 回到顶部按钮点击事件
    backToTopButton.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // 技能评分动画
    const ratingBars = document.querySelectorAll('.rating-value');
    setTimeout(() => {
        ratingBars.forEach(bar => {
            const width = bar.style.width;
            bar.style.width = '0';
            setTimeout(() => {
                bar.style.width = width;
            }, 300);
        });
    }, 500);
</script>
</body>
</html>
