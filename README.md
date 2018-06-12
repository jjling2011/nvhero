### 部署到Openshift  
创建账号后创建Project  
在Project中Deploy image时填入下面的变量  
完成Deploy后添加Routes  
  
#### 全局变量  
VER=3.18  
UUID=xxx-xxx-xxx  
WSPATH=/v2ray  // ws路径  
PORT=8080 // 与Dockerfile中Expose的端口相同    
V2RAY_RAY_BUFFER_SIZE=1 // 缓存（MB）  
  
### 参考  
https://github.com/jacopomeloni/nginxphpfpm-heroku  
https://github.com/wangyi2005/v2ray-heroku  
https://github.com/v2ray/v2ray-core  
https://github.com/onplus/v2hero  
