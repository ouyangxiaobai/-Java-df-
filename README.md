# 项目名称

基于Java的高校毕业设计选题管理系统毕业论文+任务书+设计源码+数据库文件+答辩ＰＰＴ

# 系统介绍
本系统功能划分明显，操作简单易懂，其中主要功能如下

用户操作界面简单易懂，在操作过程中有提示信息来帮助用户来迅速完成需要的操作。
2. 管理员虽然也是一个角色，但是是个特殊的用户，其实在数据库中也是由教师信息表来维护，只不过有一个字段是专门来识别是否是管理员。管理员可以注册教师和学生的信息，同时支持Excel表批量注册，只要上传的Excel工作表符合规范要求即可。同时系统提供规范的工作表给管理员下载。
普通用户分为学生角色和教师角色，基本功能都提供了修改个人信息以及密码，学生可以选择、修改、退选课题，老师可以创建、修改、删除课题。课题连接学生和教师的关系，双方可以通过课题来查看对方的信息。

在此提供系统功能结构图，如下所示

# 环境需要

1.运行环境：最好是java jdk 1.8，我们在这个平台上运行的。其他版本理论上也可以。\
2.IDE环境：IDEA，Eclipse,Myeclipse都可以。推荐IDEA;\
3.tomcat环境：Tomcat 7.x,8.x,9.x版本均可\
4.硬件环境：windows 7/8/10 1G内存以上；或者 Mac OS； \
5.数据库：MySql 5.7版本；\
6.是否Maven项目：否；

# 技术栈

1. 后端：Spring+SpringMVC+Mybatis\
2. 前端：JSP+CSS+JavaScript+jQuery

# 使用说明

1. 使用Navicat或者其它工具，在mysql中创建对应名称的数据库，并导入项目的sql文件；\
2. 使用IDEA/Eclipse/MyEclipse导入项目，Eclipse/MyEclipse导入时，若为maven项目请选择maven;\
若为maven项目，导入成功后请执行maven clean;maven install命令，然后运行；\
3. 将项目中springmvc-servlet.xml配置文件中的数据库配置改为自己的配置;\
4. 运行项目，在浏览器中输入http://localhost:8080/ 登录

# 高清视频演示

https://www.bilibili.com/video/BV1DN4y1M7c2/

​