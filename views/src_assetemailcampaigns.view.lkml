view: src_assetemailcampaigns {
  view_label: "Asset Emailcampaigns"
  sql_table_name: "HUBSPOT"."SRC_ASSETEMAILCAMPAIGNS" ;;

  dimension: assetid {
    type: string
    sql: ${TABLE}."ASSETID" ;;
  }
  dimension: emailcampaignid {
    type: string
    sql: ${TABLE}."EMAILCAMPAIGNID" ;;
  }
}
