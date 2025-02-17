view: src_campaigns {
  view_label: "Campaign"
  sql_table_name: "HUBSPOT"."SRC_CAMPAIGNS" ;;

  dimension: hs_id {
    type: string
    label: "Campaign ID"
    sql: ${TABLE}."HS_ID" ;;
  }
  dimension: hs_name {
    type: string
    label: "Campaign Name"
    sql: ${TABLE}."HS_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [hs_name]
  }
}
