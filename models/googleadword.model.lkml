connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore:src_google_adwords_adperformance
{
  persist_for: "8 hour"
  label: "Google Adwords"
  description: "Google Adwords"

  join: google_adword_donations_bv {
    type: left_outer
    relationship: many_to_many
    sql_on:${src_google_adwords_adperformance.id}=${google_adword_donations_bv.kv_value} and ${google_adword_donations_bv.kv_name}='hsa_ad';;
    fields: []
  }
  join: src_addtrandata {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.transaction_id}=to_char(${google_adword_donations_bv.transaction_id});;
    fields: []
  }
  join: ft_transactions_google {
    type: left_outer
    relationship: one_to_one
    sql_on:${src_addtrandata.transaction_id}=${ft_transactions_google.documentnumber_id};;
  }
  join: transactions_lifetime_bv {
    type: inner
    relationship: many_to_many
    sql_on:${ft_transactions_google.accountnumber_id}=${transactions_lifetime_bv.accountnumber_id};;
    fields: []
  }
  join: donor_first_transactiondate {
    from: donor_first_last_transactiondate_bv
    type: left_outer
    relationship: many_to_many
    sql_on: ${donor_first_transactiondate.accountnumber_id}=${ft_transactions_google.accountnumber_id};;
    fields: []
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions_google.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
}
