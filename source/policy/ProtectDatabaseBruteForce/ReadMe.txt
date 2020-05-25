适用场景：
暴力破解：利用大量猜测和穷举的方式来尝试获取用户口令的攻击方式，如果身份验证模块设计的不好攻击者可以利用自动 化攻击进行暴力破解，大大增加了密码被破解的风险。 撞库：撞库是一种针对数据库的攻击方式，方法是通过攻击者所拥有的数据库的口令攻击目标数据库，可以理解为用户在A 网站被盗的账户密码来登陆B网站。很多用户在不同网站使用的是相同的账号密码，因此可以起到获取用户在B网站的用户账 户从而达到攻击目的。 FortiWeb可以针对登录行为进行持续监控，如果检测到多次登录错误后会将账号进行锁定，或者是某IP频繁进行登录操作会 将IP封禁。同时，FortiWeb会检测攻击者使用的口令是否为威胁情报库中所收集过的被公开泄露的口令，如果命中，则直接 判定为撞库攻击并进行阻断。


使用方法：
在 ProtectDatabaseBruteForce.txt 文件中搜索^\\/login\\.php$，将其替换为你将要保护的网站登陆的验证url，然后在 ProtectDatabaseBruteForce.txt 全选所有内容（注意：包括文档末尾的空行）,SSH登陆成功登陆FortiWeb之后，右键黏贴即可。

命令样例：
ssh -i ~/zhy.pem admin@161.189.x.x > /dev/null 2>&1 < ProtectDatabaseBruteForce.txt

URL替换举例：
原有内容:  ^\\/login\\.php$    匹配的url为: /login.php

修改之后内容：\\/your_dir\\/your_file\\.jsp$"   匹配的url为: /your_dir/your_file.jsp
