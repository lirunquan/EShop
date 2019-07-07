# EShop

数据库：`MySQL`
需要通过 `python3` 安装工具进行安装依赖，

```sh
pip3 install -r requirements.txt
```
`requirements.txt`中包含
>Django==2.2.2<
Pillow
python-alipay-sdk
django-mysql
PyMySQL
django-restframework
pytz

启动前先给 `run.sh` 赋予权限</p>
```sh
chmod a+x run.sh
```
然后直接运行 run.sh 
```sh
./run.sh
```
服务器运行日志打印在 `nohup.out` 中
