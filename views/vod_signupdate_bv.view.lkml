view: vod_signupdate_bv {
  sql_table_name: "DONOR"."VOD_SIGNUPDATE_BV" ;;
  drill_fields: [id]

  dimension: id {
    label: "Okta ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }
  dimension: Time_to_Action_signup {
    label: "Time to Action - Signup"
    type: number
    sql:${vod_signupdate_bv.created_raw}-${src_contacts_id.create_date_raw};;
  }
  dimension: Time_to_Action_bucket_signup {
    label: "Time to Action Bucket - Signup"
    type: string
    sql:case when ${vod_signupdate_bv.created_raw}-${src_contacts_id.create_date_raw}<=30 then '0–30 Days'
             when ${vod_signupdate_bv.created_raw}-${src_contacts_id.create_date_raw}<=90 then '31–90 Days'
             when ${vod_signupdate_bv.created_raw}-${src_contacts_id.create_date_raw}<=180 then '91–180 Days'
             when ${vod_signupdate_bv.created_raw}-${src_contacts_id.create_date_raw}>180 then '180+ Days'
        end;;
  }
  dimension: Time_to_Action_donation {
    label: "Time to Action - Donate"
    type: number
    sql:${ft_transactions_all.transactiondate_dt_raw}-${src_contacts_id.create_date_raw};;
  }
  dimension: Time_to_Action_bucket_donation {
    label: "Time to Action Bucket- Donate"
    type: string
    sql:case when ${ft_transactions_all.transactiondate_dt_raw}-${src_contacts_id.create_date_raw}<=30 then '0–30 Days'
             when ${ft_transactions_all.transactiondate_dt_raw}-${src_contacts_id.create_date_raw}<=90 then '31–90 Days'
             when ${ft_transactions_all.transactiondate_dt_raw}-${src_contacts_id.create_date_raw}<=180 then '91–180 Days'
             when ${ft_transactions_all.transactiondate_dt_raw}-${src_contacts_id.create_date_raw}>180 then '180+ Days'
        end;;
  }
  dimension: apptype {
    label: "Subscription Type"
    type: string
    sql: ${TABLE}."APPTYPE" ;;
  }
  dimension_group: created {
    label: "Created"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED_DATE" ;;
  }
  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }
  measure: count {
    label: "User Count"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }
}
