connection: "eb_historical_dashboards"

datagroup: eb_historical_dashboards_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eb_historical_dashboards_default_datagroup

