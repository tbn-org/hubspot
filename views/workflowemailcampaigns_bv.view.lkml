view: workflowemailcampaigns_bv {
  sql_table_name: "HUBSPOT"."WORKFLOWEMAILCAMPAIGNS_BV" ;;

  dimension: emailcampaignid {
    type: string
    sql: ${TABLE}."EMAILCAMPAIGNID" ;;
  }
  dimension: emailcontentid {
    type: string
    sql: ${TABLE}."EMAILCONTENTID" ;;
  }
  dimension: flowid {
    type: string
    sql: ${TABLE}."FLOWID" ;;
  }
  dimension: flowname {
    type: string
    sql: ${TABLE}."FLOWNAME" ;;
  }
  measure: flow_count {
    type: count_distinct
    sql: ${TABLE}."FLOWID" ;;
  }
}
