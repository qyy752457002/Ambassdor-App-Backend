from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.
class User(AbstractUser):
    # 用户名
    first_name = models.CharField(max_length=225)
    # 姓氏
    last_name = models.CharField(max_length=225)
    # 邮箱
    email = models.CharField(max_length=255, unique=True)
    # 密码
    password = models.CharField(max_length=255)
    # 是否是大使
    is_ambassador = models.CharField(max_length=255)
    # 用户名
    username = None

    # 用户名字段
    USERNAME_FIELD = 'email'
    # 必填字段
    REQUIRED_FIELDS = []