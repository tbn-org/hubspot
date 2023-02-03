view: src_emailcampaign {
  sql_table_name: "HUBSPOT"."SRC_EMAILCAMPAIGN"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}."AppId" ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}."AppName" ;;
  }

  dimension: content_id {
    type: number
    sql: ${TABLE}."ContentId" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension_group: last_processing_finished {
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
    sql: ${TABLE}."LastProcessingFinishedAt" ;;
  }

  dimension_group: last_processing_started {
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
    sql: ${TABLE}."LastProcessingStartedAt" ;;
  }

  dimension_group: last_processing_state_change {
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
    sql: ${TABLE}."LastProcessingStateChangeAt" ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}."LastUpdatedTime" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: number_bounced {
    type: number
    sql: ${TABLE}."NumberBounced" ;;
  }

  dimension: number_click {
    type: number
    sql: ${TABLE}."NumberClick" ;;
  }

  dimension: number_deferred {
    type: number
    sql: ${TABLE}."NumberDeferred" ;;
  }

  dimension: number_delivered {
    type: number
    sql: ${TABLE}."NumberDelivered" ;;
  }

  dimension: number_dropped {
    type: number
    sql: ${TABLE}."NumberDropped" ;;
  }

  dimension: number_included {
    type: number
    sql: ${TABLE}."NumberIncluded" ;;
  }

  dimension: number_mtadropped {
    type: number
    sql: ${TABLE}."NumberMTADropped" ;;
  }

  dimension: number_open {
    type: number
    sql: ${TABLE}."NumberOpen" ;;
  }

  dimension: number_processed {
    type: number
    sql: ${TABLE}."NumberProcessed" ;;
  }

  dimension: number_queued {
    type: number
    sql: ${TABLE}."NumberQueued" ;;
  }

  dimension: number_sent {
    type: number
    sql: ${TABLE}."NumberSent" ;;
  }

  dimension: number_status_changed {
    type: number
    sql: ${TABLE}."NumberStatusChanged" ;;
  }

  dimension: number_unsubscribed {
    type: number
    sql: ${TABLE}."NumberUnsubscribed" ;;
  }

  dimension: processing_state {
    type: string
    sql: ${TABLE}."ProcessingState" ;;
  }

  dimension: sub_type {
    type: string
    sql: ${TABLE}."SubType" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."Subject" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }
}
