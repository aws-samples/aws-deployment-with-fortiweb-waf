适用场景：
盗链是指网站不提供自身的Web内容，而是直接嵌入其它网站的页面或元素，向终用户展示盗取的内容，骗取终用户的 浏览和点击率。网站被盗链会大量消耗自身网站的带宽，同时几乎没有产生有效点击率，严重损害了被盗链网站的利益。通过在 FortiWeb上检查来源请求的Referer字段，判断来源页面或访问者，从而决定访问的合法性，实现网站防盗链。 


使用方法：
在 ProtectHotlinking.txt 文件中搜索 ^http(s)?\\:\\/\\/[^\\/]*\\.example\\.com\\/，将其替换为你将要保护的网站的主域名，然后在 08ProtectHotlinking.txt 全选所有内容（注意：包括文档末尾的空行）,SSH登陆成功登陆FortiWeb之后，右键黏贴即可。

命令样例：
ssh -i ~/zhy.pem admin@161.189.x.x > /dev/null 2>&1 < ProtectHotlinking.policy

URL替换举例：
原有内容:  ^http(s)?\\:\\/\\/[^\\/]*(.)?example\\.com\\/      匹配的referer: http或者https://******example.com/****/***

修改之后内容：^http(s)?\\:\\/\\/[^\\/]*(.)?baidu\\.com\\/   匹配的referfer: http或者https://******bing.com/****/***
