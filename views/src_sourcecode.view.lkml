view: src_sourcecode {
  sql_table_name: "DONOR"."SRC_SOURCECODE" ;;

  dimension: effortdetail {
    type: string
    sql: ${TABLE}."EFFORTDETAIL" ;;
  }

  dimension: inboundeffort {
    type: string
    sql: ${TABLE}."INBOUNDEFFORT" ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: outboundeffort {
    type: string
    sql: ${TABLE}."OUTBOUNDEFFORT" ;;
  }

  dimension: programmer {
    type: string
    sql: ${TABLE}."PROGRAMMER" ;;
  }

  dimension: rocode {
    type: string
    sql: ${TABLE}."ROCODE" ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}."SERIES" ;;
  }

  dimension: sourcecode {
    type: string
    sql: ${TABLE}."SOURCECODE" ;;
    primary_key: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}."YEAR" ;;
  }

  dimension: package {
    type: string
    sql: ${TABLE}."PACKAGE" ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }

  dimension: envelope {
    type: string
    sql: ${TABLE}."ENVELOPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
