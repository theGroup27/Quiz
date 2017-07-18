use Quizzes;

create table if not exists users (
id int(11) not null auto_increment,
username varchar(30) not null,
user_password varchar(64) not null,
salt varchar(40) not null,
is_admin boolean default false,
unique key user_uniq (username),
constraint pk primary key (id)
);

create table if not exists contacts (
id int(11) not null auto_increment,
sender_id int(11) not null,
receiver_id int(11) not null,
are_friends boolean default false,
constraint pk primary key (id),
constraint fk_first_id
foreign key (sender_id) 
	references users(id),
constraint fk_second_id
foreign key (receiver_id) 
	references users(id)
);

create table if not exists messages (
id int(11) not null auto_increment,
sender_id int(11) not null,
receiver_id int(11) not null,
message text default null,
created timestamp default now(),
constraint pk primary key (id),
constraint fk_sender_id
foreign key (sender_id) 
	references users(id),
constraint fk_receiver_id
foreign key (receiver_id) 
	references users(id)
);

create table if not exists quizzes (
id int(11) not null auto_increment,
quiz_name varchar (11) not null,
description varchar(200) default null,
category varchar (30) default null,
is_random boolean default false,
is_one_page boolean default false,
is_correction boolean default false,
creator_id int(11) not null,
constraint pk primary key (id),
constraint fk_creator_id
foreign key (creator_id) 
	references users(id)
);

create table if not exists questions (
id int(11) not null auto_increment,
q_type enum('text_question','fill_in','picture') default null,
q_text varchar (200) default null,
quiz_id int(11) not null,
constraint pk primary key (id),
constraint fk_qz_id
foreign key (quiz_id)
	references quizzes(id)
);

create table if not exists answers (
id int(11) not null auto_increment,
a_type enum('text_response','multiple_choice','multiple_answer') default null,
answer varchar (200) default null,
is_correct boolean default false,
question_id int(11) not null,
constraint pk primary key (id),
constraint fk_quest_id
foreign key (question_id)
	references questions(id)
);

create table if not exists quiz_scores (
id int(11) not null auto_increment,
score decimal(7,3) default null,
elapsed bigint(8) default null,
quiz_id int(11) not null,
user_id int(11) not null,
constraint pk primary key (id),
constraint fk_quiz_id
foreign key (quiz_id)
	references quizzes(id),
constraint fk_user_id
foreign key (user_id)
	references users(id)
);

