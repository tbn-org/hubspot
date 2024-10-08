view: campaign_details_bv {
  sql_table_name: "DONOR"."CAMPAIGN_DETAILS_BV" ;;

  dimension: camapignname_cd {
    type: string
    sql: ${TABLE}."CAMAPIGNNAME_CD" ;;
  }
  dimension: donorcnt_nbr {
    type: number
    sql: ${TABLE}."DONORCNT_NBR" ;;
  }
  dimension: elementgroup_cd {
    type: string
    sql: ${TABLE}."ELEMENTGROUP_CD" ;;
  }
  dimension: giftamount_amt {
    type: number
    sql: ${TABLE}."GIFTAMOUNT_AMT" ;;
  }
  dimension: giftcnt_nbr {
    type: number
    sql: ${TABLE}."GIFTCNT_NBR" ;;
  }
  dimension: sourcecode_cd {
    type: string
    sql: ${TABLE}."SOURCECODE_CD" ;;
  }
  dimension_group: transactiondate_dt {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."TRANSACTIONDATE_DT" ;;
  }
}
