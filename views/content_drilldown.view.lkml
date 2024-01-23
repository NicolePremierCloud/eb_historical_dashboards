view: content_drilldown {
  sql_table_name: `eb-seo.google_analytics_custom.content_drilldown` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
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
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
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
  dimension: page_path_level_1 {
    type: string
    sql: ${TABLE}.page_path_level_1 ;;
  }
  dimension: page_path_level_2 {
    type: string
    sql: ${TABLE}.page_path_level_2 ;;
  }
  dimension: page_path_level_3 {
    type: string
    sql: ${TABLE}.page_path_level_3 ;;
  }
  dimension: page_path_level_4 {
    type: string
    sql: ${TABLE}.page_path_level_4 ;;
  }
  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
  measure: unique_pageviews {
    type: sum
    sql: ${TABLE}.unique_pageviews ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  measure: count {
    type: count
  }
}
