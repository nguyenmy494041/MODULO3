create database StudentMangament
go
create table student(
student_id int primary key,
student_name varchar(50),
student_adress varchar(50),
student_age tinyint
)
go
insert into student (student_id,student_name,student_adress,student_age) values (1,'Long','Tp Hue',18)
insert into student (student_id,student_name,student_adress,student_age) values (3,'Hieu','Q.Tri',20)
insert into student (student_id,student_name,student_adress,student_age) values (2,'Tri','Tp Hue',23)
insert into student (student_id,student_name,student_adress,student_age) values (4,'Hoang','Tp Hue',28)
insert into student (student_id,student_name,student_adress,student_age) values (8,'Hoang','Tp Hue',28)
select* from student
go

delete student where student_name ='Hoang'
select* from student
update student
set student_name ='Nhan',student_age =24
where student_id = 2
select * from student
