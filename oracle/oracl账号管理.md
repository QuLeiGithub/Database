## oracl账号管理

#### 使用scott用户登陆，第一次登陆时会显示账号锁定，需要将账号解锁：

* 使用DBA登陆

  运行命令行工具    ：  

  ​	`sqlplis /nolog;conn    `

  `sys/tiger@QuLei    as sysdba;`  管理员的身份登陆

* 解锁命令

  `alter user scott account unlock | lock;`  解锁用户

* 登陆

  `conn scott/tiger@QuLei;`

     

  

  





