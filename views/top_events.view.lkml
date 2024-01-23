view: top_events {
  sql_table_name: `eb-seo.google_analytics_custom.top_events` ;;


  measure: Avg_Value {
    type: average
    sql: ${TABLE}.avg_event_value ;;
  }
  measure: avg_session_duration {
    type: average
    sql: ${TABLE}.avg_session_duration / 86400 ;;
    value_format_name: hour_format
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: event_action {
    type: string
    sql: ${TABLE}.event_action ;;
    drill_fields: [event_label]
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
    drill_fields: [category_drill*]
  }

  set: category_drill {
    fields: [event_label, event_action]
  }

  dimension: event_label {
    type: string
    sql: ${TABLE}.event_label ;;
  }
  measure: event_value {
    type: sum
    sql: ${TABLE}.event_value ;;
  }
  measure: New_Sessions {
    type: average
    sql: ${TABLE}.percent_new_sessions /100;;
    value_format_name: percent_2
  }

  measure: Sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }
  measure: Total_events {
    type: sum
    sql: ${TABLE}.total_events ;;
  }
  measure: Unique_events {
    type: sum
    sql: ${TABLE}.unique_events ;;
  }
  measure: count {
    type: count
  }
}
