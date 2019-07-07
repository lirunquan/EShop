# EShop

数据库：`MySQL`

需要通过 `python3` 安装工具进行安装依赖，

```sh
pip3 install -r requirements.txt
```
`requirements.txt`中包含

><p>Django==2.2.2</p>
><p>Pillow</p>
><p>python-alipay-sdk</p>
><p>django-mysql</p>
><p>PyMySQL</p>
><p>django-restframework</p>
><p>pytz</p>

启动前先给 `run.sh` 赋予权限</p>
```sh
chmod a+x run.sh
```
然后直接运行 run.sh 
```sh
./run.sh
```
服务器运行日志打印在 `nohup.out` 中
