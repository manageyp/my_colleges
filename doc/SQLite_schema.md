# SQLite 数据表结构说明

### countries
###  国家

  nick_name  昵称
  real_name  真实名称

*  设置两个名称，主要时为了未来扩展国外数据；目前可以删除一列
*  如美国，nick_name：美国；real_name：American


### provinces
###  省份

  country_id 外键至 countries
  nick_name  昵称
  real_name  真实名称


### cities
###  城市

  province_id 外键至 provinces
  nick_name  昵称
  real_name  真实名称


### majors
###  专业

  parent_id 专业大分类 ID，链接至 majors
  name  专业名称
  code  专业代号
  college_type 专业类型：本科/专业


### major_introductions
###  专业介绍

  major_id 外键至 majors
  content  专业介绍内容


### schools
###  学校

  country_id  所在国家
  province_id  所在省份
  city_id  所在城市
  nick_name  别名
  real_name  真名
  web_site  网址
  found_year  创建年份
  address  地址
  telephone  联系电话
  latitude  纬度
  longitude  经度
  zipcode  邮政编码
  college_type  院校类别
  is_211  是否 211
  is_985  是否 985
  affiliate  院校隶属于
  is_edu_affiliate  是否教育部直属院校
  has_bachelor  设立研究生院
  is_independent  独立学院
  is_civilian_run  民办院校
  key_disciplines  国家重点学科
  master_num  硕士点
  phd_num  博士点
  academician_num  院士人数


### school_introductions
###  学校介绍

  school_id 外键至 schools
  full_content  学校介绍详细内容


### school_photos
###  学校图片

  school_id 外键至 schools
  photo_url  图片存储目录
  is_avatar  是否为头像，默认为是


### score_lines
###  地区录取分数线

  name  分数线名称
  province_id  省份
  syear  年份
  smajor  文科/理科/综合
  batch  录取阶段：第一/二/三批
  score  分数
