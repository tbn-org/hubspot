view: src_campaignassets {
  view_label: "Campaign Assets"
  sql_table_name: "HUBSPOT"."SRC_CAMPAIGNASSETS" ;;

  dimension: assetid {
    type: string
    label: "Asset ID"
    sql: ${TABLE}."ASSETID" ;;
  }
  dimension: assetname {
    label: "Asset Name"
    type: string
    sql: ${TABLE}."ASSETNAME" ;;
  }
  dimension: assettype {
    label: "Asset Type"
    type: string
    sql: ${TABLE}."ASSETTYPE" ;;
  }
  dimension: campaignid {
    label: "Campaign ID"
    type: string
    sql: ${TABLE}."CAMPAIGNID" ;;
  }
  measure: count {
    type: count
    drill_fields: [assetname]
  }
}
