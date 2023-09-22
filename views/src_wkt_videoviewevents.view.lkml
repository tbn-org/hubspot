view: src_wkt_videoviewevents {
  sql_table_name: "TBN_DATA_DEV"."VOD"."SRC_WKT_VIDEOVIEWEVENTS";;


  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."sessionid"||'-'||${TABLE}."customerid"||'-'||${TABLE}."videoid"||'-'||${TABLE}."devicemodeltype"||'-'||${TABLE}."deviceos"
      ||'-'||${TABLE}."furthestvideosegment"||'-'||${TABLE}."videoeventstart"||'-'|| ${TABLE}."videoeventend" ;;

  }

  dimension: customerid {
    type: string
    sql: ${TABLE}."customerid" ;;
  }

  dimension: devicemodeltype {
    type: string
    sql: ${TABLE}."devicemodeltype" ;;
  }

  dimension: deviceos {
    type: string
    sql: ${TABLE}."deviceos" ;;
  }

  dimension: furthestvideosegment {
    type: number
    sql: ${TABLE}."furthestvideosegment" ;;
  }

  dimension_group: load_timestamp {
    type: time
    timeframes: [
      raw,
      time,time_of_day,day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."load_timestamp" ;;
  }

  dimension: percentagewatched {
    type: number
    sql: ${TABLE}."percentagewatched" ;;
  }

  dimension: sessionid {
    type: string
    sql: ${TABLE}."sessionid" ;;
  }

  dimension_group: update_timestamp {
    type: time
    timeframes: [
      raw,
      time,time_of_day,day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."update_timestamp" ;;
  }

  dimension: videoduration {
    type: number
    sql: ${TABLE}."videoduration" ;;
  }

  dimension_group: videoeventend {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,hour,hour_of_day,minute,minute5,minute15,minute30,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."videoeventend" ;;
  }

  dimension_group: videoeventstart {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,hour,hour_of_day,minute,minute5,minute15,minute30,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."videoeventstart" ;;
  }


  dimension_group: videoeventstart_est_temp {
    label: "videoeventstart_est_temp"
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,hour,hour_of_day,minute,minute5,minute15,minute30,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: convert_timezone('UTC', 'America/New_York',${TABLE}."videoeventstart"  );;
  }



  dimension: videoid {
    type: string
    sql: ${TABLE}."videoid" ;;
  }

  dimension: videoname {
    type: string
    sql: ${TABLE}."videoname" ;;
  }

  dimension: videosegment {
    type: string
    sql: ${TABLE}."videosegment" ;;
  }

  dimension: videoseriesid {
    type: string
    sql: ${TABLE}."videoseriesid" ;;
  }

  dimension: videoseriesname {
    type: string
    sql: ${TABLE}."videoseriesname" ;;
  }

  dimension: videotype {
    type: string
    sql: ${TABLE}."videotype" ;;
  }

  dimension: watchduration {
    type: number
    sql: ${TABLE}."watchduration" ;;
  }




  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: countrycode {
    type: string
    sql: ${TABLE}."countrycode" ;;
  }

  dimension: franchise {
    type: string
    sql: ${TABLE}."franchise" ;;
  }

  dimension: isvpn {
    type: yesno
    sql: ${TABLE}."isvpn" ;;
  }

  dimension: livechannel {
    type: string
    sql: ${TABLE}."livechannel" ;;
  }

  dimension_group: localviewtime {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,hour,hour_of_day,minute,minute5,minute15,minute30,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."localviewtime" ;;
  }
  dimension: metrocode {
    type: string
    sql: ${TABLE}."metrocode" ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}."postalcode" ;;
  }

  dimension: presentation {
    type: string
    sql: ${TABLE}."presentation" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region" ;;
  }

  dimension: us_state_cd {
    type: string
    map_layer_name: us_states
    sql:
    case

          when ${TABLE}."countrycode" = 'US'
          then decode(${TABLE}."region",
          'Alabama','AL',
      'Alaska','AK',
      'Arizona','AZ',
      'Arkansas','AR',
      'California','CA',
      'Colorado','CO',
      'Connecticut','CT',
      'Delaware','DE',
      'District of Columbia','DC',
      'Florida','FL',
      'Georgia','GA',
      'Hawaii','HI',
      'Idaho','ID',
      'Illinois','IL',
      'Indiana','IN',
      'Iowa','IA',
      'Kansas','KS',
      'Kentucky','KY',
      'Louisiana','LA',
      'Maine','ME',
      'Maryland','MD',
      'Massachusetts','MA',
      'Michigan','MI',
      'Minnesota','MN',
      'Mississippi','MS',
      'Missouri','MO',
      'Montana','MT',
      'Nebraska','NE',
      'Nevada','NV',
      'New Hampshire','NH',
      'New Jersey','NJ',
      'New Mexico','NM',
      'New York','NY',
      'North Carolina','NC',
      'North Dakota','ND',
      'Ohio','OH',
      'Oklahoma','OK',
      'Oregon','OR',
      'Pennsylvania','PA',
      'Rhode Island','RI',
      'South Carolina','SC',
      'South Dakota','SD',
      'Tennessee','TN',
      'Texas','TX',
      'Utah','UT',
      'Vermont','VT',
      'Virginia','VA',
      'Washington','WA',
      'West Virginia','WV',
      'Wisconsin','WI',
      'Wyoming','WY',
      ${TABLE}."region")
          else Null end ;;
  }




  dimension: timezone {
    type: string
    sql: ${TABLE}."timezone" ;;
  }










  measure: count {
    label: "View Count"
    type: count
    drill_fields: [measure_details*]
  }

  measure: count_live {
    label: "View Count Live"
    type: sum
    sql: case when ${src_wkt_videometadata.presentation} = 'live' then 1 else 0 end ;;
    drill_fields: [videoid, videoname]
  }

  measure: count_vod {
    label: "View Count VOD"
    type: sum
    sql: case when ${src_wkt_videometadata.presentation} = 'live' then 0 else 1 end ;;
    drill_fields: [measure_details*]
  }

  measure: VOD_viewership_ratio {
    label: "VOD Viewership Ratio"
    type: number
    value_format: "0.00\%"
    sql: ${count_vod}*100.00/ ${count} ;;

  }

  measure: count_distinct_videos {
    type: count_distinct
    sql: ${TABLE}."videoid" ;;
    drill_fields: [ videoid, videoname, src_wkt_videometadata.videoavailabledate_date   ]
  }

  measure: watchduration_secs {
    type: sum
    sql: ${TABLE}."watchduration" ;;
    drill_fields: [measure_details*]
  }

  measure: watchduration_secs_average {
    type: average
    sql: ${TABLE}."watchduration" ;;
    drill_fields: [measure_details*]
  }

  measure: watchduration_mins {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}."watchduration" / 60.00 ;;
    drill_fields: [measure_details*]
  }

  measure: watchduration_hrs {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}."watchduration" / 3600.00 ;;
    drill_fields: [measure_details*]
  }

  measure: watchduration_hrs_average {
    type: average
    value_format: "#,##0"
    sql: ${TABLE}."watchduration" / 3600.00 ;;
    drill_fields: [measure_details*]
  }



  measure: calc_watchduration_secs {
    type: sum
    sql:  datediff(second, ${videoeventstart_raw}, ${videoeventend_raw}) ;;
  }

  measure: calc_watchduration_mins {
    type: sum
    value_format: "#,##0.00"
    sql: datediff(second, ${videoeventstart_raw}, ${videoeventend_raw})/ 60.00 ;;
  }

  measure: calc_watchduration_hrs {
    type: sum
    value_format: "#,##0.00"
    sql: datediff(second, ${videoeventstart_raw}, ${videoeventend_raw}) / 3600.00 ;;
  }

  measure: calc_watchduration_hrs_average {
    type: average
    value_format: "#,##0.00"
    sql: datediff(second, ${videoeventstart_raw}, ${videoeventend_raw}) / 3600.00 ;;
  }


  measure: audience {
    type: count_distinct
    sql: ${TABLE}."customerid" ;;
    #  drill_fields: [videoeventstart_date, videoid, videoname, customerid, deviceos , count, watchduration]
  }

  measure: finishes {
    type: sum
    sql: case when ${TABLE}."percentagewatched" >= 0.9 then 1 else 0 end ;;
    drill_fields: [videoeventstart_date, videoid, videoname, customerid, deviceos , watchduration, percentagewatched]
  }

  measure: completion_percent {
    label: "Completion %"
    type: number
    value_format: "0.00\%"
    sql:  ${finishes} *100.00 /${count} ;;

  }

  measure: view_date_most_recent {
    type: date
    sql: max(${videoeventstart_date}) ;;
    drill_fields: [videoeventstart_date, videoid,videoname, customerid, deviceos , watchduration]
  }

  measure: view_date_first_time {
    type: date
    sql: min(${videoeventstart_date}) ;;
    drill_fields: [videoeventstart_date, videoid, videoname, customerid, deviceos , watchduration]
  }


  measure: videoeventstart_min {
    type: time
    sql: min(${videoeventstart_raw}) ;;
  }

  measure: videoeventend_max {
    type: time
    sql: max(${videoeventend_raw}) ;;
  }

  set: measure_details {
    fields: [src_wkt_videometadata.id, src_wkt_videometadata.title, src_wkt_videometadata.seriestitle , count,audience,watchduration_hrs, watchduration_mins]
  }
  }
