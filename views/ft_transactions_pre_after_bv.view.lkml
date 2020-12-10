view: ft_transactions_pre_after_bv {
  label: "Previous and After Transaction"
  sql_table_name: "DONOR"."FT_TRANSACTIONS_PRE_AFTER_BV"
    ;;

  dimension: accountnumber_id {
    label: "Account Number"
    type: number
    sql: ${TABLE}."ACCOUNTNUMBER_ID" ;;
  }

  dimension: afteramount {
    label: "Following Transaction Amount"
    type: number
    sql: ${TABLE}."AFTERAMOUNT" ;;
  }

  dimension_group: afterdate {
    label: "Following Transaction"
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
    sql: ${TABLE}."AFTERDATE" ;;
  }

  dimension: aftersourcecode {
    label: "Following Source Code"
    type: string
    sql: ${TABLE}."AFTERSOURCECODE" ;;
  }

  dimension: afteraftersourcecode {
    label: "2nd Fllowing Source Code"
    type: string
    sql: ${TABLE}."AFTERAFTERSOURCECODE" ;;
  }


  dimension: aftertxncategory {
    label: "Following Category"
    type: string
    sql: ${TABLE}."AFTERTXNCATEGORY" ;;
  }

  dimension: afteraftertxncategory {
    label: "2nd Fllowing Category"
    type: string
    sql: ${TABLE}."AFTERAFTERTXNCATEGORY"" ;;
  }

  dimension: amount_amt {
    label: "Amount"
    type: number
    sql: ${TABLE}."AMOUNT_AMT" ;;
  }

  dimension: documentnumber_id {
    type: number
    sql: ${TABLE}."DOCUMENTNUMBER_ID" ;;
  }

  dimension: preamount {
    label: "Previous Amount"
    type: number
    sql: ${TABLE}."PREAMOUNT" ;;
  }

  dimension_group: predate {
    label: "Previous"
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
    sql: ${TABLE}."PREDATE" ;;
  }

  dimension: prepresourcecode {
    label: "2nd Previsou Source Code"
    type: string
    sql: ${TABLE}."PREPRESOURCECODE" ;;
  }

  dimension: presourcecode {
    label: "Previous Source Code"
    type: string
    sql: ${TABLE}."PRESOURCECODE" ;;
  }

  dimension: prepretxncategory {
    label: "2nd Previsou Category"
    type: string
    sql: ${TABLE}."PREPRETXNCATEGORY" ;;
  }

  dimension: pretxncategory {
    label: "Previous Category"
    type: string
    sql: ${TABLE}."PRETXNCATEGORY" ;;
  }

  dimension: sourcecode_cd {
    label: "Transaction Source Code"
    type: string
    sql: ${TABLE}."SOURCECODE_CD" ;;
  }

  dimension_group: transactiondate_dt {
    label: "Transaction"
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
    sql: ${TABLE}."TRANSACTIONDATE_DT" ;;
  }
}
