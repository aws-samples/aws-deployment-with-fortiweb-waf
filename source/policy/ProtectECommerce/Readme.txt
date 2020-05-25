适用场景：
很多电商类或带有交易和消费属性的网站是业务安全的重灾区，尤其是当业务举办类似定时抢购秒杀活动时，业务接口可能 在短时间承担大量的恶意请求。FortiWeb可以灵活设置攻击防护的限速策略，能够保证业务服务不会因大量的并发访问而崩 溃，同时尽可能地给正常用户提供业务服务。

使用方法：
在ProtectECommerce.txt 文件中搜索\\/market\\/example\\.php$，将其替换为你将要保护的网站url，然后在ProtectECommerce.txt全选所有内容（注意：包括文档末尾的空行）,SSH登陆成功登陆FortiWeb之后，右键黏贴即可。

命令样例：
ssh -i ~/zhy.pem admin@161.189.x.x > /dev/null 2>&1 < ProtectECommerce.txt

URL替换举例：
原有内容:  \\/market\\/example\\.php$    匹配的url为: /market/example.php

修改之后内容：\\/your_dir\\/your_file\\.jsp$"   匹配的url为: /your_dir/your_file.jsp
