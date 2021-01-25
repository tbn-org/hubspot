connection: "snowflake_tbn_dev"

include: "/views/*.view"

explore: ft_formsubmissions{
  persist_for: "8 hour"
  label: "Form Submission"
  description: "Form Submission"
}
