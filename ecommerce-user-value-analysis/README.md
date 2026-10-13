# 电商用户消费行为与价值分析

基于 Kaggle Black Friday 数据集的电商用户消费行为与高价值用户识别项目，面向「电商用户增长 / 商业分析」方向。

## 业务问题

- 哪些用户是平台的高价值用户？如何刻画他们的画像？
- 不同人群（性别、年龄、职业、城市、婚育状态）的消费行为有什么差异？
- 商品之间是否存在可以被运营利用的搭配购买规律？

## 数据来源

- Kaggle Black Friday Dataset，约 78 万条交易记录。
- 字段：`User_ID`、`Product_ID`、`Gender`、`Age`、`Occupation`、`City_Category`、`Stay_In_Current_City_Years`、`Marital_Status`、`Product_Category_1/2/3`、`Purchase`。
- 数据仅包含一次促销窗口的交易快照，没有时间戳与浏览 / 加购等行为链路。

## 分析方法

- 数据清洗、缺失处理与字段重编码。
- 按用户维度聚合购买频次与消费金额，开展分组对比与可视化。
- 相关性热力图探索字段间关系。
- 高价值用户识别：以「频次 + 金额」双高定义正样本，使用逻辑回归与决策树分类并评估。
- 商品关联规则：Apriori 算法挖掘产品组合模式。

## 关键发现

- 男性购买量高于女性；36–45 岁是核心消费人群。
- 职业 1、4、6 的用户购物较多，城市 C 购买量领先。
- 多数用户在当前城市居住 1–2 年；未婚与已婚整体差异不明显。
- 字段间整体相关性较弱；商品购买偏「点对点」，未发现强关联规则。

## 业务建议

- 面向 36–45 岁、城市 C、高频高额男性群体做会员分层与精准触达。
- 对高价值用户优先做复购激励与专属权益，对中等价值用户做频次提升。
- 由于缺少行为链路数据，建议后续补充浏览、加购、留存字段后再做转化与留存分析。

## 局限性

- 单次促销快照，无时间维度，无法计算真正的转化率与留存率。
- 类别字段粒度较粗（职业为编码、城市仅 A/B/C），画像解释受限。
- 分类模型在训练集上的表现偏乐观，结论仅作探索参考。

## 项目结构

```
ecommerce-user-value-analysis/
├── sql/
│   ├── schema.sql          # 表结构定义
│   └── user_metrics.sql    # 用户行为 / 价值分析查询
├── notebooks/
│   └── black_friday_user_value_analysis.ipynb
├── dashboard/
│   └── README.md           # 看板图表设计
├── reports/
│   └── analysis_report.md  # 完整分析报告
├── requirements.txt
└── README.md
```

## 运行方法

```bash
pip install -r requirements.txt
jupyter notebook notebooks/black_friday_user_value_analysis.ipynb
```

从 Kaggle 下载 `train.csv` 与 `test.csv` 放入 `data/` 目录后运行。数据链接：https://www.kaggle.com/datasets/sdolezel/black-friday
