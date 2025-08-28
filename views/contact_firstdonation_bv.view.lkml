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
  dimension: Time_to_Action_donation {
    label: "Time to Action - Donate"
    type: number
    sql:DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw});;
  }
  dimension: Time_to_Action_bucket_donation {
    label: "Time to Action Bucket- Donate"
    type: string
    sql:case when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>0 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=30 then '0–30 Days'
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>30 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=90 then '31–90 Days'
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>90 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=180 then '91–180 Days'
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>180 then '180+ Days'
        end;;
  }
  dimension: Time_to_Action_bucket_donation_sortkey {
    label: "Time to Action Bucket- Donate Sortkey"
    type: number
    sql:case when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>0 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=30 then 1
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>30 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=90 then 2
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>90 and DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})<=180 then 3
             when DATEDIFF(day,${src_contacts_id.create_date_raw},${contact_firstdonation_bv.first_donation_raw})>180 then 4
            else 5
        end;;
  }
  measure: contactcount {
    type: count_distinct
    sql: ${TABLE}."VID" ;;
  }
}
