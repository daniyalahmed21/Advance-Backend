SELECT S.hacker_id, H.name 
FROM Submissions as S 
join Challenges as C ON S.challenge_id = C.challenge_id
join Difficulty as D on C.difficulty_level = D.difficulty_level 
join Hackers as H on S.hacker_id = H.hacker_id
where S.Score = D.Score AND C.difficulty_level = D.difficulty_level
Group By S.hacker_id, H.name
Having Count(S.hacker_id)>1
Order By Count(S.hacker_id) DESC , H.hacker_id ASC;