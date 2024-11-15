view: ft_transactions_all
{
  view_label: "Donation"
  sql_table_name: "DONOR"."FT_TRANSACTIONS"
    ;;

  dimension: prim_key {
    type: string
    primary_key: yes
    sql: ${TABLE}."DOCUMENTNUMBER_ID"||${TABLE}."TRANSACTIONDATE_DT" ;;
    hidden: yes
  }

  dimension: accountnumber_id {
    label: "SE Account Number"
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension: amount_amt {
    value_format: "$#,##0.00"
    label: "Donation Amount"
    type: number
    sql: ${TABLE}."AMOUNT_AMT" ;;
  }

  measure: amount_amt_sum {
    value_format: "$#,##0.00"
    label: "Donation Amount Sum"
    type: number
    sql: sum(${TABLE}."AMOUNT_AMT") ;;
  }

  dimension: documentnumber_id {
    label: "Document Number"
    type: number
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }

  measure: donation_count {
    value_format: "#,##0"
    label: "Donation Count"
    type: count_distinct
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }

  measure: donor_count {
    value_format: "#,##0"
    label: "Donor Count"
    type: count_distinct
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }
  measure: donation_avg {
    value_format: "$#,##0.00"
    label: "Avg. Gift"
    type: number
    sql: sum(${TABLE}."AMOUNT_AMT")/count(distinct ${TABLE}."ACCOUNTNUMBER_ID") ;;
  }

  dimension: txncategory_cd {
    label: "TXN Category"
    type: string
    sql: ${TABLE}."TXNCATEGORY_CD" ;;
    hidden: yes
  }

  dimension: sourcecode_cd {
    label: "Souce Code"
    type: string
    sql: ${TABLE}."SOURCECODE_CD" ;;
  }

  dimension: sourceurl {
    label: "Souce URL"
    type: string
    sql: ${src_addtrandata.source_url} ;;
  }

  dimension: sourcecampaign {
    label: "Souce Campaign"
    type: string
    sql: ${src_addtrandata.campaign} ;;
  }

  dimension: utmcampaign {
    label: "UTM Campaign"
    type: string
    sql: ${src_addtrandata.utmcampaign} ;;
  }

  dimension: utmsource {
    label: "UTM Source"
    type: string
    sql: ${src_addtrandata.utmsource} ;;
  }

  dimension: utmcontent {
    label: "UTM Content"
    type: string
    sql: ${src_addtrandata.utmcontent} ;;
  }

  dimension: utmmedia {
    label: "UTM Media"
    type: string
    sql: ${src_addtrandata.utmmedia} ;;
  }

  dimension: utmterm {
    label: "UTM Term"
    type: string
    sql: ${src_addtrandata.utmterm} ;;
  }

  dimension_group: transactiondate_dt {
    label: "Donation"
    type: time
    timeframes: [
      date,
      month,
      year,
      day_of_week,
      week,
      raw
    ]
    sql: ${TABLE}."TRANSACTIONDATE_DT" ;;
  }
  dimension_group: pre_transactiondate_dt {
    label: "Previous Donation"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${ft_transactions_pre_after_bv.predate_raw} ;;
  }
  dimension_group: after_transactiondate_dt {
    label: "Following Donation"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${ft_transactions_pre_after_bv.afterdate_raw} ;;
  }
  dimension_group: first_transactiondate_dt {
    label: "Donor First Donation"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${donor_first_transactiondate.firsttransactiondate_raw} ;;
  }

  measure: lifetimevalue {
    value_format: "$#,##0"
    label: "Life Time Donation Amount"
    type: average
    sql: ${transactions_lifetime_bv.transactionamount} ;;
    drill_fields: [accountnumber_id,documentnumber_id,transactiondate_dt_date,amount_amt]
  }
  measure: lifetimecount {
    label: "Life Time Donation Count"
    type: average
    sql: ${transactions_lifetime_bv.transactioncount} ;;
    drill_fields: [accountnumber_id,documentnumber_id,transactiondate_dt_date,amount_amt]
  }
  dimension: newdonor {
    label: "New Donor"
    type: string
    sql: ${TABLE}."NEWDONOR_CD" ;;
  }
}
