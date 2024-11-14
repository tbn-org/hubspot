connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: ft_campaign{
  from:ft_campaign
  persist_for: "8 hour"
  label: "Hubspot Campaign & Donation"
  description: "Campaign & Donation"
  join: lt_emailcampaign_donation {
    type: left_outer
    relationship: one_to_many
    sql_on: nvl(${lt_emailcampaign_donation.campaign_id},0) = nvl(${ft_campaign.campaign_id},0) and ${lt_emailcampaign_donation.campaign_code} = ${ft_campaign.campaign_code};;
    fields: []
  }
  join: src_contacts_id {
    view_label: "HS Contact (donation)"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id.vid} = ${lt_emailcampaign_donation.vid};;
  }
  join: src_owners {
    type: left_outer
    relationship: many_to_one
    sql_on:to_char(${src_owners.owner_id})=${src_contacts_id.owner};;
    fields: []
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
    type: left_outer
    relationship: many_to_many
    sql_on:${src_addtrandata.document_number}=${ft_transactions.documentnumber_id};;
  }
  join: src_addtrandata {
    type: left_outer
    relationship: one_to_many
    sql_on:${src_addtrandata.campaign}=${ft_campaign.campaign_code}
            and ${src_addtrandata.utmsource}=${ft_campaign.utm_source};;
    fields: []
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
    view_label: "HS Campaign Event"
    type: left_outer
    relationship: one_to_many
    sql_on:${ft_campaign.campaign_id}=${src_emailcampaignevent.campaign_id};;
    fields: []
  }
  join: src_contacts_id2 {
    view_label: "HS Contact"
    type: left_outer
    relationship: many_to_one
    from: src_contacts_id
    sql_on: ${src_contacts_id2.email} = ${src_emailcampaignevent.recipient_email};;
    fields: []
  }
  join: ft_formsubmissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${src_contacts_id2.vid} = ${ft_formsubmissions.vid};;
  }
  join: src_contactlistmembers {
    view_label: "Contact List Member"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contacts_id.vid} = ${src_contactlistmembers.vid};;
    fields: []
  }
  join: src_contactlists {
    view_label: "Contact List"
    type: left_outer
    relationship: many_to_many
    sql_on: ${src_contactlists.list_id} = ${src_contactlistmembers.list_id};;
    fields: []
  }
}
