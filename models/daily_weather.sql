with daily_weather as (
select date(time) as weather_date,*
from {{ source('demo', 'weather') }}
),

daily_weather_agg as (
select
date(time) as weather_date,weather,count(weather),
row_number() over(partition by date(time) order by count(weather) desc) as rownumber
from {{ source('demo', 'weather') }}
where date(time) like '2017%'
group by 1,2
)
select * from daily_weather_agg where rownumber =1