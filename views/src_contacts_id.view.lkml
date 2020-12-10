view: src_contacts_id {
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
}
