view: src_emailcampaignevent {
  label: "HS Email Campaign Event"
  sql_table_name: "HUBSPOT"."SRC_EMAILCAMPAIGNEVENT"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: browser_family {
    type: string
    sql: ${TABLE}."BrowserFamily" ;;
  }

  dimension: browser_name {
    type: string
    sql: ${TABLE}."BrowserName" ;;
  }

  dimension: browser_producer {
    type: string
    sql: ${TABLE}."BrowserProducer" ;;
  }

  dimension: browser_producer_url {
    type: string
    sql: ${TABLE}."BrowserProducerUrl" ;;
  }

  dimension: browser_type {
    type: string
    sql: ${TABLE}."BrowserType" ;;
  }

  dimension: browser_url {
    type: string
    sql: ${TABLE}."BrowserUrl" ;;
  }

  dimension: browser_version {
    type: string
    sql: ${TABLE}."BrowserVersion" ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."CampaignId" ;;
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

  dimension: device_type {
    type: string
    sql: ${TABLE}."DeviceType" ;;
  }

  dimension: extra_url_parameters {
    type: string
    sql: ${TABLE}."ExtraUrlParameters" ;;
  }

  dimension: hmid {
    type: string
    sql: ${TABLE}."HMID" ;;
  }

  dimension: ipaddress {
    type: string
    sql: ${TABLE}."IPAddress" ;;
  }

  dimension: location_city {
    type: string
    sql: ${TABLE}."LocationCity" ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}."LocationCountry" ;;
  }

  dimension: location_state {
    type: string
    sql: ${TABLE}."LocationState" ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}."RecipientEmail" ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}."Referer" ;;
  }

  dimension_group: sent_by_created {
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
    sql: ${TABLE}."SentByCreatedAt" ;;
  }

  dimension: sent_by_id {
    type: string
    sql: ${TABLE}."SentById" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."Url" ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}."UserAgent" ;;
  }

  measure: count {
    label: "Event Count"
    type: count_distinct
    sql:  ${TABLE}."Id";;
    drill_fields: [id, browser_name, app_name]
  }
}
