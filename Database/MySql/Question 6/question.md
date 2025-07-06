# HackerRank Leaderboard Challenge

## Problem Description
Julia just finished conducting a coding contest and needs help assembling the leaderboard! Write a query to print the respective `hacker_id` and `name` of hackers who achieved full scores for more than one challenge. 

### Output Requirements:
- Order your output in descending order by the total number of challenges in which the hacker earned a full score
- If multiple hackers received full scores in the same number of challenges, sort them by ascending `hacker_id`

## Database Schema

### Tables:

1. **Hackers**
   | Column     | Type    |
   |------------|---------|
   | hacker_id  | Integer |
   | name       | String  |

2. **Difficulty**
   | Column           | Type    |
   |------------------|---------|
   | difficulty_level | Integer |
   | score            | Integer |

3. **Challenges**
   | Column           | Type    |
   |------------------|---------|
   | challenge_id     | Integer |
   | hacker_id        | Integer |
   | difficulty_level | Integer |

4. **Submissions**
   | Column        | Type    |
   |---------------|---------|
   | submission_id | Integer |
   | hacker_id     | Integer |
   | challenge_id  | Integer |
   | score         | Integer |

## Example

### Sample Output:

```
90411 Joe
````

### Explanation:
- Hacker 86870 got a score of 30 for challenge 71055 with difficulty level 2 (full score)
- Hacker 90411 got a score of 30 for challenge 71055 with difficulty level 2 (full score)
- Hacker 90411 got a score of 100 for challenge 66730 with difficulty level 6 (full score)

Only hacker 90411 managed to earn a full score for more than one challenge, so we print their `hacker_id` and `name`.

## Solution Approach
To solve this problem, you'll need to:
1. Join all four tables to match submissions with their maximum possible scores
2. Filter for submissions where the achieved score equals the maximum possible score
3. Count full-score challenges per hacker
4. Filter hackers with more than one full-score challenge
5. Apply the specified sorting

```sql
-- Sample solution query would go here
SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC;