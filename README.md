# 简介
提供一种通过http请求的方式来获得目标网址截屏的方法，基于cutycapt，做http封装

## 启动
./app -host 127.0.0.1:9066

## 使用
http://127.0.0.1:9066/?url=<encoded_url>[&width=1024][&height=768]

- 参数encoded_url，如果URL缺少http:// 或 https:// 协议描述串，将等价于http://
- 参数width，图片最小宽度，可选，默认是1024
- 参数height，图片最小高度，可选，默认是768

## 示例

http://127.0.0.1:9066/?url=www.baidu.com

or

http://127.0.0.1:9066/?url=http:%2f%2fwww.baidu.com
