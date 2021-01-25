connection: "snowflake_tbn_dev"
label: "Hubspot"
include: "/views/*.view"

explore: ft_formsubmissions{
  persist_for: "8 hour"
  label: "Form Submissions"
  description: "Form Submissions"
}
