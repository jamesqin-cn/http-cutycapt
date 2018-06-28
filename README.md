# Intro
提供一种通过http请求的方式来获得目标网址截屏的方法，基于cutycapt，做http封装

# Usage
./app -url=<encoded_url>
> 缺少http:// 或 https:// 协议描述串，将等价于http://


Example:

./app -url=www.baidu.com

or

./app -url=http:%2f%2fwww.baidu.com
