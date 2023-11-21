#!/bin/bash

smolsetlvl Несекретно ДСП Секретно СовСекретно
# Создание групп
groupadd otdel1
groupadd otdel2

# Создание пользователей
useradd Timashkov
useradd Verin
useradd Stolyarov-Nikitin

# Назначение уровней доступа пользователям
smolsetusr admin1 СовСекретно
smolsetusr Timashkov СовСекретно
smolsetusr Verin Секретно
smolsetusr Stolyarov-Nikitin ДСП

# Добавление пользователей в группы
usermod -aG otdel1,otdel2 admin1
usermod -aG otdel1 Timashkov
usermod -aG otdel1 Verin
usermod -aG otdel2 Stolyarov-Nikitin

# Назначение категорий доступа для пользователей
smolsetcat admin1 танки,самолёты,ракеты
smolsetcat Timashkov танки,самолёты
smolsetcat Verin самолёты
smolsetcat Stolyarov-Nikitin ракеты

# Создание директорий
mkdir -p /mnt/Проекты/Танки/СовСекретно
mkdir -p /mnt/Проекты/Танки/Секретно
mkdir -p /mnt/Проекты/Танки/ДСП
mkdir -p /mnt/Проекты/Танки/Несекретно
mkdir -p /mnt/Проекты/Самолёты/СовСекретно
mkdir -p /mnt/Проекты/Самолёты/Секретно
mkdir -p /mnt/Проекты/Самолёты/ДСП
mkdir -p /mnt/Проекты/Самолёты/Несекретно
mkdir -p /mnt/Проекты/Ракеты/СовСекретно
mkdir -p /mnt/Проекты/Ракеты/Секретно
mkdir -p /mnt/Проекты/Ракеты/ДСП
mkdir -p /mnt/Проекты/Ракеты/Несекретно

# Создание файлов с содержимым
echo "Содержимое файла Танки" > /mnt/Проекты/Танки/СовСекретно/file1.txt
echo "Содержимое файла Танки" > /mnt/Проекты/Танки/Секретно/file1.txt
echo "Содержимое файла Танки" > /mnt/Проекты/Танки/ДСП/file1.txt
echo "Содержимое файла Танки" > /mnt/Проекты/Танки/Несекретно/file1.txt
echo "Содержимое файла Самолёты" > /mnt/Проекты/Самолёты/СовСекретно/file1.txt
echo "Содержимое файла Самолёты" > /mnt/Проекты/Самолёты/Секретно/file1.txt
echo "Содержимое файла Самолёты" > /mnt/Проекты/Самолёты/ДСП/file1.txt
echo "Содержимое файла Самолёты" > /mnt/Проекты/Самолёты/Несекретно/file1.txt
echo "Содержимое файла Ракеты" > /mnt/Проекты/Ракеты/СовСекретно/file3.txt
echo "Содержимое файла Ракеты" > /mnt/Проекты/Ракеты/Секретно/file3.txt
echo "Содержимое файла Ракеты" > /mnt/Проекты/Ракеты/ДСП/file3.txt
echo "Содержимое файла Ракеты" > /mnt/Проекты/Ракеты/Несекретно/file3.txt

#Настройка прав доступа:
chmod 700 /mnt/Проекты
chown root:otdel2 /mnt/Проекты/Ракеты
chown root:otdel1 /mnt/Проекты
chown root:otdel1 /mnt/Проекты/Танки /mnt/Проекты/Самолёты

#Настройка мандатных уровней доступа
smolsetlvl -d Несекретно /mnt/Проекты/Танки/Несекретно /mnt/Проекты/Самолёты/Несекретно /mnt/Проекты/Ракеты/Несекретно
smolsetlvl -d ДСП /mnt/Проекты/Танки/ДСП /mnt/Проекты/Самолёты/ДСП /mnt/Проекты/Ракеты/ДСП
smolsetlvl -d Секретно /mnt/Проекты/Танки/Секретно /mnt/Проекты/Самолёты/Секретно /mnt/Проекты/Ракеты/Секретно
smolsetlvl -d СовСекретно /mnt/Проекты/Танки/СовСекретно /mnt/Проекты/Самолёты/СовСекретно /mnt/Проекты/Ракеты/СовСекретно

#Настройка категорий доступа:
smolsetlvl -c "Танки" /mnt/Проекты/Танки
smolsetlvl -c "Самолёты" /mnt/Проекты/Самолёты
smolsetlvl -c "Ракеты" /mnt/Проекты/Ракеты