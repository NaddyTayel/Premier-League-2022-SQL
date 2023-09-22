--    Start Analysis Of The Premier League 2022

-- Number Of The Players In Premier League
select count(Player) NumOfPlayers
from [Player Info]

-- Num Of Clubs In Premier League
select count(Squad) NumOfClubs
from Teams

-- select all the data in the player info
select *
from [Player Info]

--older 10 player
select top 10 Pinfo.Player, Pstate.Club,Age
from [Player Info] Pinfo
join [Player Stats] Pstate
	on Pinfo.Player = Pstate.Player
--group by Player
order by Age desc

--Younger 10 player
select top 10 Pinfo.Player, Pstate.Club,Age
from [Player Info] Pinfo
join [Player Stats] Pstate
	on Pinfo.Player = Pstate.Player
--group by Player
order by Age 

-- taller 10 player 
select top 10 Pinfo.Height,Pinfo.Player, PState.Club
from [Player Info] Pinfo
join [Player Stats] PState
	on Pinfo.Player = PState.Player
group by Pinfo.Player,Pinfo.Height, Pstate.Club
order by Height desc

-- shorter 10 player
select top 10 Pinfo.Height,Pinfo.Player, PState.Club
from [Player Info] Pinfo
join [Player Stats] PState
	on Pinfo.Player = PState.Player
group by Pinfo.Player,Pinfo.Height, Pstate.Club
order by Height 

-- Avarage of the age in the Premier League
select avg(Age)as  AvgOfAge
from [Player Info] 

-- the 5 scorer 
select top 5 Goals ,Assists,Player
from [Player Stats]
group by Goals ,Player,Assists
order by Goals desc

-- More 5 assists => player
select top 5 Player,Assists, Club
from [Player Stats]
group by Assists, Player,Club
order by Assists desc

-- the 5 scorer width passes and shots and Shots_on_Target
select top 5 Player ,Goals,Assists,Passes,Shots,Shots_on_Target
from [Player Stats]
group by Goals ,Player,Assists,Passes,Shots,Shots_on_Target
order by Goals desc

--Avg of the headed goals
select Player,Club , Headed_Goals
from [Player Stats]
group by Headed_Goals,Player,Club
order by Headed_Goals desc

-- apperence of individual player (from top to bottom)
select Player, Club, Apperence
from [Player Stats]
group by Player,Club,Apperence
order by Apperence desc

-- apperence of individual player (from bottom to top)
select Player, Club, Apperence
from [Player Stats]
group by Player,Club,Apperence
order by Apperence 

--goalkeeper (cleansheets)
select Player,Club,Clean_Sheets
from [Player Stats]
where Clean_Sheets is not null
order by Clean_Sheets desc

--goalkeeper (cleansheets from apperence)
select Player,Club, Apperence,Clean_Sheets
from [Player Stats]
where Clean_Sheets is not null
order by Clean_Sheets desc

-- penalties scored for the club
select Club, Penalties_Scored
from [Player Stats]
where Penalties_Scored <> 0
order by Penalties_Scored desc

-- penalties scored for the players in the club
select Player,Club, Penalties_Scored
from [Player Stats]
where Penalties_Scored <> 0
order by Penalties_Scored desc

-- avarege of the salary for all club
select avg(Salary) as AvgSalary
from Salary

--sum all salary 
select sum(Salary) as SumSalary
from Salary

-- Top 10 players take a salary in premier league with his club and his nationality
select top 10 Sa.Player,Pinfo.Nationality,Pstate.Club,Sa.Salary
from Salary Sa
join [Player Info] Pinfo
	on Sa.Player = Pinfo.Player
join [Player Stats] Pstate
	on Sa.Player = Pstate.Player
group by Sa.Player,Pinfo.Nationality,Pstate.Club,Sa.Salary
order by Salary desc

-- Worest 10 players take a salary in the piemier league with his club and his nationality
select top 10 Sa.Player,Pinfo.Nationality,Pstate.Club,Sa.Salary
from Salary Sa
join [Player Info] Pinfo
	on Sa.Player = Pinfo.Player
join [Player Stats] Pstate
	on Sa.Player = Pstate.Player
group by Sa.Player,Pinfo.Nationality,Pstate.Club,Sa.Salary
order by Salary

-- the club who takes the premier league 2022
select top 1 Squad, Matches_Played,Wins, Draws,Losses,Goals_For,Goals_Against,Points
from Teams 
order by Points desc

--the first 3 clube in premier league and play champions league
select top 3 Squad, Matches_Played,Wins, Draws,Losses,Goals_For,Goals_Against,Points
from Teams
order by Points desc

-- the clubs that will play in champions league and eurpean league 
select top 6 Squad, Matches_Played,Wins, Draws,Losses,Goals_For,Goals_Against,Points
from Teams
order by Points desc

-- the clubs that was dropped 
select top 3 Squad, Matches_Played,Wins, Draws,Losses,Goals_For,Goals_Against,Points
from Teams
order by Points 


