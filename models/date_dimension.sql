with CTE as (
select started_at from {{source('demo','bike')}}
)

select * from CTE;