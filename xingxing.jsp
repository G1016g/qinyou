<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>星星 - 锦衣卫传奇人物 - 王国百科</title>

    <!-- 自定义主题样式 -->
    <style>
        :root {
            --primary: #000000;       /* 主色调 - 墨黑 */
            --secondary: #FFD700;     /* 星辰金 */
            --neutral: #1A1A1A;       /* 深灰背景 */
            --light-gray: #333333;     /* 浅灰 */
            --border-gray: #444444;    /* 边框色 */
            --star-gold: #FFD700;     /* 星辰金 */
            --shadow-black: #111111;   /* 暗影黑 */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: '微软雅黑', sans-serif;
            color: white;
            scroll-behavior: smooth;
        }

        body {
            background-color: var(--neutral);
            line-height: 1.7;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNyIgaGVpZ2h0PSIxNyI+PHBhdGggZD0iTTEwLjY3IDYuMzFsLS43Ni0uNzZsLS43Ni43NiIgZmlsbD0iIzAwMDAwMCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PHBhdGggZD0iTThBNS4yNEw4LjUgMTguMjhMMTMuNzQgMTMuMDNsLTUuMjQtNS4yNHoiIGZpbGw9IiNGRkQ3MDAiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPjwvc3ZnPg==');
            background-blend-mode: overlay;
            background-size: 1.2rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
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
            color: var(--star-gold);
            font-size: 1.75rem;
            font-weight: bold;
            text-shadow: 0 0 4px rgba(255, 215, 0, 0.5);
            letter-spacing: 1px;
        }

        /* 基本信息横向排列 */
        .basic-info {
            display: flex;
            gap: 2rem;
            margin-top: 2rem;
        }

        .info-box {
            flex: 1;
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.3);
            border: 1px solid var(--border-gray);
        }

        .info-image {
            width: 100%;
            height: 20rem;
            object-fit: cover;
            border-radius: 0.75rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.5);
            border: 2px solid var(--border-gray);
        }

        .info-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .summary {
            flex: 2;
        }

        .section-title {
            font-size: 1.75rem;
            color: var(--star-gold);
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
            background: var(--star-gold);
            bottom: -2px;
            left: 0;
        }

        /* 技能评分 */
        .skill-rating {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 2rem;
            margin: 2rem 0;
        }

        .rating-bar {
            height: 0.625rem;
            background: var(--border-gray);
            border-radius: 1rem;
            overflow: hidden;
        }

        .rating-value {
            background: linear-gradient(90deg, #FFD700, #FFA500);
            height: 100%;
        }

        /* 任务表格 */
        .missions-table {
            width: 100%;
            border-collapse: collapse;
            background: var(--light-gray);
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .missions-table th {
            background: var(--primary);
            color: var(--star-gold);
            padding: 1rem;
            text-align: center;
        }

        /* 装备卡片 */
        .equipment-card {
            background: var(--light-gray);
            border-radius: 1rem;
            padding: 1.5rem;
            text-align: center;
        }

        .equipment-image {
            width: 100%;
            height: 12rem;
            object-fit: cover;
            border-radius: 0.75rem;
            transition: transform 0.3s;
        }

        .equipment-card:hover .equipment-image {
            transform: scale(1.03);
        }

        /* 人际关系卡片样式 */
        .relation-card {
            background: var(--light-gray);
            border-radius: 0.75rem;
            padding: 1.5rem;
            border: 1px solid var(--border-gray);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .relation-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
        }

        .relation-title {
            display: flex;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .relation-icon {
            font-size: 1.5rem;
            margin-right: 0.75rem;
            width: 2rem;
            text-align: center;
        }

        .relation-content {
            font-size: 0.9rem;
            line-height: 1.6;
        }
    </style>

    <!-- 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<header class="container">
    <div class="header-container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/王国logo.png" alt="王国百科">
            <h1>王国百科</h1>
        </div>
        <div class="search-box">
            <input type="text" placeholder="搜索锦衣卫传奇人物...">
            <span class="search-icon fas fa-search"></span>
        </div>
        <div class="user-menu">
            <a href="#"><i class="fas fa-user"></i> 登录</a>
            <a href="#"><i class="fas fa-user-plus"></i> 注册</a>
            <a href="#" class="edit-btn">
                <i class="fas fa-pen"></i> 编辑词条
            </a>
        </div>
    </div>
</header>

<main class="container">
    <article>
        <h1 class="article-title text-center">星星</h1>
        <div class="article-meta text-center">
            <span><i class="fas fa-user-secret"></i>皇帝亲卫指挥使</span>
            <span><i class="fas fa-calendar-alt"></i>活跃于永乐年间</span>
        </div>

        <!-- 基本信息 -->
        <div class="basic-info">
            <div class="info-box">
                <h3 class="info-title text-center">传奇档案</h3>
                <img src="${pageContext.request.contextPath}/images/qinyou/maoyao/24f7afbc2d49c7ef145907d9ca1e558.jpg" alt="星星">
                <div class="info-details">
                    <div>中文名</div>
                    <div>星星</div>
                    <div>代号</div>
                    <div>流星追月</div>
                    <div>职位</div>
                    <div>皇帝亲卫指挥使</div>
                    <div>绝技</div>
                    <div>踏星步、流星镖</div>
                    <div>隶属</div>
                    <div>锦衣卫北镇抚司</div>
                    <div>标志性装备</div>
                    <div>黑金星辰劲装、鎏金流星镖</div>
                    <div>战绩</div>
                    <div>37次绝密任务，0次失手</div>
                </div>
            </div>

            <div class="summary">
                <h2 class="section-title">人物传奇</h2>
                <p>星星，永乐朝锦衣卫传奇人物，皇帝亲卫之首，以"流星追月"之名令敌胆寒。其师传绝技"踏星步"可在檐角瓦楞间借力腾挪，身轻如燕；独门暗器"流星镖"以精铁铸镖身，鎏金星辰纹路为记，出手时金光乍现，例无虚发。</p>
                <p>据《锦衣卫密档》记载，他曾于永乐十三年雨夜潜入瓦剌可汗大帐，以十二枚流星镖精准击杀敌方十二名情报首脑，撤离时衣摆未沾分毫雨水，帐外守卫竟无一人察觉。其"见金即亡"的传说遂成北疆噩梦。</p>
            </div>
        </div>

        <!-- 绝技解析 -->
        <div class="content-section">
            <h2 class="section-title">独门绝技</h2>
            <div class="skill-rating">
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-star text-yellow-500"></i> 踏星步</span>
                        <span>9.9/10</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 99%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-dice-d20 text-yellow-500"></i> 流星镖术</span>
                        <span>10/10</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 100%"></div>
                    </div>
                </div>
                <div class="rating-item">
                    <div class="rating-header">
                        <span><i class="fas fa-eye text-yellow-500"></i> 夜视能力</span>
                        <span>9.5/10</span>
                    </div>
                    <div class="rating-bar">
                        <div class="rating-value" style="width: 95%"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 关键任务 -->
        <div class="content-section">
            <h2 class="section-title">史诗级任务</h2>
            <table class="missions-table">
                <thead>
                <tr>
                    <th>任务名</th>
                    <th>目标</th>
                    <th>时间</th>
                    <th>手段</th>
                    <th>传奇细节</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>夜袭瓦剌帐</td>
                    <td>摧毁敌方情报网</td>
                    <td>永乐十三年</td>
                    <td>流星镖+踏星步</td>
                    <td>在暴雨中完成"九星连珠"式暗杀，十二镖皆中咽喉</td>
                </tr>
                <tr>
                    <td>皇城暗影</td>
                    <td>肃清宫内细作</td>
                    <td>永乐十五年</td>
                    <td>星轨追踪术</td>
                    <td>三日内定位十七名内奸，镖影过处金芒连闪</td>
                </tr>
                <tr>
                    <td>漠北追凶</td>
                    <td>刺杀叛将王猛</td>
                    <td>永乐十七年</td>
                    <td>沙漠奔袭战</td>
                    <td>在沙尘暴中以流星镖穿透三层重甲，创锦衣卫远程击杀纪录</td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- 人际关系 -->
        <div id="relations" class="content-section">
            <h2 class="section-title">人际关系</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

                <!-- 皇权核心关系 -->
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-crown relation-icon" style="color: var(--star-gold);"></i>
                        <span>明成祖朱棣</span>
                    </div>
                    <p class="relation-content">
                        直接效忠对象，被授予"见驾不拜"特权。据《明史拾遗》记载，星星曾在漠北之战中以肉身挡箭救驾，其劲装后背至今留存箭痕（藏于锦衣卫密库）。皇帝特许其暗器可刻皇家星纹，足见信任之深。
                    </p>
                </div>

                <!-- 师门传承关系 -->
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-user-tie relation-icon" style="color: var(--light-gray);"></i>
                        <span>"北斗"陈夜</span>
                    </div>
                    <p class="relation-content">
                        前锦衣卫指挥使，星星的授业恩师。相传其自创"踏星步"时观星七昼夜，最终在紫禁城檐角演练成功。陈夜晚年退隐前，将毕生暗器心得刻于《流星秘录》交于星星，该书现藏于北镇抚司地宫。
                    </p>
                </div>

                <!-- 敌对势力关系 -->
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-skull-crossbones relation-icon" style="color: #FF4444;"></i>
                        <span>瓦剌"暗影三鹫"</span>
                    </div>
                    <p class="relation-content">
                        漠北三大顶级刺客，与星星有"九星镖杀"之约。永乐十五年，三人合谋在居庸关设伏，却反被星星以"三星连射"破局——左眼被镖划伤的"血鹫"余生皆戴铁眼罩，成为瓦剌刺客的耻辱象征。
                    </p>
                </div>

                <!-- 隐秘协作关系 -->
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-eye-dropper relation-icon" style="color: #66CCFF;"></i>
                        <span>钦天监主簿李淳</span>
                    </div>
                    <p class="relation-content">
                        表面为观星文官，实为星星的情报暗线。两人以"星象异变"为暗号传递密报，李淳曾为星星特制"月相镖囊"——可根据月相自动调整镖身角度，提升夜间命中率至九成以上。
                    </p>
                </div>

                <!-- 情感羁绊关系 -->
                <div class="relation-card">
                    <div class="relation-title">
                        <i class="fas fa-heart relation-icon" style="color: #FF9999;"></i>
                        <span>江南绣娘沈月</span>
                    </div>
                    <p class="relation-content">
                        苏州云锦坊主之女，与星星有指腹为婚之约。因深知锦衣卫生涯必死，星星从未敢认亲，仅暗中托人送回十二箱西域金线——每箱金线中藏一枚未开刃的流星镖，寓意"星芒护卿，永不沾血"。
                    </p>
                </div>

            </div>
        </div>

        <!-- 传奇装备 -->
        <div class="content-section">
            <h2 class="section-title">传奇装备</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="equipment-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/maoyao/鎏金流星镖.png" alt="流星镖" class="equipment-image">
                    <h3>鎏金流星镖</h3>
                    <p>每枚镖重三钱七分，表面刻二十八星宿图，内藏"见血封喉"剧毒。发射时旋转带起金芒，如流星划夜空。</p>
                </div>
                <div class="equipment-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/maoyao/踏星步云靴.png" alt="踏星靴" class="equipment-image">
                    <h3>踏星步云靴</h3>
                    <p>以鲨鱼皮鞣制鞋面，鞋底嵌九枚青铜星钉，可在垂直墙面借力弹跳，最高可跃三丈有余。</p>
                </div>
                <div class="equipment-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/maoyao/黑金星辰劲装.png" alt="星辰劲装" class="equipment-image">
                    <h3>黑金星辰劲装</h3>
                    <p>采用西域进贡的"天蚕丝"织造，轻如鸿毛却刀枪难入，衣摆绣北斗七星图案，夜间可反光迷惑敌人。</p>
                </div>
            </div>
        </div>

        <!-- 民间传说 -->
        <div class="content-section">
            <h2 class="section-title">民间传说</h2>
            <ul class="skills-list space-y-2 pl-5">
                <li><i class="fas fa-star text-yellow-500"></i> 有人曾见其在月下演练镖术，十二枚镖竟在空中排成北斗阵型，久久不落</li>
                <li><i class="fas fa-star text-yellow-500"></i> 瓦剌人传言，星星的眼睛能看见星辰轨迹，故能预判敌人动向</li>
                <li><i class="fas fa-star text-yellow-500"></i> 京中孩童流传歌谣："金芒闪，流星现，贪官污吏心胆寒"</li>
            </ul>
        </div>
    </article>
</main>

<a href="#" class="back-to-top">
    <i class="fas fa-arrow-up"></i>
</a>

<footer class="bg-gray-900 py-6">
    <div class="container text-center">
        <p>© 王国百科 | 皇帝亲卫指挥使司监制</p>
    </div>
</footer>

<script>
    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            window.scrollTo({
                top: document.querySelector(this.getAttribute('href')).offsetTop - 80,
                behavior: 'smooth'
            });
        });
    });

    // 回到顶部按钮
    const backToTop = document.querySelector('.back-to-top');
    window.addEventListener('scroll', () => {
        backToTop.style.opacity = window.scrollY > 300 ? '1' : '0';
    });

    // 卡片悬停效果
    document.querySelectorAll('.relation-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-5px)';
            card.style.boxShadow = '0 8px 24px rgba(0, 0, 0, 0.4)';
        });
        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0)';
            card.style.boxShadow = 'none';
        });
    });
</script>
</body>
</html>