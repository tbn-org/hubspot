view: contact_firstdonation_bv {
  sql_table_name: "HUBSPOT"."CONTACT_FIRSTDONATION_BV" ;;

  dimension_group: create {
    label: "Create"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATE_DATE" ;;
  }
  dimension_group: first_donation {
    label: "First Donation"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."FIRST_DONATION_DATE" ;;
  }
  dimension: vid {
    label: "VID"
    type: number
    value_format_name: id
    primary_key: yes
    sql: ${TABLE}."VID" ;;
  }
  measure: Time_to_Action_donation {
    label: "Time to Action - Donate"
    type: average
    sql:DATEDIFF(day, ${contact_firstdonation_bv.create_raw},${src_contacts_id.create_date_raw});;
  }
  dimension: Time_to_Action_bucket_donation {
    label: "Time to Action Bucket- Donate"
    type: string
    sql:case when DATEDIFF(day, ${contact_firstdonation_bv.create_raw},${src_contacts_id.create_date_raw})<=30 then '0–30 Days'
             when DATEDIFF(day, ${contact_firstdonation_bv.create_raw},${src_contacts_id.create_date_raw})<=90 then '31–90 Days'
             when DATEDIFF(day, ${contact_firstdonation_bv.create_raw},${src_contacts_id.create_date_raw})<=180 then '91–180 Days'
             when DATEDIFF(day, ${contact_firstdonation_bv.create_raw},${src_contacts_id.create_date_raw})>180 then '180+ Days'
        end;;
  }
  measure: contactcount {
    type: count_distinct
    sql: ${TABLE}."VID" ;;
  }
}
