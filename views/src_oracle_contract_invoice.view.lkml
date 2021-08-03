view: src_oracle_contract_invoice {
  label: "Oracle Contract Invoices"
  sql_table_name: "HUBSPOT"."SRC_ORACLE_CONTRACT_INVOICE"
    ;;

  dimension: book_title {
    type: string
    sql: ${TABLE}."BOOK_TITLE" ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}."CUSTOMER_EMAIL" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  measure: invoice_amount {
    type: sum

    sql: ${TABLE}."INVOICE_AMOUNT" ;;
  }

  dimension: project_number {
    type: string
    sql: ${TABLE}."PROJECT_NUMBER" ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."TRANSACTION_DATE" ;;
  }

  measure: days_to_close {
    label: "Days to Close"
    type: sum
    sql: datediff(day,${src_contactformsubmission.submissiontime},${TABLE}."TRANSACTION_DATE") ;;
  }

  dimension: transaction_number {
    primary_key: yes
    type: string
    sql: ${TABLE}."TRANSACTION_NUMBER" ;;
  }

  measure: count {
    type: count
    value_format: "#,##0"
    drill_fields: [customer_name]
  }

  measure:  avgamount{
    label: "Average Amount"
    type: number
    value_format: "$#,##0"
    sql:  ${invoice_amount}/${count};;
  }

  measure:  currentmonthcount{
    label: "Current Month Count"
    type: sum
    value_format: "#,##0"
    sql: case when month(${TABLE}."TRANSACTION_DATE")=month(CURRENT_DATE) then 1 else 0 end ;;
  }

  measure:  lastmonthcount{
    label: "Last Month Count"
    type: sum
    value_format: "#,##0"
    sql: case when month(${TABLE}."TRANSACTION_DATE")=month(add_months(CURRENT_DATE,-1)) then 1 else 0 end ;;
  }

  measure:  currentmonthamount{
    label: "Current Month Amount"
    value_format: "$#,##0"
    type: sum
    sql: case when month(${TABLE}."TRANSACTION_DATE")=month(CURRENT_DATE) then ${TABLE}."INVOICE_AMOUNT" else 0 end ;;
  }

  measure:  lastmonthamount{
    label: "Last Month Amount"
    value_format: "$#,##0"
    type: sum
    sql: case when month(${TABLE}."TRANSACTION_DATE")=month(add_months(CURRENT_DATE,-1)) then ${TABLE}."INVOICE_AMOUNT" else 0 end ;;
  }
}
