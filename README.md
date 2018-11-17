### 部署到Openshift  
创建账号后创建Project  
在Project中Deploy image时填入下面的环境变量  
完成Deploy后添加Routes加密选Edge  
更新v2ray-core版本时改环境VER即可  
openshift会自动重新部署  
  
`res/v2ray/config_client.json`是客户端的配置模板  
    
#### 环境变量  
VER=3.26  
UUID=xxx-xxx-xxx  
// web socket 路径  
WSPATH=/v2ray  
// 与Dockerfile中Expose的端口相同  
PORT=8080  
// 每个userid的缓存 (MiB)   
V2RAY_RAY_BUFFER_SIZE=1   
  
### 参考  
https://github.com/jacopomeloni/nginxphpfpm-heroku  
https://github.com/wangyi2005/v2ray-heroku  
https://github.com/v2ray/v2ray-core  
https://github.com/onplus/v2hero  

