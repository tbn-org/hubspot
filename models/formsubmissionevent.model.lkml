connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: src_contactformsubmission{
  persist_for: "8 hour"
  label: "Form Submission Events"
  description: "Form Submission Events"
  join: src_contacts_id {
    view_label: "Contacts"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id.vid} = ${src_contactformsubmission.vid};;
  }
}
