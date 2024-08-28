# 使用 Python 3.12 作为基础镜像
FROM python:3.12

# 设置环境变量，确保 Python 输出不被缓存（实时输出日志）
ENV PYTHONUNBUFFERED 1 

# 设置工作目录为 /app
WORKDIR /app

# 将 requirements.txt 文件复制到容器的 /app 目录
COPY requirements.txt /app/requirements.txt

# 在容器内运行 pip 命令来安装依赖项
# --no-cache-dir 标志用于防止 pip 缓存安装包，减少镜像体积
# --upgrade 标志用于升级已安装的软件包
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# 将当前目录下的所有文件复制到容器的 /app 目录
COPY . /app

# 运行数据库迁移
RUN python manage.py makemigrations
RUN python manage.py migrate

# 使用 Gunicorn 运行 Django 应用程序
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "mysite.wsgi:application"]

