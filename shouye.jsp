<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>中世纪王国 - 主页</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        /* 基础样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Times New Roman', serif;
            color: #33261a;
        }

        body {
            background-image: url('/images/gongchangsheng.jpg');
            background-size: cover;
            background-color: #f0e6d2;
            scroll-behavior: smooth;
        }

        /* 页眉样式 */
        .medieval-header {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
            padding: 1rem;
            border-bottom: 2px solid #8b572a;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .crest-container {
            display: flex;
            align-items: center;
            gap: 1rem;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .main-crest {
            width: 80px;
            height: 80px;
        }

        .medieval-nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .medieval-nav a {
            text-decoration: none;
            font-weight: bold;
            color: #33261a;
            position: relative;
        }

        .medieval-nav a:hover::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -4px;
            width: 100%;
            height: 2px;
            background-color: #8b572a;
        }

        /* 主内容样式 */
        .hero-banner {
            height: 400px;
            background-image: url('/images/shusanlu.jpg');
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin: 2rem 0;
            position: relative;
        }

        .parchment-bg {
            background: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .cta-button {
            display: inline-block;
            background-color: #8b572a;
            color: white;
            padding: 0.8rem 2rem;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 1rem;
            transition: background-color 0.3s;
        }

        .cta-button:hover {
            background-color: #6e4519;
        }

        .content-section {
            margin: 2rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.6s ease-out;
        }

        .content-section.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .section-title {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            color: #33261a;
            border-bottom: 2px solid #8b572a;
            padding-bottom: 0.5rem;
        }

        /* 人物网格样式 */
        .character-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .character-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
            position: relative;
            cursor: pointer;
        }

        .character-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }

        .character-image {
            width: 100%;
            height: 200px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            transition: transform 0.5s ease;
        }

        .character-card:hover .character-image {
            transform: scale(1.03);
        }

        .character-info {
            padding: 0 1rem;
        }

        .character-name {
            font-size: 1.6rem;
            margin-bottom: 0.5rem;
            color: #8b572a;
            text-transform: capitalize;
        }

        .character-title {
            font-style: italic;
            color: #66513c;
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }

        .character-bio {
            line-height: 1.8;
            color: #554332;
            text-align: left;
            font-size: 0.95rem;
        }

        /* 装饰元素 */
        .character-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #8b572a;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .character-card:hover::before {
            transform: scaleX(1);
        }

        /* 查看详情提示 */
        .view-detail {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: rgba(139, 87, 42, 0.8);
            color: white;
            padding: 0.5rem 0;
            transform: translateY(100%);
            transition: transform 0.3s ease;
            font-size: 0.9rem;
        }

        .character-card:hover .view-detail {
            transform: translateY(0);
        }

        /* 移动端适配 */
        @media (max-width: 768px) {
            .character-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
                padding: 0;
            }

            .character-image {
                height: 160px;
            }

            .content-section {
                margin: 1rem;
                padding: 1.5rem;
            }

            .medieval-nav ul {
                gap: 1rem;
                font-size: 0.9rem;
            }

            .hero-banner {
                height: 300px;
            }

            .parchment-bg {
                padding: 1.5rem;
            }
        }

        /* 页脚样式 */
        .medieval-footer {
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7));
            padding: 1.5rem;
            text-align: center;
            margin-top: 2rem;
            border-top: 2px solid #8b572a;
        }

        .scroll-top {
            margin-bottom: 1rem;
        }

        .scroll-top a {
            color: #8b572a;
            text-decoration: none;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
<!-- 顶部纹章导航 -->
<header class="medieval-header">
    <div class="crest-container">
        <img src="${pageContext.request.contextPath}/images/龙焰.png" alt="王国纹章" class="main-crest">
        <h1>龙焰王国</h1>
    </div>
    <nav class="medieval-nav">
        <ul>
            <li><a href="#characters">王国人物</a></li>
            <li><a href="#quests">悬赏任务</a></li>
            <li><a href="#about">关于我们</a></li>
        </ul>
    </nav>
</header>

<!-- 主内容区 -->
<main class="medieval-main">
    <!-- 英雄Banner -->
    <section class="hero-banner">
        <div class="parchment-bg">
            <h2>欢迎来到剑与魔法的世界</h2>
            <p>探索古老城堡，斩杀邪恶生物，书写属于你的传奇</p>
            <a href="#quests" class="cta-button">查看悬赏任务</a>
        </div>
    </section>

    <!-- 人物展示网格 -->
    <section id="characters" class="content-section">
        <h3 class="section-title">传奇人物</h3>
        <div class="character-grid">
            <!-- 1. 国王 -->
            <a href="king_leyan.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/Image_1714921715195.jpg" alt="乐颜国王" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">乐颜</h4>
                        <p class="character-title">龙焰王国国王</p>
                        <p class="character-bio">
                            乐颜国王是一位英明的统治者，自登基以来，他致力于维护王国的和平与繁荣。
                            他精通剑术和战略，曾亲自率军击败了北方蛮族的入侵，保卫了王国的边境。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 2. 首席魔法师 -->
            <a href="mage_hezhi.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/hezhi/cedbc94d757c68ddb7b8700e363e942.jpg" alt="盒纸魔法师" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">盒纸</h4>
                        <p class="character-title">皇家首席魔法师</p>
                        <p class="character-bio">
                            盒纸是王国最伟大的魔法师，擅长元素魔法和预言术。他是国王最信任的顾问，
                            经常用她的魔法能力帮助王国解决危机。她的魔法塔位于王都郊外，里面收藏着无数珍贵的魔法典籍。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 3. 骑士团长 -->
            <a href="qingshui.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/beiqimoren/e463a3a7c8c2d65b23b361c55dbbd88.jpg" alt="北柒陌人骑士" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">北柒陌人</h4>
                        <p class="character-title">皇家骑士团团长</p>
                        <p class="character-bio">
                            北柒陌人是王国最精锐的骑士，她的剑技无双，忠诚不二。她率领的皇家骑士团是王国的守护者，
                            负责维护王国内部的秩序和安全。无论是对抗邪恶势力还是执行特殊任务，她和她的骑士们总是冲在最前线。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 4. 荒野游侠 -->
            <a href="ranger_wuxu.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/wuxu/048bad701e877bcb1e1abe4776bbc52.png" alt="无栩游侠" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">无栩</h4>
                        <p class="character-title">荒野游侠首领</p>
                        <p class="character-bio">
                            无栩是边境森林的守护者，擅长追踪与弓箭术。她带领游侠们守护着王国的边境森林，
                            对任何企图入侵的邪恶生物都毫不留情。他的箭袋里永远装着取自魔法橡树的银羽箭。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 5. 迷雾女巫 -->
            <a href="witch_jiuzun.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/jiuzun/98b89d1a6a8c452a7de7198cec22ae7.jpg" alt="九尊女巫" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">九尊</h4>
                        <p class="character-title">迷雾沼泽男巫</p>
                        <p class="character-bio">
                            九尊居住在王国最南端的迷雾沼泽，精通自然魔法与占卜。
                            他行踪神秘，却在王国每次重大危机时现身，用古老的预言指引冒险者走向正确的道路。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 6. 锻造大师 -->
            <a href="blacksmith_muyu.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/muyu/09ebc9db2455065f1d467493585567b.jpg" alt="木鱼锻造大师" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">木鱼</h4>
                        <p class="character-title">王都锻造大师</p>
                        <p class="character-bio">
                            木鱼被誉为“火神之嗣”的赫克托，其锻造坊位于 dormant火山的核心。
                            她锻造时从不使用锤子，而是以龙吼为音波锤炼金属——传说他曾用堕落天使的残骸打造出“审判之剑”，
                            剑身刻有二十八道天使之泪形成的纹路。
                            每打造一件武器，她都会要求使用者立下血誓：“若用此剑屠戮无辜，剑将反噬其主。
                            ”如今他的工坊外堆满了Failed的魔化兵器，这些武器在深夜会发出痛苦的哀嚎。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 7. 吟游诗人 -->
            <a href="bard_rowan.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/bard_rowan.jpg" alt="罗万吟游诗人" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">罗万·风歌</h4>
                        <p class="character-title">流浪吟游诗人</p>
                        <p class="character-bio">
                            背负着“千年记忆”的神秘诗人，其鲁特琴的琴弦由精灵公主的发丝编织而成。
                            他的歌声能唤醒听众前世的碎片——曾有士兵在他的《失落的麦田》中看到自己作为农夫的过去，
                            从而放下武器解甲归田。他的行囊里装着一本空白乐谱，据说每当有伟大的灵魂陨落，
                            乐谱上就会自动浮现出对应的旋律。如今他在寻找传说中的“世界之音”，试图用音乐修补破碎的次元壁垒。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 8. 药剂师 -->
            <a href="alchemist_lilian.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/alchemist_lilian.jpg" alt="莉莉安药剂师" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">莉莉安·夜影</h4>
                        <p class="character-title">神秘药剂师</p>
                        <p class="character-bio">
                            月光森林的“死亡交易者”，其木屋的墙壁由人类头骨砌成，屋顶覆盖着吸血蝙蝠的翅膀。
                            她调配的“返老还童药剂”需要三名纯洁处子的眼泪，而“隐身药剂”的配方包含新生儿的第一声啼哭。
                            曾有贵族为求永生，用自己双胞胎女儿的心脏换取药剂，最终却变成了半人半树的怪物。
                            莉莉安的交易原则只有一条：“你付出的代价，必须等于你所求之物的重量。”
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 9. 灰胡子长老 -->
            <a href="elder_graybeard.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/elder_graybeard.jpg" alt="灰胡子长老" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">阿尔温·灰胡子</h4>
                        <p class="character-title">王国历史学家</p>
                        <p class="character-bio">
                            掌管王国档案馆的老学者，其胡须里藏着无数卷轴碎片。
                            他能看懂古代龙语文字，曾破译出失落的“龙焰法典”，揭示了坦格利安家族与巨龙签订的共生契约。
                            为保护典籍，他在档案馆设置了七十二道魔法屏障，擅自闯入者会被转化为书架上的羊皮纸。
                            如今他正试图复活古代书记官的灵魂，以获取被焚毁的“黑暗世纪”史料。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 10. 猎魔人 -->
            <a href="hunter_sansan.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/sansan/5ecc3c3ec8a68d3159e048244a3dd0a.jpg" alt="三三猎魔人" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">三三</h4>
                        <p class="character-title">恶魔猎手</p>
                        <p class="character-bio">
                            出身于猎魔人家族的三三，左眼被恶魔诅咒而永久失明，却获得了看见灵体的能力。
                            她的武器是太刃“噬灵者”，能将恶魔的灵魂拖入异空间。在“红魔之乱”中，她曾深入地狱裂隙，用自己的心脏作为诱饵，
                            成功封印了恶魔领主阿兹拉。如今她戴着青铜面具隐藏容貌，腰间挂着装有恶魔血液的水晶瓶，这些血液在满月时会发出刺耳的尖啸。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 11. 平民代表 -->
            <a href="villager_elia.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/villager_elia.jpg" alt="艾丽娅平民" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">艾丽娅·麦穗</h4>
                        <p class="character-title">丰收村村长</p>
                        <p class="character-bio">
                            普通农妇出身的艾丽娅，在“饥荒之年”偶然觉醒了自然魔法——她触摸过的枯萎麦田一夜之间重新抽穗。
                            如今她带领村民在边境种植“魔法巨稻”，稻穗颗粒能治愈轻伤。
                            她的围裙口袋里总是装着晒干的薰衣草，据说这是她失踪丈夫留下的唯一遗物。每年秋收节，她会用第一束稻谷编织成女神像，
                            祈求来年风调雨顺。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 12. 皇家刺客 -->
            <a href="qingshui.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/qingshui/清水首页.jpg" alt="清水刺客" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">清水</h4>
                        <p class="character-title">皇家刺客</p>
                        <p class="character-bio">
                            隶属于国王直属的"暗影之牙"组织，其暗杀手法如同鬼魅——目标往往在睡梦中被割破喉咙，
                            床边只留下一朵黑色玫瑰。 在"篡位者之乱"中，她曾伪装成吟游诗人，用毒琴弦勒死了三位叛变的贵族。
                            如今她独来独往，唯一的弱点是对甜食的痴迷。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 新增角色：星星 -->
            <a href="xingxing.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/maoyao/猫妖首页.jpg" alt="锦衣卫星星" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">星星</h4>
                        <p class="character-title">锦衣卫</p>
                        <p class="character-bio">
                            皇帝亲卫"锦衣卫"中的传奇人物，以暗器"流星镖"和轻功"踏星步"闻名。
                            每次执行任务必穿黑色劲装，衣摆绣着金色星辰图案。曾在雨夜中潜入敌营，
                            仅凭十二枚流星镖便瓦解敌方情报网络，全身而退时衣摆未沾一滴雨水。
                            传言他的暗器百发百中，目标往往在看到金光闪烁时已命丧当场。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 新增角色：血刃 -->
            <a href="xueren.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/xueren/血刃首页.jpg" alt="血刃狂战士" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">血刃</h4>
                        <p class="character-title">狂战士</p>
                        <p class="character-bio">
                            来自北方冰原的蛮族战士，手持巨型战斧"碎颅者"。战斗时会陷入狂暴状态，
                            无视伤痛并大幅提升攻击力。曾单枪匹马冲进敌阵，砍杀了敌方将领和他的卫队，
                            斧刃上的血迹从未被清洗，据说能增强武器的威力。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 新增角色：风行者 -->
            <a href="fengxingzhe.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/fengxingzhe/风行者首页.jpg" alt="风行者游侠" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">风行者</h4>
                        <p class="character-title">游侠</p>
                        <p class="character-bio">
                            森林部落的神射手，擅长使用长弓"风语者"。能够精准射中百步之外的目标，
                            箭术之精妙甚至可以在空中改变箭矢轨迹。常年在森林中生活，与自然精灵沟通，
                            可以借助风的力量发动致命一击。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

            <!-- 新增角色：炎魔 -->
            <a href="yanmo.jsp" class="character-link" target="_blank">
                <div class="character-card">
                    <img src="${pageContext.request.contextPath}/images/qinyou/yanmo/炎魔首页.jpg" alt="炎魔法师" class="character-image">
                    <div class="character-info">
                        <h4 class="character-name">炎魔</h4>
                        <p class="character-title">火焰法师</p>
                        <p class="character-bio">
                            出身于魔法学院的天才法师，专精火焰魔法。能够召唤巨大的火焰风暴，
                            甚至可以将周围的空气点燃。曾在一场战役中，用火焰筑起一道城墙阻挡敌军，
                            被称为"行走的火山"。虽然实力强大，但性格孤僻，总是独来独往。
                        </p>
                        <div class="view-detail">
                            <i class="fas fa-external-link-alt"></i> 查看详情
                        </div>
                    </div>
                </div>
            </a>

        </div>
    </section>
</main>
<!-- 页脚 -->
<footer class="medieval-footer">
    <div class="scroll-top">
        <a href="#top"><i class="fas fa-angle-up"></i> 返回顶部</a>
    </div>
    <p>© 999年 龙焰王国版权所有 | 骑士团荣誉出品</p>
</footer>

<!-- 页面滚动动画 -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 页面滚动动画
        const sections = document.querySelectorAll('.content-section');

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1 });

        sections.forEach(section => {
            observer.observe(section);
        });

        // 平滑滚动
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);

                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 80, // 考虑导航栏高度
                        behavior: 'smooth'
                    });
                }
            });
        });

        // 为所有人物卡片添加点击跳转
        document.querySelectorAll('.character-card').forEach(card => {
            card.addEventListener('click', () => {
                const link = card.closest('a');
                if (link) {
                    window.open(link.href, '_blank');
                }
            });
        });
    });
</script>
</body>
</html>
