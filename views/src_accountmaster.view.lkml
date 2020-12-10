view: src_accountmaster {
  sql_table_name: "DONOR"."SRC_ACCOUNTMASTER"
    ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."AccountNumber" ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}."AccountType" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FirstName" ;;
  }

  dimension: first_name_encrypt {
    type: string
    sql: ${TABLE}."FirstNameEncrypt" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LastName" ;;
  }

  dimension: last_name_encrypt {
    type: string
    sql: ${TABLE}."LastNameEncrypt" ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}."MiddleName" ;;
  }

  dimension: middle_name_encrypt {
    type: string
    sql: ${TABLE}."MiddleNameEncrypt" ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}."OrganizationName" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."Status" ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}."Suffix" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."Title" ;;
  }

}
