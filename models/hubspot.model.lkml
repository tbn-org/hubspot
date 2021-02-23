connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: ft_campaign{
  persist_for: "8 hour"
  label: "Campaign & Donation"
  description: "Campaign & Donation"
  join: lt_emailcampaign_donation {
    type: left_outer
    relationship: one_to_many
    sql_on: nvl(${lt_emailcampaign_donation.campaign_id},0) = nvl(${ft_campaign.campaign_id},0) and ${lt_emailcampaign_donation.campaign_code} = ${ft_campaign.campaign_code};;
    fields: []
  }
  join: src_contacts_id {
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id.vid} = ${lt_emailcampaign_donation.vid};;
  }
  join: src_accountmaster {
    type: inner
    relationship: many_to_one
    sql_on:${lt_emailcampaign_donation.accountnumber_id}=${src_accountmaster.account_number};;
    fields: []
  }
  join: transactions_lifetime_bv {
    type: inner
    relationship: many_to_many
    sql_on:${lt_emailcampaign_donation.accountnumber_id}=${transactions_lifetime_bv.accountnumber_id};;
    fields: []
  }
  join: ft_transactions {
    type: inner
    relationship: many_to_one
    sql_on:${lt_emailcampaign_donation.documentnumber_id}=${ft_transactions.documentnumber_id};;
  }
  join: donor_first_transactiondate {
    from: donor_first_last_transactiondate_bv
    type: left_outer
    relationship: many_to_many
    sql_on: ${donor_first_transactiondate.accountnumber_id}=${ft_transactions.accountnumber_id};;
    fields: []
  }
  join: ft_transactions_pre_after_bv {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ft_transactions.documentnumber_id} = ${ft_transactions_pre_after_bv.documentnumber_id};;
    fields: []
  }
  join: src_emailcampaignevent {
    type: left_outer
    relationship: one_to_many
    sql_on:${ft_campaign.campaign_id}=${src_emailcampaignevent.campaign_id};;
  }
  join: ft_formsubmissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id.vid} = ${ft_formsubmissions.vid};;
    fields: []
  }
  join: src_contactformsubmission {
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id.vid} = ${src_contactformsubmission.vid};;
  }
}
