view: donor_first_last_transactiondate_bv {
  label: "Donor First Transaction Date"
  sql_table_name: "DONOR"."DONOR_FIRST_LAST_TRANSACTIONDATE_BV"
    ;;

  dimension: accountnumber_id {
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension_group: firsttransactiondate {
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
    sql: ${TABLE}."FIRSTTRANSACTIONDATE" ;;
  }
  dimension_group: secondtransactiondate {
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
    sql: ${TABLE}."SECONDTRANSACTIONDATE" ;;
  }

  dimension_group: lasttransactiondate {
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
    sql: ${TABLE}."LASTTRANSACTIONDATE" ;;
  }

  dimension_group: lasttransactiondate12m {
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
    sql: ${TABLE}."LASTTRANSACTIONDATE12M" ;;
  }

  measure: donorcount {
    label: "Donor Count"
    type: count_distinct
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  measure: firstdonationamount {
    label: "First Donation Amount"
    type: sum
    sql: ${TABLE}."FirstTransactionAmount" ;;
  }
}
