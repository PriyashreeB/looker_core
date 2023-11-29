connection: "test_connection"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: test_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_project_default_datagroup

explore: department {}

explore: department_data {
  join: department {
    type: left_outer 
    sql_on: ${department_data.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }
    join: department_data__employee {
      view_label: "Department Data: Employee"
      sql: LEFT JOIN UNNEST(${department_data.employee}) as department_data__employee ;;
      relationship: one_to_many
    }
}

explore: employee {
  join: department {
    type: left_outer 
    sql_on: ${employee.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }
}

