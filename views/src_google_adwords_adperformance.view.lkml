view: src_google_adwords_adperformance {
  label: "Google Adwords Ad"
  sql_table_name: "HUBSPOT"."SRC_GOOGLE_ADWORDS_ADPERFORMANCE"
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Ad ID"
    primary_key: yes
    type: number
    sql: ${TABLE}."Id" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."AdGroupId" ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}."AdGroupName" ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}."AdType" ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  measure: clicks {
    type: number
    sql: sum(${TABLE}."Clicks") ;;
  }

  measure: cost {
    type: number
    sql: sum(${TABLE}."Cost") ;;
  }

  dimension_group: date {
    label: "Ad Ran "
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
    sql: ${TABLE}."Date" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: headline_part1 {
    type: string
    sql: ${TABLE}."HeadlinePart1" ;;
  }

  dimension: headline_part2 {
    type: string
    sql: ${TABLE}."HeadlinePart2" ;;
  }

  measure: impressions {
    type: number
    sql: sum(${TABLE}."Impressions") ;;
  }
}
