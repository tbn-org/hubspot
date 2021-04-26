view: src_google_adwords_adperformance {
  label: "Google Adword Ads"
  sql_table_name: "HUBSPOT"."SRC_GOOGLE_ADWORDS_ADPERFORMANCE"
    ;;
  drill_fields: [id]

  dimension: id {
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

  dimension: clicks {
    type: number
    sql: ${TABLE}."Clicks" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."Cost" ;;
  }

  dimension_group: date {
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

  dimension: impressions {
    type: number
    sql: ${TABLE}."Impressions" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ad_group_name, campaign_name]
  }
}
