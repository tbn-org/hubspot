view: src_wkt_videometadata {
  sql_table_name:  "TBN_DATA_DEV"."VOD"."SRC_WKT_VIDEOMETADATA"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: deleted {
    type: number
    sql: ${TABLE}."deleted" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."duration" ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}."genre" ;;
  }

  dimension_group: load_timestamp {
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
    sql: ${TABLE}."load_timestamp" ;;
  }

  dimension: posterthumbnail {
    type: string
    sql: ${TABLE}."posterthumbnail" ;;
  }

  dimension: presentation {
    type: string
    sql: ${TABLE}."presentation" ;;
  }

  dimension: seasonepisodenumber {
    type: number
    sql: ${TABLE}."seasonepisodenumber" ;;
  }

  dimension: seasonnumber {
    type: string
    sql: ${TABLE}."seasonnumber" ;;
  }

  dimension: seriesepisodenumber {
    type: number
    sql: ${TABLE}."seriesepisodenumber" ;;
  }

  dimension: seriesid {
    type: string
    sql: ${TABLE}."seriesid" ;;
  }

  dimension: seriestitle {
    type: string
    sql: ${TABLE}."seriestitle" ;;
    drill_fields: [seriestitle,  title, videoavailabledate_date]
  }

  dimension: tags {
    type: string
    sql: ${TABLE}."tags" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
    drill_fields: [seriestitle,  title, videoavailabledate_date]
  }

  dimension: titlecardthumbnail {
    type: string
    sql: ${TABLE}."titlecardthumbnail" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension_group: update_timestamp {
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
    sql: ${TABLE}."update_timestamp" ;;
  }

  dimension_group: videoavailabledate {
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
    sql: ${TABLE}."videoavailabledate" ;;
  }

  dimension_group: videoexpirationdate {
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
    sql: ${TABLE}."videoexpirationdate" ;;
  }

  dimension: franchise {
    type: string
    sql: ${TABLE}."franchise" ;;
  }

  dimension: presentation_temp_by_tag {
    type: string
    sql: case when upper(${TABLE}."tags") like '%LIVE FEED%' then 'Live Feed' else 'On-Demand' end ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
