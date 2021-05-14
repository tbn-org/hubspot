view: src_contacts_id_google {
  view_label: "HS Contact"
  sql_table_name: "HUBSPOT"."SRC_CONTACTS_ID" ;;

  dimension: email {
    type: string
    sql: ${TABLE}."Email" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."First Name" ;;
  }

  dimension: form_submissions_aggregate {
    type: string
    sql: ${TABLE}."FormSubmissionsAggregate" ;;
    hidden: yes
  }

  dimension: identity_profiles_aggregate {
    type: string
    sql: ${TABLE}."IdentityProfilesAggregate" ;;
    hidden: yes
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."Last Name" ;;
  }

  dimension: list_name {
    label: "Contact List Name"
    type: string
    sql: ${src_contactlists.name} ;;
  }

  dimension_group: time_added_to_list {
    label: "Time Added to List"
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
    sql: ${src_contactlistmembers.time_added_to_list_raw} ;;
  }

  dimension: list_memberships_aggregate {
    type: string
    sql: ${TABLE}."ListMembershipsAggregate" ;;
    hidden: yes
  }

  dimension: vid {
    label: "Contact ID"
    type: number
    value_format_name: id
    sql: ${TABLE}."VID" ;;
  }

  dimension: cellphone {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."CellPhone" ;;
  }

  dimension: gcl_id {
    type: string
    sql: ${TABLE}."GCLID" ;;
  }
}
