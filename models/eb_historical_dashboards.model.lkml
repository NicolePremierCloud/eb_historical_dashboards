connection: "eb_historical_dashboards"
include: "/*/*.view.lkml"
datagroup: eb_historical_dashboards_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: hour_format {
  value_format: "[h]:mm:ss"
}

named_value_format: formatted_number {
  #value_format:"[<1000]0;[<1000000]0.0,\"K\";0.0,,\"M\""
  value_format:"0"
}
named_value_format: format_page_value {
  value_format: "[=0] \"$\"0.00;[<0.01]\"<$0.01\";\"$\"0.00"
}


explore: all_pages {}
explore: top_events {}

persist_with: eb_historical_dashboards_default_datagroup
