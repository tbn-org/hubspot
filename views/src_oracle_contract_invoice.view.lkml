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

  dimension: transaction_number {
    primary_key: yes
    type: string
    sql: ${TABLE}."TRANSACTION_NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
