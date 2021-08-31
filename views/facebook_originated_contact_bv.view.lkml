view: facebook_originated_contact_bv {
  sql_table_name: "HUBSPOT"."FACEBOOK_ORIGINATED_CONTACT_BV"
    ;;

  dimension: vid {
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
