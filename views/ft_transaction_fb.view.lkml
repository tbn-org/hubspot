view: ft_transactions_fb
{
  view_label: "Donation"
  sql_table_name: "DONOR"."FT_TRANSACTIONS"
    ;;

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

  measure: amount_amt_sum_fb {
    value_format: "$#,##0.00"
    label: "Donation Amount Sum FB"
    type: sum
    sql: case when ${facebook_originated_contact_bv.vid} is not null then ${TABLE}."AMOUNT_AMT" else 0 end ;;
  }

  dimension: documentnumber_id {
    label: "Document Number"
    primary_key: yes
    type: number
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }

  measure: donation_count {
    value_format: "#,##0"
    label: "Donation Count"
    type: count_distinct
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }
  measure: donation_count_fb {
    value_format: "#,##0"
    label: "Donation Count FB"
    type: count_distinct
    sql: case when ${facebook_originated_contact_bv.vid} is not null then ${TABLE}."DOCUMENTNUMBER_ID" end ;;
  }

  measure: donor_count {
    value_format: "#,##0"
    label: "Donor Count"
    type: count_distinct
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }
  measure: donor_count_fb {
    value_format: "#,##0"
    label: "Donor Count"
    type: count_distinct
    sql: case when ${facebook_originated_contact_bv.vid} is not null then ${TABLE}."ACCOUNTNUMBER_ID" end;;
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
}
