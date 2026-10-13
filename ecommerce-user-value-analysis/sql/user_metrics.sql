-- 用户行为与价值分析 SQL
-- 示例基于 black_friday_sales 表

-- 1) 整体规模与客单价
SELECT
    COUNT(DISTINCT User_ID)                            AS total_users,
    COUNT(*)                                           AS total_orders,
    SUM(Purchase)                                      AS total_gmv,
    ROUND(SUM(Purchase) * 1.0 / COUNT(*), 2)           AS avg_order_value
FROM black_friday_sales;

-- 2) 用户维度购买频次与消费金额分布
SELECT
    User_ID,
    COUNT(*)              AS order_count,
    SUM(Purchase)         AS total_amount,
    ROUND(AVG(Purchase), 2) AS avg_amount
FROM black_friday_sales
GROUP BY User_ID
ORDER BY total_amount DESC
LIMIT 20;

-- 3) 高价值用户（频次与金额双高）分层
WITH user_stats AS (
    SELECT
        User_ID,
        COUNT(*)              AS order_count,
        SUM(Purchase)         AS total_amount
    FROM black_friday_sales
    GROUP BY User_ID
)
SELECT
    User_ID,
    order_count,
    total_amount,
    CASE
        WHEN order_count >= 20 AND total_amount >= 200000 THEN '核心高价值'
        WHEN order_count >= 10 THEN '潜力用户'
        ELSE '普通用户'
    END AS value_segment
FROM user_stats
ORDER BY total_amount DESC
LIMIT 20;

-- 4) 分人群消费画像（性别 / 年龄段 / 城市）
SELECT
    Gender,
    COUNT(DISTINCT User_ID)  AS users,
    SUM(Purchase)            AS total_gmv,
    ROUND(AVG(Purchase), 2)  AS avg_order_value
FROM black_friday_sales
GROUP BY Gender;

SELECT
    Age,
    COUNT(DISTINCT User_ID)  AS users,
    SUM(Purchase)            AS total_gmv
FROM black_friday_sales
GROUP BY Age
ORDER BY Age;

SELECT
    City_Category,
    COUNT(DISTINCT User_ID)  AS users,
    SUM(Purchase)            AS total_gmv
FROM black_friday_sales
GROUP BY City_Category
ORDER BY City_Category;

-- 5) 商品类别渗透率（主类别）
SELECT
    Product_Category_1,
    COUNT(DISTINCT User_ID)  AS buyers,
    SUM(Purchase)            AS total_gmv
FROM black_friday_sales
GROUP BY Product_Category_1
ORDER BY total_gmv DESC
LIMIT 20;
