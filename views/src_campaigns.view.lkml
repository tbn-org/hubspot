view: src_campaigns {
  sql_table_name: "HUBSPOT"."SRC_CAMPAIGNS" ;;

  dimension: hs_id {
    type: string
    sql: ${TABLE}."HS_ID" ;;
  }
  dimension: hs_name {
    type: string
    sql: ${TABLE}."HS_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [hs_name]
  }
}
