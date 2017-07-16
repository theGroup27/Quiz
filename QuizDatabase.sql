use Quizzes;

create table if not exists users (
id int(11) not null auto_increment,
username varchar(30) not null,
user_password varchar(64) not null,
salt varchar(40) not null,
achievement enum('amateur','profilic','prodigious','quiz_machine','greatest','practice') default null,
is_admin boolean default false,
unique key pass_uniq (user_password),
unique key user_uniq (username),
constraint pk primary key (id)
);

create table if not exists contacts (
sender_id int(11) not null,
receiver_id int(11) not null,
are_friends boolean default false,
constraint fk_first_id
foreign key (sender_id) 
	references users(id),
constraint fk_second_id
foreign key (receiver_id) 
	references users(id)
);

create table if not exists messages (
sender_id int(11) not null,
receiver_id int(11) not null,
message text default null,
constraint fk_sender_id
foreign key (sender_id) 
	references users(id),
constraint fk_receiver_id
foreign key (receiver_id) 
	references users(id)
);

create table if not exists quizzes (
id int(11) not null auto_increment,
url_id varchar (11) default null,
quiz_name varchar (11) not null,
description varchar(200) default null,
category varchar (30) default null,
is_random boolean default false,
is_one_page boolean default false,
is_correction boolean default false,
creator_id int(11) not null,
unique key url_uniq (url_id),
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
a_type enum('text_response','multiple') default null,
answer varchar (200) default null,
is_correct boolean default false,
question_id int(11) not null,
constraint pk primary key (id),
constraint fk_quest_id
foreign key (question_id)
	references questions(id)
);

create table if not exists quiz_scores (
score int(11) default null,
elapsed_time time default null,
quiz_id int(11) not null,
user_id int(11) not null,
constraint fk_quiz_id
foreign key (quiz_id)
	references quizzes(id),
constraint fk_user_id
foreign key (user_id)
	references users(id)
);

