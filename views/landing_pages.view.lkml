view: landing_pages {
  sql_table_name: `eb-seo.google_analytics_custom.landing_pages` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  measure: avg_session_duration {
    type: average
    sql: ${TABLE}.avg_session_duration / 86400 ;;
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
  measure: goal_completions_all {
    type: average
    sql: ${TABLE}.goal_completions_all /100;;
    value_format_name: percent_2
  }
  measure: goal_conversion_rate_all {
    type: average
    sql: ${TABLE}.goal_conversion_rate_all /100;;
    value_format_name: percent_2
  }
  measure: goal_value_all {
    type: average
    sql: ${TABLE}.goal_value_all/100;;
    value_format_name: percent_2
  }
  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }
  measure: new_users {
    type: sum
    sql: ${TABLE}.new_users ;;
  }
  measure: pageviews_per_session {
    type: average
    sql: ${TABLE}.pageviews_per_session;;
  }
  measure: percent_new_sessions {
    type: average
    sql: ${TABLE}.percent_new_sessions/100;;
    value_format_name: percent_2
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }
  measure: count {
    type: count
  }
}
