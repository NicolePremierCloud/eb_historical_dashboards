view: all_pages {
  sql_table_name: `eb-seo.google_analytics_custom.all_pages` ;;
  measure: avg_time_on_page {
    type: average
    sql: ${TABLE}.avg_time_on_page / 86400 ;;
    value_format_name: hour_format
  }
  measure: bounce_rate {
    type: average
    sql: ${TABLE}.bounce_rate /100;;
    value_format_name: percent_2
  }
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  measure: entrances {
    type: sum
    sql: ${TABLE}.entrances ;;
  }
  measure: exit_rate {
    type: average
    sql: ${TABLE}.exit_rate/100 ;;
    value_format_name: percent_2
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  measure: page_value {
    type: sum
    sql: ${TABLE}.page_value ;;
    value_format_name: format_page_value
  }
  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
  measure: unique_pageviews {
    type: sum
    sql: ${TABLE}.unique_pageviews ;;
  }
  measure: count {
    type: count
  }
}
