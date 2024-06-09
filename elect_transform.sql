insert overwrite table testdb.election_results_stg 
select 
Constituency,
cast(Const_No as int),
Leading_Candidate,
Leading_Party,
Trailing_Candidate,
Trailing_Party,
cast(Margin as bigint),
Status
from testdb.election_results_txt;