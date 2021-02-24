view: src_forms {
  sql_table_name: "HUBSPOT"."SRC_FORMS"
    ;;

  dimension: action {
    type: string
    sql: ${TABLE}."Action" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CreatedAt" ;;
  }

  dimension: cssclass {
    type: string
    sql: ${TABLE}."CSSClass" ;;
  }

  dimension: embedded_code {
    type: string
    sql: ${TABLE}."EmbeddedCode" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension: fields_aggregate {
    type: string
    sql: ${TABLE}."FieldsAggregate" ;;
  }

  dimension: follow_up_id {
    type: string
    sql: ${TABLE}."FollowUpId" ;;
  }

  dimension: form_field_groups_aggregate {
    type: string
    sql: ${TABLE}."FormFieldGroupsAggregate" ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}."GUID" ;;
  }

  dimension: ignore_current_values {
    type: yesno
    sql: ${TABLE}."IgnoreCurrentValues" ;;
  }

  dimension: is_deletable {
    type: yesno
    sql: ${TABLE}."IsDeletable" ;;
  }

  dimension: meta_data_aggregate {
    type: string
    sql: ${TABLE}."MetaDataAggregate" ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}."Method" ;;
  }

  dimension: migrated_from {
    type: string
    sql: ${TABLE}."MigratedFrom" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: notify_recipients {
    type: string
    sql: ${TABLE}."NotifyRecipients" ;;
  }

  dimension: performable_html {
    type: string
    sql: ${TABLE}."PerformableHTML" ;;
  }

  dimension: redirect {
    type: string
    sql: ${TABLE}."Redirect" ;;
  }

  dimension: submit_text {
    type: string
    sql: ${TABLE}."SubmitText" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UpdatedAt" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
