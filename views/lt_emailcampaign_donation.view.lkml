view: lt_emailcampaign_donation {
  sql_table_name: "HUBSPOT"."LT_EMAILCAMPAIGN_DONATION"
    ;;

  dimension: accountnumber_id {
    label: ""
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
    hidden: yes
  }

  dimension: campaign_code {
    label: "Campaign Code"
    type: string
    sql: ${TABLE}."CAMPAIGN_CODE" ;;
  }

  dimension: campaign_id {
    label: "HS Email Campaign ID"
    type: number
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: documentnumber_id {
    type: number
    hidden: yes
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}."UTM_CAMPAIGN" ;;
  }

  dimension: vid {
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }


}
