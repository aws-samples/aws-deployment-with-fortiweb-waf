使用场景：
FortiWeb通过对HTTP/HTTPS请求进行检测，识别并阻断SQL注入、跨站脚本攻击、网页木马上传、命令/代码注入、文件 包含、敏感文件访问、第三方应用漏洞攻击、CC攻击、恶意爬虫扫描、跨站请求伪造等常见针对网站的攻击手段。


使用方法：
在GeneralWebSiteProtect.txt全选所有内容（注意：包括文档末尾的空行）,SSH登陆成功登陆FortiWeb之后，右键黏贴即可。

命令样例：
ssh -i ~/zhy.pem admin@161.189.x.x > /dev/null 2>&1 < GeneralWebSiteProtect.txt