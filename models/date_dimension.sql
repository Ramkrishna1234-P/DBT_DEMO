with CTE as (
select * from {{source('demo','bike')}}
)

select * from CTE;