view: daily_donation_allsources_bv {
  sql_table_name: "HUBSPOT"."DAILY_DONATION_ALLSOURCES_BV"
    ;;

  measure: donationamt_nbr {
    type: sum
    label: "Donation Amount"
    sql: ${TABLE}."DONATIONAMT_NBR" ;;
  }

  measure: donationcnt_nbr {
    type: sum
    label: "Donation Count"
    sql: ${TABLE}."DONATIONCNT_NBR" ;;
  }

  measure: donorcnt_nbr {
    type: sum
    label: "Donor Count"
    sql: ${TABLE}."DONORCNT_NBR" ;;
  }

  dimension_group: rundate_dt {
    type: time
    label: "RAN DATE"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RUNDATE_DT" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

}
