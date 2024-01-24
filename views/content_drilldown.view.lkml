view: content_drilldown {
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

  set: page_drills{
    fields: [page_path_level_2, page_path_level_3, page_path_level_4, page_path]
  }

  dimension: page_path_level_1 {
    type: string
    sql: CONCAT('/', ARRAY(SELECT x FROM UNNEST(SPLIT(${TABLE}.page_path, '/')) AS x)[SAFE_OFFSET(1)], IF(ARRAY_LENGTH(SPLIT(${TABLE}.page_path, '/')) > 2, '/', '')) ;;
    drill_fields: [page_drills*]
  }
  dimension: page_path_level_2 {
    type: string
    sql: CONCAT('/', ARRAY(SELECT x FROM UNNEST(SPLIT(${TABLE}.page_path, '/')) AS x)[SAFE_OFFSET(2)], IF(ARRAY_LENGTH(SPLIT(${TABLE}.page_path, '/')) > 3, '/', '')) ;;
    drill_fields: [page_path_level_3]
  }
  dimension: page_path_level_3 {
    type: string
    sql: CONCAT('/', ARRAY(SELECT x FROM UNNEST(SPLIT(${TABLE}.page_path, '/')) AS x)[SAFE_OFFSET(3)], IF(ARRAY_LENGTH(SPLIT(${TABLE}.page_path, '/')) > 4, '/', '')) ;;
    drill_fields: [page_path_level_4]
  }
  dimension: page_path_level_4 {
    type: string
    sql: CONCAT('/', ARRAY(SELECT x FROM UNNEST(SPLIT(${TABLE}.page_path, '/')) AS x)[SAFE_OFFSET(4)], IF(ARRAY_LENGTH(SPLIT(${TABLE}.page_path, '/')) > 4, '/', '')) ;;
    drill_fields: [page_path]
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
