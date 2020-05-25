使用场景：
CC（ChallengeCollapsar，挑战黑洞）攻击是DDoS攻击的一种类型，使用代理服务器向受害服务器发送大量貌似合法的请 求。FortiWeb基于HTTP访问请求频率/TCP连接频率/人机识别等综合智能分析有效拦截CC攻击。

使用方法：
在 ProtectDDoS.txt 全选所有内容（注意：包括文档末尾的空行）,SSH登陆成功登陆FortiWeb之后，右键黏贴即可。

命令样例：
ssh -i ~/zhy.pem admin@161.189.x.x > /dev/null 2>&1 < ProtectDDoS.txt