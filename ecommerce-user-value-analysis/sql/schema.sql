-- 黑五交易明细表结构（示例）
-- 与 Kaggle Black Friday 数据集字段保持一致
CREATE TABLE black_friday_sales (
    User_ID                     INTEGER,   -- 用户 ID
    Product_ID                  VARCHAR(32), -- 商品 ID
    Gender                      VARCHAR(8),  -- 性别 F/M
    Age                         VARCHAR(16), -- 年龄段
    Occupation                  INTEGER,   -- 职业编码 0-20
    City_Category               VARCHAR(8),  -- 城市类别 A/B/C
    Stay_In_Current_City_Years  VARCHAR(8),  -- 当前城市居住年数
    Marital_Status              INTEGER,   -- 婚姻状态 0/1
    Product_Category_1          INTEGER,   -- 主商品类别
    Product_Category_2          INTEGER,   -- 次商品类别（大量缺失）
    Product_Category_3          INTEGER,   -- 次商品类别（大量缺失）
    Purchase                    INTEGER    -- 购买金额
);
