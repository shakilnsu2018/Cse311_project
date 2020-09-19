insert into cse311_project.owner(owner_name, address) values ('srk', 'India, mumbai');
select * from cse311_project.owner;
insert into cse311_project.team(team_name, owner_id)
values ('Srk Team', 1);

insert into cse311_project.role(role_desc) values ('Bowler');
select * from cse311_project.role;

insert into cse311_project.role(role_desc) values ('Water distributor');

insert into cse311_project.support_staff(team_id, role_id) values (1,2);

insert into cse311_project.venue(venue_name, city) values ('Nsu', 'Dhaka');

insert into cse311_project.`match`( team_id, venue_id, datetime, result) values (1,1, now()-10, 'Win');

select * from cse311_project.`match`;

insert into cse311_project.score(match_id, runs, wickets, catches) values (1, 100, 5, 3);

insert into cse311_project.player(player_name, team_id, role_id, jersey_number, score_id) values ('Md Shohan Hossain',1, 1, 10, 1);



