view: exit_pages {
  sql_table_name: `eb-seo.google_analytics_custom.exit_pages` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
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
    sql: ${TABLE}.exit_rate/100;;
    value_format_name: percent_2
  }
  measure: exits {
    type: sum
    sql: ${TABLE}.exits ;;
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  measure: count {
    type: count
  }
}
