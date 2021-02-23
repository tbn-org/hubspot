connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: ft_formsubmissions{
  persist_for: "8 hour"
  label: "Form Submissions"
  description: "Form Submissions"
  join: src_contacts_id {
    view_label: "Contacts"
    type: left_outer
    relationship: many_to_one
    sql_on: ${src_contacts_id.vid} = ${ft_formsubmissions.vid};;
  }
}
