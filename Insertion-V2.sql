

insert into cse311_project.owner(owner_name, address) values ('Md Shakil Hossain', 'Pabna, autapare');
insert into cse311_project.owner(owner_name, address) values ('Farha tasnur mim', 'Uttora, Dhaka');

select * from cse311_project.owner;

insert into cse311_project.team(team_name, owner_id)
values ('MSH Team', (select owner_id from cse311_project.owner where owner_name like '%Shakil%' limit 1));


insert into cse311_project.team(team_name, owner_id)
values ('MSH Team', (select owner_id from cse311_project.owner where owner_name like '%Farha%' limit 1));

update cse311_project.team set team_name = 'FTM Team' where owner_id =
(select owner_id from cse311_project.owner where owner_name like '%Farha%' limit 1);

select * from cse311_project.team;

insert into cse311_project.role(role_desc) values ('Score monitoring');
select * from cse311_project.role;

insert into cse311_project.role(role_desc) values ('Water distributor');

insert into cse311_project.support_staff(team_id, role_id)
values ((select team_id from cse311_project.team where team_name = 'FTM Team' limit 1)
,(select role_id from cse311_project.role where role_desc = 'Water distributor' limit 1));

insert into cse311_project.support_staff(team_id, role_id)
values ((select team_id from cse311_project.team where team_name = 'MSH Team' limit 1)
,(select role_id from cse311_project.role where role_desc = 'Water distributor' limit 1));



insert into cse311_project.support_staff(team_id, role_id)
values ((select team_id from cse311_project.team where team_name = 'MSH Team' limit 1)
,(select role_id from cse311_project.role where role_desc = 'Score monitoring' limit 1));



insert into cse311_project.support_staff(team_id, role_id)
values ((select team_id from cse311_project.team where team_name = 'FTM Team' limit 1)
,(select role_id from cse311_project.role where role_desc = 'Score monitoring' limit 1));


insert into cse311_project.support_staff(team_id, role_id)
values ((select team_id from cse311_project.team where team_name = 'Srk Team' limit 1)
,(select role_id from cse311_project.role where role_desc = 'Score monitoring' limit 1));

select * from cse311_project.support_staff;

select support_staff_id, t.team_name, r.role_desc from cse311_project.support_staff s join
    cse311_project.role r on s.role_id = r.role_id join
    cse311_project.team t on s.team_id = t.team_id;


insert into cse311_project.venue(venue_name, city) values ('Aiub', 'Dhaka');
insert into cse311_project.venue(venue_name, city) values ('Iub', 'Dhaka');

select * from cse311_project.venue;

select * from cse311_project.team;

insert into cse311_project.`match`( team_id, venue_id, datetime, result)
 values ((select team_id from cse311_project.team where team_name like 'MSH%' limit 1),
         (select venue_id from cse311_project.venue where venue_name like '%Aiub%' limit 1),
         now()-100 * 12, 'lose');

insert into cse311_project.`match`( team_id, venue_id, datetime, result)
 values ((select team_id from cse311_project.team where team_name like 'FTM%' limit 1),
         (select venue_id from cse311_project.venue where venue_name like '%Aiub%' limit 1),
         now()-100 * 12, 'Win');

insert into cse311_project.`match`( team_id, venue_id, datetime, result)
 values ((select team_id from cse311_project.team where team_name like 'FTM%' limit 1),
         (select venue_id from cse311_project.venue where venue_name like '%Nsu%' limit 1),
         DATE_SUB(now(), interval 10 day), 'Win');

select * from cse311_project.`match`;

select match_id, t.team_name, venue_name, datetime, result from cse311_project.`match`
    join cse311_project.team t on `match`.team_id = t.team_id join
    cse311_project.venue v on `match`.venue_id = v.venue_id;



insert into cse311_project.score(match_id, runs, wickets, catches) values (1, 100, 5, 3);

insert into cse311_project.score(match_id, runs, wickets, catches) values
((select match_id from cse311_project.`match` join cse311_project.team
    on `match`.team_id = team.team_id where team_name like 'MSH%' limit 1), 10, 2, 3);


insert into cse311_project.score(match_id, runs, wickets, catches) values
((select match_id from cse311_project.`match` join cse311_project.team
    on `match`.team_id = team.team_id where team_name like 'FTM%' limit 1), 50, 4, 2);

select * from cse311_project.score;

select score.score_id, match_id, team_name, player_name, runs, wickets, catches from
    cse311_project.score join cse311_project.team on score_id = team_id left outer join cse311_project.player
        p on score.score_id = p.score_id;


select * from cse311_project.player;
select * from cse311_project.team;
select * from cse311_project.role;

insert into cse311_project.role(role_desc) values ('Captain');

insert into cse311_project.player(player_name, team_id, role_id, jersey_number, score_id)
values ('Md Shakil Hossain', (select team_id from cse311_project.team where team_name like 'MSH%' limit 1),
        (select role_id from cse311_project.role where role_desc like 'Cap%' limit 1),
        9,
        2);

select score.score_id, match_id, team_name, player_name, runs, wickets, catches from
    cse311_project.score join cse311_project.team on score_id = team_id left outer join cse311_project.player
        p on score.score_id = p.score_id;


