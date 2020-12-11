view: ft_transactions {
  view_label: "Donation"
  sql_table_name: "DONOR"."FT_TRANSACTIONS"
    ;;

  dimension: accountnumber_id {
    label: "SE Account Number"
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension: email {
    label: "Email"
    type: string
    sql: ${lt_emailcampaign_donation.email} ;;
  }

  dimension: amount_amt {
    value_format: "$#,##0"
    label: "Donation Amount"
    type: number
    sql: ${TABLE}."AMOUNT_AMT" ;;
  }

  measure: amount_amt_sum {
    value_format: "$#,##0"
    label: "Donation Amount Sum"
    type: number
    sql: sum(${TABLE}."AMOUNT_AMT") ;;
  }

  dimension: documentnumber_id {
    label: "Document Number"
    primary_key: yes
    type: number
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
    hidden: yes
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
  dimension: first_transaction_flag {
    label: "Is First Donation"
    type: yesno
    sql: case when ${donor_first_transactiondate.firsttransactiondate_raw}=${transactiondate_dt_raw} then true else false end ;;
  }
  measure: lifetimevalue {
    label: "Life Time Donation Amount"
    type: number
    sql: sum(${transactions_in_year_bv.transactionamount}) ;;
  }
  measure: lifetimecount {
    label: "Life Time Donation Count"
    type: number
    sql: sum(${transactions_in_year_bv.transactioncount}) ;;
  }
}
