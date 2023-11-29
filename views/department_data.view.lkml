view: department_data {
  sql_table_name: `dataset_in_us.department_data` ;;

  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }
  dimension: department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
  }
  dimension: employee {
    hidden: yes
    sql: ${TABLE}.EMPLOYEE ;;
  }
  dimension: location_id {
    type: number
    sql: ${TABLE}.LOCATION_ID ;;
  }
  dimension: manager_id {
    type: string
    sql: ${TABLE}.MANAGER_ID ;;
  }
  measure: count {
    type: count
    drill_fields: [department_name, department.department_name, department.department_id]
  }
}

view: department_data__employee {
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: EMPLOYEE_ID ;;
  }
  dimension: commission_pct {
    type: string
    sql: COMMISSION_PCT ;;
  }
  dimension: department_data__employee {
    type: string
    hidden: yes
    sql: department_data__employee ;;
  }
  dimension: department_id {
    type: number
    sql: DEPARTMENT_ID ;;
  }
  dimension: email {
    type: string
    sql: EMAIL ;;
  }
  dimension: first_name {
    type: string
    sql: FIRST_NAME ;;
  }
  dimension_group: hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: HIRE_DATE ;;
  }
  dimension: job_id {
    type: string
    sql: JOB_ID ;;
  }
  dimension: last_name {
    type: string
    sql: LAST_NAME ;;
  }
  dimension: manager_id {
    type: string
    sql: MANAGER_ID ;;
  }
  dimension: phone_number {
    type: string
    sql: PHONE_NUMBER ;;
  }
  dimension: salary {
    type: number
    sql: SALARY ;;
  }
}
