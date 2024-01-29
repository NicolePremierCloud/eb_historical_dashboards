view: comparision {
  sql_table_name: `eb-seo.google_analytics_custom.all_pages` ;;

  dimension: pageviews {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension_group: created {
    type: time
    view_label: "_PoP"
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
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

  measure: count {
    label: "Count of pageviews"
    type: count
    hidden: yes
  }
  measure: count_pageviews {
    label: "Count of orders"
    type: count_distinct
    sql: ${pageviews} ;;
    hidden: yes
  }

  measure: total_pageviews {
    label: "Total views"
    view_label: "_PoP"
    type: sum
    sql: ${pageviews} ;;
    drill_fields: [created_date]
  }
}
