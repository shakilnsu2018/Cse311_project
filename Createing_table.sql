CREATE table cse311_project.owner(
    owner_id INT primary key auto_increment,
    owner_name varchar(200) not null,
    address varchar(400) not null
);

create table cse311_project.team(
    team_id INT primary key auto_increment,
    team_name varchar(200) not null ,
    created_at DATETIME not null default now(),
    owner_id int not null,
    FOREIGN KEY (owner_id)
                 references owner (owner_id)
                 on delete cascade
);

drop table cse311_project.support_staff;

create table cse311_project.support_staff(
    support_staff_id int primary key auto_increment,
    team_id int not null,
    foreign key (team_id)
                references team (team_id)
                on delete cascade,
    role_id int not null,
    foreign key (role_id)
                references role (role_id)
                on delete no action
);

create table cse311_project.role(
    role_id int primary key auto_increment,
    role_desc varchar(300) not null
);

create table cse311_project.venue(
    venue_id int primary key auto_increment,
    venue_name varchar(200) not null,
    city varchar(200) not null
);


create table cse311_project.match(
  match_id int primary key auto_increment,
  team_id int not null,
  foreign key (team_id)
              references team (team_id)
                                 on DELETE cascade,
    venue_id int not null,
  foreign key (venue_id)
              references venue (venue_id)
                                 on DELETE cascade,

    datetime DATETIME not null,
    result varchar(200)
);


create table cse311_project.score(
    score_id int primary key auto_increment,
    match_id int not null,
  foreign key (match_id)
              references cse311_project.match (match_id)
                                 on DELETE cascade,
    runs int(100) not null,
    wickets int(100),
    catches int(100)


);



create table cse311_project.player(
    player_id int primary key auto_increment,
    player_name varchar(200) not null ,
    team_id int not null ,
    foreign key (team_id) references team (team_id)
                                  on delete cascade,

    role_id int not null ,
    foreign key (role_id) references role (role_id)
                                  on delete no action,
    jersey_number int not null,

    score_id int not null,
    foreign key (score_id)
              references score (score_id)
                                 on DELETE no action

);



