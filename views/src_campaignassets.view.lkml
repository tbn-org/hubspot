view: src_campaignassets {
  sql_table_name: "HUBSPOT"."SRC_CAMPAIGNASSETS" ;;

  dimension: assetid {
    type: string
    sql: ${TABLE}."ASSETID" ;;
  }
  dimension: assetname {
    type: string
    sql: ${TABLE}."ASSETNAME" ;;
  }
  dimension: assettype {
    type: string
    sql: ${TABLE}."ASSETTYPE" ;;
  }
  dimension: campaignid {
    type: string
    sql: ${TABLE}."CAMPAIGNID" ;;
  }
  measure: count {
    type: count
    drill_fields: [assetname]
  }
}
