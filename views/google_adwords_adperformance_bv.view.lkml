view: google_adwords_adperformance_bv {
  sql_table_name: "HUBSPOT"."GOOGLE_ADWORDS_ADPERFORMANCE_BV"
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

  dimension: contactcount {
    type: number
    sql: ${TABLE}."CONTACTCOUNT" ;;
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

  dimension: donation_amount {
    type: number
    sql: ${TABLE}."DONATION_AMOUNT" ;;
  }

  dimension: donation_count {
    type: number
    sql: ${TABLE}."DONATION_COUNT" ;;
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
    drill_fields: [id, campaign_name, ad_group_name]
  }
}
